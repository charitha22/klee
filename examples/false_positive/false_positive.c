#include <stdio.h>
#include <klee/klee.h>

int main() {
  int arr[10]; 
  int i;
  int y[10];
  klee_make_symbolic(&y, sizeof(y), "y");
  //klee_make_symbolic(&arr, sizeof(arr), "arr");

  if (y[5] != 0){
    i = 8; 
    i++; 
    arr[i] = 10;
  } else {
    i = 9; 
    i++;
  }

  printf("Done! \n");

  return 0;
}
