#!/bin/sh

make particle_mpi

# test for differnt number of cores
for c in 1 2 4
do

    # test population sizes
    for i in 2000 4000 8000 16000 32000 64000
        do
            mpirun -np $c ./particle_mpi $i 100 100 20 1 50 0.05 >> Results2.0/mpi/mpi_population.txt
            echo "mpi$c: $i ppopulation done"
        done
    
    # test population sizes
    for i in 8 16 32 64 128
        do 
            mpirun -np $c ./particle_mpi 2000 100 100 $i 1 50 0.05>> Results2.0/mpi/mpi_particles.txt
            echo "mpi$c: $i particles done"
        done
done

rm ./particle_mpi