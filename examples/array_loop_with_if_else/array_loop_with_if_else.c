#include <stdio.h>
#include <klee/klee.h>

void foo(int *arr) {

  int temp;

  for(int i = 0; i < 10; i++) {
    if(arr[i] <= 2) {
      temp = arr[i];
      temp++;
      temp*=10;  
      temp-=15;
    } else {
      temp = arr[i];
      temp+=50;
      temp*=20;
      temp-=-5;
    }
  }
  
  // for(int i = 0; i < 10; i++) {
  //   printf("arr[%d]=%d\n", i, arr[i]);
  // }
}

int main() {
  int arr[10];

  // for(int i = 0; i < 20; i++) {
  //   scanf("%d", &arr[i]);
  // }

  klee_make_symbolic(&arr, sizeof(arr), "arr");

  foo(arr);
}
