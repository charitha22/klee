#include <klee/klee.h>
#include <stdio.h>

#define SIZE 10

void to_upper(char *text) {
  for (int i = 0; i < SIZE; i++) {
    if ((text[i] >= 'a') & (text[i] <= 'z'))
      text[i] = text[i] - 'a' + 'A';
  }
}

void to_upper_branchless(char *text) {
  for (int i = 0; i < SIZE; i++) {
    unsigned is_lower = (text[i] >= 'a') & (text[i] <= 'z');
    unsigned diff = is_lower == 0 ? 0 : 'a' - 'A';
    text[i] = text[i] - diff;
  }
}

int main() {
  char text[SIZE];

  klee_make_symbolic(&text, sizeof(text), "text");

  // to_upper(text);
  to_upper_branchless(text);
  for (int i = 0; i < SIZE; i++)
    klee_assert(!((text[i] >= 'a') & (text[i] <= 'z')));

  return 0;
}
