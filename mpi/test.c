#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <mpi.h>

int main(int argc, char *argv[])
{
    int myid, nodenum, status;

    // initialize mpi
    MPI_Init(&argc, &argv);               //Start MPI
    MPI_Comm_rank(MPI_COMM_WORLD, &myid); //get rank of node's process
    MPI_Comm_size(MPI_COMM_WORLD, &nodenum);

    int x[4] = {1 + myid, 2 + myid, 3 + myid, 4 + myid};
    
    int y[2] = {x[0],x[1]};

    printf("ID = %d | x[3] = %d\n", myid, x[3]);

    
    MPI_Send(y,2,MPI_INT,1-myid,0,MPI_COMM_WORLD);
    MPI_Recv(y, 2, MPI_INT, 1-myid, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
    //MPI_Bcast(y,2,MPI_INT,myid,MPI_COMM_WORLD);
    //MPI_Recv(y, 2, MPI_INT, 1 - myid, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);

    x[2] = y[0];
    x[3] = y[1];
    printf("ID = %d | x[3] = %d\n",myid,x[3]);

    MPI_Finalize();
    return 0;
}