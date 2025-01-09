.data
// for outside of the circle P = 0, 0, C = 1,2 and R = 2
// below is for when in the circle
P: .quad 5, 5
C: .quad 4, 4
R: .quad 3
yes: .string "P is inside the circle.\n"
no: .string "P is outside the circle.\n"

.text
.global _start

_start:
    adr x9, P
    ldr x10, [x9]
    ldr x11, [x9, #8]

    adr x12, C
    ldr x13, [x12]
    ldr x14, [x12, #8]

    sub x16, x10, x13
    mul x16, x16, x16

    sub x17, x11, x14
    mul x17, x17, x17

    add x18, x16, x17

    adr x19, R
    ldr x19, [x19]
    mul x19, x19, x19

    cmp x18, x19
    ble goToYes

    adr x1, no
    b end

goToYes:
    adr x1, yes

end:
    mov x0, 1      
    ldr x2, [x1]   
    mov x3, 23     
    mov x8, 64     
    svc 0

    mov x8, 93 
    mov x0, 0     
    svc 0
