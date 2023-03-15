#include <stdio.h>
#include "klee/klee.h"

void foo(int n1, int n2)
{
    //int n1, n2;

    //printf("Enter two positive integers: ");
    //scanf("%d %d",&n1,&n2);

    while(n1!=n2)
    {
        if(n1 > n2)
            n1 -= n2;
        else
            n2 += -n1;
    }
    //printf("GCD = %d",n1);

}

int main() {
  int n1, n2;
  klee_make_symbolic(&n1, sizeof(n1), "n1");
  klee_make_symbolic(&n2, sizeof(n2), "n2");

  klee_assume(n1 > 0 && n1 <= 10);
  klee_assume(n2 > 0 && n2 <= 10);

  foo(n1, n2);

  return 0;
}
