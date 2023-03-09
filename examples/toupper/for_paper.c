#include <klee/klee.h>
#include <stdio.h>

#define SIZE 10

void to_upper(char *text) {
  for (int i = 0; i < SIZE; i++) {
    if ((text[i] >= 'a') & (text[i] <= 'z'))
      text[i] = text[i] - 'a' + 'A';
  }
}

void to_upper_dead_code(char *text) {
  for (int i = 0; i < SIZE; i++) {
    int t1, t2, t3, t4, t5, t6;
    if ((text[i] >= 'a') & (text[i] <= 'z')) {
      t1 = text[i] - 'a';
      t2 = t1 + 'A';
      t3 = text[i];
      text[i] = t2;
    }
    else {
      t4 = text[i] - 0;
      t5 = t4 + 0;
      t6 = text[i];
      text[i] = t6;
    }
  }
}

void to_upper_final(char *text) {
  for (int i = 0; i < SIZE; i++) {
    int s1, t1_t4, s2, t2_t5, t3_t6, s3;
    unsigned is_lower = (text[i] >= 'a') & (text[i] <= 'z');
    s1    = is_lower == 0 ? 0 : 'a'; // select
    t1_t4 = text[i] - s1;
    s2    = is_lower == 0 ? 0 : 'A'; // select
    t2_t5 = t1_t4 + s2;
    t3_t6 = text[i];
    s3    = is_lower == 0 ? t3_t6 : t2_t5; // select
    text[i] = s3;
  }
}

int main() {
  char text[SIZE];

  klee_make_symbolic(&text, sizeof(text), "text");

  // to_upper(text);
  to_upper_final(text);
  for (int i = 0; i < SIZE; i++)
    klee_assert(!((text[i] >= 'a') & (text[i] <= 'z')));

  return 0;
}
