#!/bin/sh

make particle

# test population sizes
for i in 2000 4000 8000 16000 32000 64000
do
    ./serial/particle $i 100 100 20 1 >> Results2.0/serial/ser_population.txt
    echo "sequential: $i population done"
done

# test number of particles
for i in 8 16 32 64 128
    do 
        ./serial/particle 2000 100 100 $i 1 >> Results2.0/serial/ser_particles.txt
        echo "sequential: $i particles done"
    done

rm particle
