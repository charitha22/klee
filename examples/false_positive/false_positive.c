#include <stdio.h>
#include <klee/klee.h>

int main() {
  int arr[10]; 
  int i;
  int y;
  klee_make_symbolic(&y, sizeof(y), "y");

  for(int j = 0; j < 10; j++) {
    if (y < 10){
      i = 8; 
      i++; 
      arr[i] = 10;
    } else {
      i = 9; 
      i++;
    }
  }
  //printf("Done! \n");

  return 0;
}
