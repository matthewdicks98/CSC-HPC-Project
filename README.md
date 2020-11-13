# CSC_HPC_Project
Honours High Performance Computing project.

This project aimed to improve upon a given genetic algorithm (GA) and develop two subsequent parallel versions of it.
There are three different versions of the GA:
  serial
  openmp
  mpi
  
In order to compile and run all of the programs please ensure that the correct openMP and MPI compilers are available and edit the Makefiles if neccessary.
The Makefiles provided are configured to run on a Ubuntu Linux system.

# Serial
The serial GA can be found in the 'serial' directory along with its appropriate Makefile.
Once in the 'serial' directory you may compile and run the serial GA with the 'make run' command.
This will run the serial GA with the defualt parameters.
Upon completion a grid will be printed to a python file to visualise the final population.

If you with to run the serial GA with differnt paramter please edit the appropriate variables in the Makefile under 'run ./particle a b c d e' where a, b, c, d and e:
  a: population size
  b: x dimension of the grid
  c: y dimension of the grid
  d: number of particles
  e: number of iterations

To test the serial GA on a laptop the './serial_test.sh' command can be used from in the 'serial' directory.
This will run all the tests for varying population sizes and number of particles.

# openMP
The openMP GA can be found in the 'openmp' directory along with its appropriate Makefile.
Once in the 'openmp' directory you may compile and run the openmp GA with the 'make run_omp' command.
This will run the openmp GA with the default parameters.
Upon completion a grid will be printed to a python file to visualise the final population.
If you wish to run the openmp GA with different parameter please edit the appropriate variables in the Makefile under 'run ./particle a b c d e' where a, b, c, d and e are input parameters representing the following information:
  a: population size
  b: x dimension of the grid
  c: y dimension of the grid
  d: number of particles
  e: number of iterations
  
To test the omp GA on a laptop the './omp_test.sh' command can be used from in the 'openmp' directory.
This will run all the tests for varying population sizes and number of particles using 1, 2 and 4 threads.

# MPI
The MPI GA can be found in the 'mpi' directory along with its appropriate Makefile.
Once in the 'mpi' directory you may compile and run the mpi GA with the 'make run_mpi' command.
This will run the mpi GA with the default parameters. 
Upon completion a grid will be printed to a python file to visualise the final population.

If you wish to run the mpi GA with differnt parameters please edit the appropriate variable in the Makefile under 'mpirun particle a b c d e f g' where a, b, c, d, e, f and g are input parameters representing the following information:
  a: population size
  b: x dimension of the grid
  c: y dimension of the grid
  d: number of particles
  e: number of iterations
  f: migration interval
  g: migration rate (as a decimal percentage)

To test the mpi GA on a laptop the './mpi_test.sh' command can be used from in the 'mpi' directory.
This will run all the tests for varying population sizes and number of particles using 1, 2 and 4 processes.

# Experiments on the hpc
In order to run the relative experiments exploring the effects of different population sizes and number of particles across different cores slurm batch scripts were used.
These can be found in the 'experiments' directory.
The tests were edited as certain parameters led to the program timing out with the maximum 59 minute limit.
These scripts 


