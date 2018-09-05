#include <stdio.h>

int func(int var) {
  printf("var = %d", var);
  return 0;
}

int main() {
  int var = 5;  
  func(var);
  return 0;
}
