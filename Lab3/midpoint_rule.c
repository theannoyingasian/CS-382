/*
Himmat Garcha
I pledge my honor that I have abided by the Stevens Honor System
*/

#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

double function(double x) {
    return 1.5 * pow(x, 3.0) + 3.2 * pow(x, 2.0) - 4 * x + 13;
}

void approximate(double lower, int boxes, double upper) {
    double sum = 0;
    double inc = (upper - lower) / boxes;
    double prev = 0;
    int num_of_tries = 0;

    while (1) {
        sum = 0;
        // Calculate the riemann sum
        for (int i = 0; i < boxes; i++) {
            sum += inc * (function(lower + inc * i) + function(lower + inc * (i + 1))) / 2;
        }

        // so that the loop doesn't run indefinitely
        if (num_of_tries > 10) {
            printf("Error\n");
            break;
        }

        // breaks the loop if the difference is smaller than 0.0001
        if (fabs(sum - prev) < 1e-4) {
            break;
        }

        // update variables
        prev = sum;
        boxes *= 2;
        inc = (upper - lower) / boxes;
        num_of_tries++;
    }

    printf("Sum of Value: %.4lf\n", sum);
    printf("Previous Value: %.4lf\n", prev);
    printf("Difference of the value: %.6lf\n", fabs(sum - prev));
    printf("Number of boxes: %d\n", boxes);
}

int main(int argc, char const *argv[]) {
    if (argc != 4) {
        return 1;
    }
    approximate(atof(argv[1]), atoi(argv[3]), atof(argv[2]));
    return 0;
}
