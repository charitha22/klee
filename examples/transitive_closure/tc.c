
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <klee/klee.h>

void transitive_closure(bool *graph, int n) {
    for(int v = 0; v < n; v++) graph[v *n + v] = true;
    for (int k = 0; k < n; k++) {
        for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            bool d = graph[i * n + k] & graph[k * n + j];
            if (d | graph[i * n + j]) {
                graph[i * n + j] = d;
            }
        }
        }
    }
}

int main() {
    int n = 3;
    bool *graph = (bool*)malloc(n*n*sizeof(bool));
    klee_make_symbolic(graph, n*n*sizeof(int), "graph");
    transitive_closure(graph, n);
    return 0;
}