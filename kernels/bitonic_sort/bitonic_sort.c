#include <stdio.h>
#include <stdlib.h>
#include <klee/klee.h>

void merge_up(int *arr, int n) {
  int step = n / 2, i, j, k, temp;
  while (step > 0) {
    for (i = 0; i < n; i += step * 2) {
      for (j = i, k = 0; k < step; j++, k++) {
        #ifdef MERGE
        klee_open_merge();
        #endif
        if (arr[j] > arr[j + step]) {
          // swap
          temp = arr[j];
          arr[j] = arr[j + step];
          arr[j + step] = temp;
        }
        #ifdef MERGE
        klee_close_merge();
        #endif
      }
    }
    step /= 2;
  }
}

void merge_down(int *arr, int n) {
  int step = n / 2, i, j, k, temp;
  while (step > 0) {
    for (i = 0; i < n; i += step * 2) {
      for (j = i, k = 0; k < step; j++, k++) {
        #ifdef MERGE
        klee_open_merge();
        #endif
        if (arr[j] < arr[j + step]) {
          // swap
          temp = arr[j];
          arr[j] = arr[j + step];
          arr[j + step] = temp;
        }
        #ifdef MERGE
        klee_close_merge();
        #endif
      }
    }
    step /= 2;
  }
}

void printArray(int *arr, int n) {
  int i;

  printf("[%d", arr[0]);
  for (i = 1; i < n; i++) {
    printf(",%d", arr[i]);
  }
  printf("]\n");
}

int main(int argc, char **argv) {
  int n, *arr, i, s;
  n = SIZE;
  // allocate space and read all the numbers
  arr = (int *)malloc(n * sizeof(int));
  klee_make_symbolic((int *)arr, n * sizeof(int), "arr");
  
  // do merges
  for (s = 2; s <= n; s *= 2) {
    for (i = 0; i < n;) {
      merge_up((arr + i), s);
      merge_down((arr + i + s), s);
      i += s * 2;
    }
  }

}