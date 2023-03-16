
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
                #ifdef MERGE
                klee_open_merge();
                #endif
                if (d | graph[i * n + j]) {
                    graph[i * n + j] = d;
                }
                #ifdef MERGE
                klee_close_merge();
                #endif
            }
        }
    }
}

int main() {
    int n = SIZE;
    bool *graph = (bool*)malloc(n*n*sizeof(bool));
    klee_make_symbolic(graph, n*n*sizeof(bool), "graph");
    transitive_closure(graph, n);
    return 0;
}