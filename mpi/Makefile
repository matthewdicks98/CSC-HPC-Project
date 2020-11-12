particle_mpi: particle.c
	mpicc -openmpi-mp particle.c -o particle_mpi -lm

run_mpi: particle_mpi
	mpirun -np 1 particle_mpi 2000 100 100 64 1 50 0.05
	cat solution.txt
	python3 plot_solution.py solution.txt

run: particle_mpi
	./particle_mpi 2000 100 100 20 1
	cat solution.txt
	python3 plot_solution.py solution.txt
