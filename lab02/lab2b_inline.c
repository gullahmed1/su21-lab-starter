#include <stdio.h>

static inline int mul(int a, int b) {
  return a * b;
}

int main() {
  int a = 2, b = 2;
  int result = mul(a, b);
  printf("The result of multiplying %d and %d is %d", a, b, result);
  return 0;
}

