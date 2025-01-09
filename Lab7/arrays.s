.data
    array:      .quad 2, 4, 8, 16
    array_len:  .quad 4
    sum:        .quad 0
    max:        .quad 0x8000000000000000
    option:     .quad 1
    k:          .quad 3
    printFunc: .asciz "sum = %d\n"
    printFunc2: .asciz "max = %d\n"

    .text
    .global _start

_start:
    ldr x1, =array_len
    ldr x1, [x1]
    ldr x2, =option
    ldr x2, [x2]
    cmp x2, 0
    bne option1
    ldr x3, =k
    ldr x3, [x3]
    cmp x3, x1
    ble loop_sum
    mov x3, x1

loop_sum:
    mov x0, 0
    mov x4, 0

sum_loop:
    cmp x4, x3
    bge end_sum_loop
    ldr x5, =array
    ldr x5, [x5, x4, lsl #3]
    add x0, x0, x5
    add x4, x4, 1
    b sum_loop

end_sum_loop:
    mov x12, x0
    adr x0, printFunc
    mov x1, x12
    bl printf
    b end_program

option1:
    mov x0, -1
    mov x4, 0

max_loop:
    cmp x4, x1
    bge end_max_loop
    ldr x5, =array
    ldr x5, [x5, x4, lsl #3]
    cmp x0, x5
    blt update_max
    b next_max

update_max:
    mov x0, x5

next_max:
    add x4, x4, 1
    b max_loop

end_max_loop:
    mov x12, x0
    adr x0, printFunc2
    mov x1, x12
    bl printf

end_program:
    mov x8, 93
    mov x0, 0 
    svc 0
