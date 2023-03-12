#include <limits.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <klee/klee.h>

int minKey(int* key, bool* mstSet, int n)
{
    int min = INT_MAX;
    int min_index;
 
    for (int v = 0; v < n; v++) {
        if (mstSet[v] == false && key[v] < min) {
            min = key[v]; 
            min_index = v;
        }
    }
 
    return min_index;
}

void primMST(int *graph, int *parent, int *key, bool* mstSet, int n)
{
    for (int i = 0; i < n; i++) {
        key[i] = INT_MAX; 
        mstSet[i] = false;
    }
 
    key[0] = 0;
    parent[0] = -1;
 
    for (int count = 0; count < n - 1; count++) {
        int u = minKey(key, mstSet, n);
        mstSet[u] = true;
 
        for (int v = 0; v < n; v++)
            if (graph[u * n + v] && mstSet[v] == false
                && graph[u * n + v] < key[v]) {
                parent[v] = u; 
                key[v] = graph[u * n + v];
            }
    }
 
}

int main()
{
    int n = 5;
    int *graph = (int*)malloc(n*n*sizeof(int));
    int *parent = (int*)malloc(n*sizeof(int));
    int *key = (int*)malloc(n*sizeof(int));
    bool *mstSet = (bool*)malloc(n*sizeof(bool));
    klee_make_symbolic(graph, n*n*sizeof(int), "graph");
    primMST(graph, parent, key, mstSet, n);
}