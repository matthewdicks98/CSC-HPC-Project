#!/bin/sh
#SBATCH --account=icts
#SBATCH --partition=curie
#SBATCH --time=00:59:00
#SBATCH --nodes=4 --ntasks=32 --ntasks-per-node=8
#SBATCH --job-name="mPopulation"
#SBATCH --mail-user=mnsbon012@myuct.ac.za
#SBATCH --mail-type=ALL

module load mpi/openmpi-4.0.1

echo "cores, pop_size, num_particles, migration_interval, migration_rate, final_fitness, gen_count, elapsed, elapsed/gen_count" >> /home/hpc36/CSC_HPC_Project/Results/mpi/mpi_population.txt

make particle_mpi

# different population size
for i in 2000 5000 7000 10000 15000 30000 70000 100000
do 
	mpirun /home/hpc36/CSC_HPC_Project/mpi/particle_mpi $i 100 100 50 1 50 0.05 >> /home/hpc36/CSC_HPC_Project/Results/mpi/mpi_population.txt
	echo "mpi: $i population done" >> /home/hpc36/CSC_HPC_Project/Results/mpi/mpi_log.txt
done 

echo "-----" >> /home/hpc36/CSC_HPC_Project/Results/mpi/mpi_population.txt
echo "-----" >> /home/hpc36/CSC_HPC_Project/Results/mpi/mpi_log.txt

rm /home/hpc36/CSC_HPC_Project/mpi/particle_mpi
