#!/bin/sh
#SBATCH --account=icts
#SBATCH --partition=curie
#SBATCH --time=00:59:00
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=32
#SBATCH --job-name="obPop"
#SBATCH --mail-user=mnsbon012@myuct.ac.za
#SBATCH --mail-type=ALL

echo "cores, pop_size, num_particles, final_fitness, gen_count, elapsed, elapsed/gen_count" >> /home/hpc36/CSC_HPC_Project/Results/omp/omp_breeding_population.txt

make particle_omp_breeding

# different population size
for i in 50000 70000 100000 150000
do 
	export OMP_NUM_THREADS=32
	/home/hpc36/CSC_HPC_Project/openmp/particle_omp_breeding $i 100 100 50 1 >> /home/hpc36/CSC_HPC_Project/Results/omp/omp_breeding_population.txt
	echo "omp_breeding: $i population done" >> /home/hpc36/CSC_HPC_Project/Results/omp/omp_log.txt
done 

echo "-----" >> /home/hpc36/CSC_HPC_Project/Results/omp/omp_breeding_population.txt
echo "-----" >> /home/hpc36/CSC_HPC_Project/Results/omp/omp_log.txt

rm /home/hpc36/CSC_HPC_Project/openmp/particle_omp_breeding
