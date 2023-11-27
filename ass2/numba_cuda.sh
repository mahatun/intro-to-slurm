#!/bin/bash
#SBATCH -J sum_of_squares_comparison  # Job name
#SBATCH -o sum_of_squares_comparisonO.txt # Name of stdout output file
#SBATCH -e sum_of_squares_comparisonE.txt  # Name of stderr error file
#SBATCH -p special  # Specify the partition or queue name
#SBATCH -N 1  # Total number of nodes (1 node for simplicity)
#SBATCH --ntasks-per-node=1  # Number of tasks (MPI processes) per node
#SBATCH --cpus-per-task=1  # Number of cores per task
#SBATCH --gres=gpu:1  # Request 1 GPU

# Load required modules
module load Python/3.8.2-GCCcore-9.3.0
module load CUDA/11.1.1

# Set the sizes of N for comparison
N_values=(10000 50000 100000 500000)

# Run the Numba version for CPU
for N in "${N_values[@]}"; do
  echo "Running Numba version for CPU with N=$N"
  python3 my_numba_script.py $N
done

# Run the CUDA version for GPU
for N in "${N_values[@]}"; do
  echo "Running CUDA version for GPU with N=$N"
  python3 cuda.py $N
done

