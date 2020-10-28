#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <omp.h>
#include <time.h>

int main(void){

    int x[4][2] = {{1,2},{2,3},{3,4},{4,5}};
    int z, y;
    double r,tmp;
    int dist = 0;

    // fitness function test
    /*#pragma omp parallel for private(z, y, r, tmp)  reduction(+:dist)
    for(int i = 0; i<4-1; i++){
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
    return dist;*/

    // breeding test
    int i;
    int v[6];
    v[0] = 10;
    int q[6] = {1,1,1,1,1,1};
    #pragma omp parallel for private(i)
    for(i = 0; i<6; i+=2){
        unsigned int s = omp_get_thread_num();
        unsigned int a = omp_get_thread_num()+100;
        int one = rand_r(&s) %6;
        int two = rand_r(&a)%6;
        q[i] = v[one] - v[two];
        q[i+1] = v[two] + v[one];
        printf("Thread : %d i : %d one : %d two : %d val1 : %d val2 : %d\n", omp_get_thread_num(), i,
        one, two, v[one],v[two]);
    }
    for(int j = 0; j<6; j++){
        printf("%d\t",q[j]);
    }
    printf("\n");
}