particle: particle.c
	 /usr/bin/gcc -I/usr/include -L/usr/lib particle.c -o particle -lm

particle_omp: particle.c
	/usr/bin/gcc -I/usr/include -L/usr/lib particle.c -fopenmp -o particle_omp -lm

particle_omp_iter: particle_iter_parallel.c
	/usr/bin/gcc -I/usr/include -L/usr/lib particle.c -fopenmp -o particle_omp_iter -lm

run: particle
	./particle 2000 100 100 50 1
	cat solution.txt
	python3 plot_solution.py solution.txt

run_omp: particle_omp
	./particle_omp 2000 100 100 20 2
	cat solution.txt
	python3 plot_solution.py solution.txt

run_omp_iter: particle_omp_iter
	./particle_omp_iter 2000 100 100 20 2
	cat solution.txt
	python3 plot_solution.py solution.txt
