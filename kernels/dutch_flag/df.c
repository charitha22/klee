#include <stdio.h>
#include <klee/klee.h>

void swap(unsigned int* a, unsigned int* b){
    unsigned int tmp;
    tmp = *a;
    *a = *b;
    *b = tmp;
}

void flag(unsigned int *arr, unsigned int N){
    unsigned int i = 0;
    unsigned int j = 0;
    unsigned int k = N-1;

    while (j <= k) {
        if (arr[j] == 0){
            swap(arr+i, arr+j);           
            i++;
            j++;
        } else if (arr[j] == 2) {
            swap(arr+j, arr+k);
            k--;
        } else {
            j++;
        }
    }

}

int main() {
    unsigned int arr[10];

    klee_make_symbolic(&arr, sizeof(arr), "arr");
    for(int i = 0; i < 10; i++)
        klee_assume((arr[i] == 0) || (arr[i] == 1) || arr[i] == 2);
    flag(arr, 10);
    
    return 0;
}