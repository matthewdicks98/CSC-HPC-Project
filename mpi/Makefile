particle_mpi: particle.c
	mpicc -openmpi-mp particle.c -o particle_mpi -lm

run_mpi: particle_mpi
	mpirun particle_mpi 2000 100 100 10 5 50 0.05
	cat solution.txt
	python3 plot_solution.py solution.txt

