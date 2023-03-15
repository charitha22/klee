
#include <stdio.h>
#include <stdlib.h>
#include <klee/klee.h>

void floyd_warshall(int *dist, int n) {
    for(int v = 0; v < n; v++) dist[v *n + v] = 0;
    for (int k = 0; k < n; k++) {
        for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
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