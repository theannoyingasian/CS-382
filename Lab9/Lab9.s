.data
A:    .quad -120, 3, 47, 1102, -54, 22, -660   // Array of doublewords
n:    .quad 7                        // Length of the array
msg:  .asciz "Maximum value: %d\n"   // Message format

.text
.global _start

_start:
 
    ldr x7, =n
    ldr x7, [x7]

    ldr x1, =A

    ldr x0, [x1]
    
    mov x2, 1                 
    bl findMaxRec

    mov x12, x0                
    ldr x0, =msg               
    mov x1, x12                
    bl printf                  

    mov x8, 93                
    svc 0

findMaxRec:
    stp x29, x30, [sp, -16]!   
    mov x29, sp                

    cmp x2, x7
    bge end_recursion         


    ldr x3, [x1, x2, lsl #3]


    cmp x0, x3
    csel x0, x0, x3, gt        

 
    add x2, x2, 1
    bl findMaxRec

end_recursion:
    ldp x29, x30, [sp], 16     
    ret
