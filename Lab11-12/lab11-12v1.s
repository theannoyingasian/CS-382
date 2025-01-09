.section .data
buffer: .space 16           
output_buffer: .space 16   
newline: .asciz "\n"        
done_msg: .asciz "done\n"   

.section .text

.global _start
_start:
    // Read input from the user
    mov     x0, #0          
    ldr     x1, =buffer     
    mov     x2, #16        
    mov     x8, #63         
    svc     #0              

    // Convert string to integer
    ldr     x1, =buffer     
    mov     x2, #0          
    mov     x3, #10         

convert_loop:
    ldrb    w4, [x1], #1    
    cmp     w4, #'0'       
    blt     end_convert     
    cmp     w4, #'9'        
    bgt     end_convert    
    sub     w4, w4, #'0'    
    mul     x2, x2, x3     
    add     x2, x2, x4      
    b       convert_loop    

end_convert:
    // Square the integer
    mul     x2, x2, x2      

    // Convert integer to string
    ldr     x1, =output_buffer + 15 
    mov     w5, #0          

save_terminator:
    strb    w5, [x1]        
    sub     x1, x1, #1     

convert_to_string:
    udiv    x5, x2, x3      
    msub    x6, x5, x3, x2 
    add     x6, x6, #'0'    
    strb    w6, [x1], #-1   
    mov     x2, x5          
    cbnz    x2, convert_to_string 

    add     x1, x1, #1      

print_result:
    mov     x0, #1          
    ldr     x1, =output_buffer
    mov     x2, #16         
    mov     x8, #64        
    svc     #0             

    // Print newline for an empty line
    mov     x0, #1         
    ldr     x1, =newline    
    mov     x2, #1          
    mov     x8, #64         
    svc     #0             


    // Exit program
    mov     x0, #0       
    mov     x8, #93         
    svc     #0              
