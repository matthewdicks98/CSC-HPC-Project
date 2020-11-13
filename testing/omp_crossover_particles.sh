#!/bin/sh
#SBATCH --account=icts
#SBATCH --partition=curie
#SBATCH --time=00:59:00
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=32
#SBATCH --job-name="ocParticles"
#SBATCH --mail-user=mnsbon012@myuct.ac.za
#SBATCH --mail-type=ALL

echo "cores, pop_size, num_particles, final_fitness, gen_count, elapsed, elapsed/gen_count" >> /home/hpc36/CSC_HPC_Project/Results/omp/omp_crossover_particles.txt

make particle_omp_crossover

# different particle size
for i in 50 100 200 500 700 1000
do 
	export OMP_NUM_THREADS=32
	/home/hpc36/CSC_HPC_Project/openmp/particle_omp_crossover 5000 100 100 $i 1 >> /home/hpc36/CSC_HPC_Project/Results/omp/omp_crossover_particles.txt
	echo "omp_crossover: $i particles done" >> /home/hpc36/CSC_HPC_Project/Results/omp/omp_log.txt
done 

echo "-----" >> /home/hpc36/CSC_HPC_Project/Results/omp/omp_crossover_particles.txt
echo "-----" >> /home/hpc36/CSC_HPC_Project/Results/omp/omp_log.txt

rm /home/hpc36/CSC_HPC_Project/openmp/particle_omp_crossover
