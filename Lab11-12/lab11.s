.section .data
buffer: .space 16   // Allocate space for the input string

.section .text
.global _start

_start:
    // Read input from the user
    MOV X0, 0        // File descriptor (stdin)
    LDR X1, =buffer  // Buffer to store the input
    MOV X2, 16       // Number of bytes to read
    MOV X8, 63       // System call number for read
    SVC 0            // Invoke the system call

    // Convert the string to an integer
    LDR X1, =buffer  // Load the address of the buffer into X1
    MOV X2, 0        // Initialize the result (integer) in X2

convert_loop:
    LDRB W3, [X1], 1    // Load a byte from the buffer and increment the pointer
    SUB W3, W3, '0'     // Convert ASCII character to integer
    CMP W3, #0          // Compare the character with null terminator
    B.EQ done           // If null terminator is reached, break the loop
    MUL X2, X2, 10      // Multiply the current result by 10
    ADD X2, X2, X3      // Add the new digit to the result
    B convert_loop      // Repeat the loop

done:
    MOV X0, X2          // Move the result to X0

    // Exit the program
    MOV X0, 0           // Exit status
    MOV X8, 93          // System call number for exit
    SVC 0               // Invoke the system call

