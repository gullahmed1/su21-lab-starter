#include <stdio.h>
#include "bit_ops.h"

/* Returns the Nth bit of X. Assumes 0 <= N <= 31. */
unsigned get_bit(unsigned x, unsigned n) {
    /* Shift x by n positions to the right and perform a bitwise AND with 1 to get the value of the nth bit */
    return (x >> n) & 1; 
}

/* Set the nth bit of the value of x to v. Assumes 0 <= N <= 31, and V is 0 or 1 */
void set_bit(unsigned *x, unsigned n, unsigned v) {
    /* Create a mask by left-shifting 1 by n positions, then use the bitwise AND operator with the bitwise NOT of the mask to set the nth bit of x to 0. Then use the bitwise OR operator with (v << n) & mask to set the nth bit of x to v. */
    int mask = 1 << n;
    *x &= ~mask;
    *x |= (v << n) & mask;
}

/* Flips the Nth bit in X. Assumes 0 <= N <= 31.*/
void flip_bit(unsigned *x, unsigned n) {
    /* Create a mask by left-shifting 1 by n positions, then use the bitwise XOR operator to flip the nth bit of x. */
     int mask = 1 << n;
    *x ^= mask;
}

