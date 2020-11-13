# CSC_HPC_Project
Honours High Performance Computing project.

This project aimed to improve upon a given genetic algorithm (GA) and develop two subsequent parallel versions of it.
There are three different versions of the GA:
  serial
  openmp
  mpi
  
In order to compile and run all of the programs please ensure that the correct openMP and MPI compilers are available and edit the batch scripts if neccessary.

# Serial
The serial GA can be found in the 'serial' directory along with its appropriate Makefile.
Once in the 'serial' directory you may run the make command.
Upon running the 'make particle' command the particle.c program will create the particle object. 
Once this is complete you may run the serial GA using a command such as 'run ./particle a b c d e' where a, b, c, d and e are input parameters representing the following information:
  a: population size
  b: x dimension of the grid
  c: y dimension of the grid
  d: number of particles
  e: number of iterations
This will run the serial program with the specified parameters.
Upon completion a grid will be printed to a python file to visualise the final population.

# openMP
The openMP GA can be found in the 'open' directory along with its appropriate Makefile.
Once in the 'omp' directory you may run the make command.
Upon running the 'make particle_omp' command the particle.c program will create the particle_omp object. 
Once this is complete you may run the openMP GA using a command such as 'run ./particle a b c d e' where a, b, c, d and e are input parameters representing the following information:
  a: population size
  b: x dimension of the grid
  c: y dimension of the grid
  d: number of particles
  e: number of iterations
This will run the openMP program with the specified parameters.
Upon completion a grid will be printed to a python file to visualise the final population.

# MPI
The MPI GA can be found in the 'mpi' directory along with its appropriate Makefile.
Once in the 'mpi' directory you may run the make command.
Upon running the 'make particle_omp' command the particle.c program will create the particle_omp object. 
Once this is complete you may run the openMP GA using a command such as 'run ./particle a b c d e f g' where a, b, c, d, e, f and g are input parameters representing the following information:
  a: population size
  b: x dimension of the grid
  c: y dimension of the grid
  d: number of particles
  e: number of iterations
  f: migration rate (as a decimal percentage)
  g: migration interval
This will run the openMP program with the specified parameters.
Upon completion a grid will be printed to a python file to visualise the final population.

