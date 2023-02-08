#include "klee/klee.h"
#include <stdio.h>
#include <stdlib.h>

short **allocate_image_array(length, width) long length, width;
{
  int i, j;

  short **the_array = (short **)malloc(length * sizeof(short *));
  for (i = 0; i < length; i++) {
    the_array[i] = (short *)malloc(width * sizeof(short));
    if (the_array[i] == NULL) {
      printf("\n\tmalloc of the_image[%d] failed", i);
    } /* ends if */
  }   /* ends loop over i */

  for (i = 0; i < length; i++)
    for (j = 0; j < width; j++)
      the_array[i][j] = 0;

  return (the_array);
}

int erosion(short **the_image, short **out_image, short value, int threshold,
            long rows, long cols) {
  int a, b, count, i, j, k;

  /***************************
   *
   *   Loop over image array
   *
   ****************************/

  for (i = 0; i < rows; i++)
    for (j = 0; j < cols; j++)
      out_image[i][j] = the_image[i][j];

  // printf("\n");

  for (i = 1; i < rows - 1; i++) {
    // if( (i%10) == 0) printf("%3d", i);
    for (j = 1; j < cols - 1; j++) {
      if (the_image[i][j] == value) {
        count = 0;
        for (a = -1; a <= 1; a++) {
          for (b = -1; b <= 1; b++) {
            if ((i + a) >= 0) {
              if (the_image[i + a][j + b] == 0)
                count++;
            }
          } /*  ends loop over b */
        }   /* ends loop over a */
        if (count > threshold) {
          out_image[i][j] = 0;
        }
      } /* ends if the_image == value */
    }   /* ends loop over j */
  }     /* ends loop over i */

  /*****
  fix_edges(out_image, 3, rows, cols);
  ***/
  return (1);
}

int main() {

  int i, j, mask_type, number;
  int threshold = 1;
  long length = 5;
  long width = 5;
  short value = 1;
  short **the_image;
  short **out_image;

  // klee_make_symbolic(&length, sizeof(long), "length");
  // klee_make_symbolic(&width, sizeof(long), "width");

  // klee_assume(2 < length);
  // klee_assume(length < 20);

  // klee_assume(2 < width);
  // klee_assume(width < 20);

  the_image = allocate_image_array(length, width);
  out_image = allocate_image_array(length, width);

  for (int i = 0; i < length; i++) {
    klee_make_symbolic(the_image[i], width * sizeof(short), "the_image");
  }

  erosion(the_image, out_image, value, threshold, length, width);

  return 0;
}
