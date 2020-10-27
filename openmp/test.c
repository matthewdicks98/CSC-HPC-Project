#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <omp.h>

int main(void){

    int x[4][2] = {{1,2},{2,3},{3,4},{4,5}};
    int z, y;
    double r,tmp;
    int dist = 0;
    //#pragma omp parallel
    #pragma omp parallel for private(z, y, r, tmp)  reduction(+:dist)
    for(int i = 0; i<4-1; i++){
    //#pragma omp parallel for
    #pragma omp parallel for private(z, y, r, tmp) reduction(+ : dist)
        for(int j = i + 1; j<4; j++){
            z = x[j][0] - x[i][0];
            y = x[j][1] - x[i][1];
            printf("Thread : %d i : %d j : %d dist : %d\n", omp_get_thread_num(), i, j, dist);
            r = sqrt((z * z) + (y * y));
            tmp = 2.0 / r;
            dist += (pow(tmp, 12) - pow(tmp, 6));
        }
        printf("dist = %d\n", dist);
    }
    printf("dist = %d\n", dist);
    return dist;
}