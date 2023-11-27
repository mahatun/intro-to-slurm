#!/bin/bash
#SBATCH --job-name=my_job         # Job name
#SBATCH --output=output.txt       # Output file name
#SBATCH --error=error.txt         # Error file name
#SBATCH --partition=your_partition # Specify the partition or queue name
#SBATCH --nodes=1                 # Number of nodes
#SBATCH --ntasks-per-node=1       # Number of tasks (MPI processes) per node
#SBATCH --time=00:10:00           # Wall clock time (hh:mm:ss)

# Your job commands go here
echo "Hello, SLURM!" > output.txt

