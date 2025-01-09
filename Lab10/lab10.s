//Himmat Garcha
//I pledge my honor that I have abided by the stevens honor system

.text
.global _start

_start:

adr x0, a
ldur d11, [x0] //lower bound

adr x0, b
ldur d12, [x0] //upper bound

adr x0, n
ldur d13, [x0] //num of rectangles 

fsub d14, d12, d11
fdiv d14, d14, d13
//gets space between rectangles/get d14

adr x0, zero
ldur d15, [x0]
ldur d19, [x0]
//sum 

adr x0, half
ldur d16, [x0] constant = .5

loop:
//i in current index aka d15
fcmp d15, d13 //if i >n exit
bge exit

//d17 current value of x
fadd d17, d15, d16 //i + .5
fmul d17, d17, d14
fadd da17, d17, d11 //(i+.5) * size of rectangle * the lower bound = current value of x

fmov d9, d17 //preps to call current val of x

