#!/bin/bash
#SBATCH -J monte_carlo          # Job name
#SBATCH -o monte_carloO.txt   # Name of stdout output file
#SBATCH -e monte_carloE.txt   # Name of stderr error file
#SBATCH -p special    # Specify the partition or queue name
#SBATCH -N 1                    # Total number of nodes (1 node for simplicity)
#SBATCH --ntasks-per-node=1     # Number of tasks (MPI processes) per node
#SBATCH --cpus-per-task=1       # Number of cores per task
module unload gcc

# Load required modules
module load OpenMPI/4.0.3-GCC-9.3.0
module load Python/3.8.2-GCCcore-9.3.0

# Set the total points and number of cores
total_points_list=(1000 10000 100000 1000000)
cores_list=(1 2 4 8)

# Loop over total points and number of cores
for total_points in "${total_points_list[@]}"; do
  for cores in "${cores_list[@]}"; do
    echo "Running with total_points=$total_points and cores=$cores"
    
    # Run the Python script with MPI
    $(which mpirun) -np $cores python3 script.py $total_points
  done
done

