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
        uint8_t bit = (num >> i) & 1;
        display(bit);
    }
    putchar('\n');
}
int main(int argc, char const *argv[]) {
    int32_t x = 382;
    display_32(x);

    //bonus
    if(argc ==2){
        x = atoi(argv[1]);
        display_32(x);
    }
    return 0;
}
