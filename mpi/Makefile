particle_mpi: particle.c
	mpicc -openmpi-mp particle.c -o particle_mpi -lm

run_mpi: particle_mpi
	mpirun --use-hwthread-cpus particle_mpi 5000 100 100 30 1 100 0.1
	cat solution.txt
	python3 plot_solution.py solution.txt

run: particle_mpi
	./particle_mpi 2000 100 100 20 1
	cat solution.txt
	python3 plot_solution.py solution.txt
