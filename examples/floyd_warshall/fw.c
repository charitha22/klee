
#include <stdio.h>
#include <stdlib.h>
#include <klee/klee.h>

void floyd_warshall(int *dist, int n) {
    int i, j, k;
    for (k = 0; k < n; k++) {
        for (i = 0; i < n; i++) {
        for (j = 0; j < n; j++) {
            int d = dist[i * n + k] + dist[k * n + j];
            if (d < dist[i * n + j]) {
            dist[i * n + j] = d;
            }
        }
        }
    }
}

int main() {
    int n = 3;
    int *dist = (int*)malloc(n*n*sizeof(int));
    klee_make_symbolic(dist, n*n*sizeof(int), "dist");
    floyd_warshall(dist, n);
    return 0;
}