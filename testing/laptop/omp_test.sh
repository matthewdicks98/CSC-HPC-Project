#!/bin/sh

make particle_omp

# test for different number of cores
for c in 1 2 4
do
    export OMP_NUM_THREADS=$c

    # test population sizes
    for i in 2000 4000 8000 16000 32000 64000
        do
            ./openmp/particle_omp $i 100 100 20 1 >> Results2.0/omp/omp_population.txt
            echo "omp_crossover$c: $i population done"
        done

    # test number of particles
    for i in 8 16 32 64 128
        do 
            ./openmp/particle_omp 2000 100 100 $i 1 >> Results2.0/omp/omp_particles.txt
            echo "omp_crossover$c: $i particles done"
        done
done

rm ./particle_omp
