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
        #ifdef MERGE
        klee_open_merge();
        #endif
        if (mstSet[v] == false && key[v] < min) {
            min = key[v]; 
            min_index = v;
        }
        #ifdef MERGE
        klee_close_merge();
        #endif
    }
 
    return min_index;
}

int primMST(int *graph, int *parent, int *key, bool* mstSet, int n)
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
 
        for (int v = 0; v < n; v++) {
            #ifdef MERGE
            klee_open_merge();
            #endif
            if (graph[u * n + v] && mstSet[v] == false
                && graph[u * n + v] < key[v]) {
                parent[v] = u; 
                key[v] = graph[u * n + v];
            }
            #ifdef MERGE
            klee_close_merge();
            #endif
        }
    }
    // computing cost of the MST
    int minCost = 0;
    for (int i = 0; i < n; i++) {
        minCost += key[i];
    }
    return minCost;
}

#include <klee/klee.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct _edge {
  int u, v, wt;
} edge;

int comparator(const void *p, const void *q) // used by qsort()
{
  int l = ((edge *)p)->wt;
  int r = ((edge *)q)->wt;
  return (l - r);
}

void makeSet(int *parent, int *rank, int n) {
  for (int i = 0; i < n; i++) {
    parent[i] = i;
    rank[i] = 0;
  }
}

int findParent(int *parent, int component) {
#ifdef MERGE
  klee_open_merge();
#endif
  if (parent[component] == component) {
#ifdef MERGE
    klee_close_merge();
#endif
    return component;
  }

  return parent[component] = findParent(parent, parent[component]);
}

void unionSet(int u, int v, int *parent, int *rank, int n) {
  // this function unions two set on the basis of rank
  // as shown below
  u = findParent(parent, u);
  v = findParent(parent, v);
#ifdef MERGE
  klee_open_merge();
#endif

  if (rank[u] < rank[v]) {
    parent[u] = v;
  } else if (rank[u] < rank[v]) {
    parent[v] = u;
  } else {
    parent[v] = u;
    rank[u]++; // since the rank increases if the ranks of two sets are same
  }
#ifdef MERGE
  klee_close_merge();
#endif
}

int kruskal(edge *edges, int *parent, int *rank, int n) {
  // if cfm works with ulibc then we can keep the qsort and remove assumption
  qsort(edges, n, sizeof(edge), comparator);

  makeSet(parent, rank, n); // function to initialize parent[] and rank[]

  int minCost = 0; // to store the minimun cost

  for (int i = 0; i < n; i++) {
    int v1 = findParent(parent, edges[i].u);
    int v2 = findParent(parent, edges[i].v);
    int wt = edges[i].wt;

#ifdef MERGE
    klee_open_merge();
#endif
    if (v1 != v2) // if the parents are different that means they are in
                  // different sets so union them
    {
      unionSet(v1, v2, parent, rank, n);
      minCost += wt;
    }
#ifdef MERGE
    klee_close_merge();
#endif
  }

  return minCost;
}

// int main() {
//   int n = SIZE;
//   edge *edges = (edge *)malloc(n * sizeof(edge));
//   int *parent = (int *)malloc(n * sizeof(int));
//   int *rank = (int *)malloc(n * sizeof(int));

//   klee_make_symbolic(edges, n * sizeof(edge), "edges");
//   klee_make_symbolic(parent, n * sizeof(int), "parent");
//   klee_make_symbolic(rank, n * sizeof(int), "rank");

//   for (int i = 0; i < n; i++) {
//     klee_assume(edges[i].u >= 0);
//     klee_assume(edges[i].u < n);
//     klee_assume(edges[i].v >= 0);
//     klee_assume(edges[i].v < n);
//     klee_assume(edges[i].u != edges[i].v);
//     klee_assume(edges[i].wt >= 0);
//   }

//   /*for (int i = 0; i < n-1; i++) {*/
//   /*klee_assume(edges[i].wt <= edges[i+1].wt);*/
//   /*}*/

//   int minCost = kruskal(edges, parent, rank, n);
//   return 0;
// }


int main()
{
    int n = SIZE;
    int *graph = (int*)malloc(n*n*sizeof(int));
    int *parent = (int*)malloc(n*sizeof(int));
    int *key = (int*)malloc(n*sizeof(int));
    bool *mstSet = (bool*)malloc(n*sizeof(bool));
    klee_make_symbolic(graph, n*n*sizeof(int), "graph");
    
    for(int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++){
            klee_assume(graph[i * n + j] >= 0);
        }
    }

    int minCost = primMST(graph, parent, key, mstSet, n);

    return 0;
}