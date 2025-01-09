.text
.global _start
_start:

    ldr x1, =x
    ldr x2, =y
    mov x7, #9999
    mov x8, #0
    mov x9, #9999
    mov x10, #0
    mov x11, #0
    mov x12, #0
    ldr x13, =n
    ldur x13, [x13]
    ldr x14, =maxval
    ldur d14, [x14]
    ldr x15, =minval
    ldur d15, [x15]

outterloop:
    cmp x11, x13
    bge exitoutterloop

    mov x12, #0

innerloop:
    cmp x12, x13
    bge end_innerloop
    cmp x11, x12
    beq skipoverlap

    mov x19, #8
    mul x17, x11, x19
    mul x18, x12, x19
    ldr d3, [x1, x17]
    ldr d4, [x2, x17]
    ldr d5, [x1, x18]
    ldr d6, [x2, x18]

    bl relativedistance

    fcmp d0, d14
    ble skipcondone

    mov x8, x11
    mov x10, x12
    fmov d14, d0

skipcondone:
    fcmp d0, d15
    bge skipcondtwo
    mov x7, x11
    mov x9, x12
    fmov d15, d0

skipcondtwo:
skipoverlap:
    add x12, x12, #1
    b innerloop

end_innerloop:
    add x11, x11, #1
    b outterloop

exitoutterloop:
    mov x1, x7
    mov x2, x9
    mov x3, x8
    mov x4, x10
    adr x0, printy
    bl printf
    mov x0, #0
    mov w8, #93
    svc #0

relativedistance:
    fsub d5, d5, d3
    fsub d6, d6, d4
    fmul d5, d5, d5
    fmul d6, d6, d6
    fadd d0, d6, d5
    br x30

.data
printy: .string "Shortest distance: (%ld,%ld). Longest distance: (%ld,%ld).\n"
minval: .double 999.0
maxval: .double 0.0
zeroconst: .quad 0
n: .dword 8
x: .double 0.0, 0.4140, 1.4949, 5.0014, 6.5163, 3.9303, 8.4813, 2.6505
y: .double 0.0, 3.9862, 6.1488, 1.047, 4.6102, 1.4057, 5.0371, 4.1196
.end
