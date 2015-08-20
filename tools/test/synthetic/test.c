#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <time.h>

#define N 1000

#define FT_TYPE float

void init(float A[], float B[], float C[]) {
    srand(time(NULL));
    for (int i = 0; i < N; i++) {
        A[i] = 1.0 * (i);
        B[i] = rand();
        C[i] = rand();
    }
}

int main() {
    float A[N];// = {1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0};
    float B[N];// = {0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0};
    float C[N];
    float D[N];

    init(A, B, C);

    int i, j;

    for (i = 0; i < N; i+=2) {
//      for (j = 0; j < 100; j++)
        C[i] = A[i] + B[i];
//        D[i] = A[i] + sin(B[i]);
  //      C[i] += A[i] - D[i];
  //      D[i] += C[i] * A[i];
    }

    for (i = 0; i < N; i++) {
        printf("%lf ", C[i]);
    }

    return 1;
}

