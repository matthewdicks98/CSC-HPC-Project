#!/bin/sh
#SBATCH --account=icts
#SBATCH --partition=curie
#SBATCH --time=00:59:00
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=32
#SBATCH --job-name="sPop"
#SBATCH --mail-user=mnsbon012@myuct.ac.za
#SBATCH --mail-type=ALL

echo "cores, pop_size, num_particles, final_fitness, gen_count, elapsed, elapsed/gen_count" >> /home/hpc36/CSC_HPC_Project/Results2.0/serial/ser_population.txt

make particle

# different population size
for i in 2000 4000 8000 16000 32000 64000
do 
	/home/hpc36/CSC_HPC_Project/serial/particle $i 100 100 20 1 >> /home/hpc36/CSC_HPC_Project/Results2.0/serial/ser_population.txt
	echo "omp: $i population done" >> /home/hpc36/CSC_HPC_Project/Results2.0/serial/ser_log.txt
done 

echo "-----" >> /home/hpc36/CSC_HPC_Project/Results2.0/serial/ser_population.txt
echo "-----" >> /home/hpc36/CSC_HPC_Project/Results2.0/serial/ser_log.txt

rm /home/hpc36/CSC_HPC_Project/serial/particle
