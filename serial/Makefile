particle: particle.c
	 /usr/bin/gcc -I/usr/include -L/usr/lib particle.c -o particle -lm

run: particle
	./particle 2000 100 100 20 1
	cat solution.txt
	python3 plot_solution.py solution.txt



