#include <stdio.h>
#include <klee/klee.h>

#define SIZE 15

void convert_to_upper(char *text) {

  for (int i = 0; i < SIZE; i++) {
    if ((text[i] >= 'a') & (text[i] <= 'z'))
      text[i] = text[i] - 'a' + 'A';
  }

}

int main() {
  char text[SIZE];

  klee_make_symbolic(&text, sizeof(text), "text");

  convert_to_upper(text);

  for (int i = 0; i < SIZE; i++)
    klee_assert(!((text[i] >= 'a') & (text[i] <= 'z')));

  return 0;
}
