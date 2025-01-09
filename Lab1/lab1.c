
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>


// Himmat Garcha
// I pledge my honor that I have abided by the stevens honor system


void display(int8_t bit) {
    putchar(bit + 48);
}

void display_32(int32_t num) {
    for (int i = 31; i >= 0; i--) {
        int8_t bit = (num >> i) & 1; 
        display(bit);
    }
    printf("\n");
}

int main(int argc, char const *argv[]) {
    display_32(382);
    display_32(-383);
    return 0;
}
