#!/bin/bash
#SBATCH -J mpi_job
#SBATCH -N 1
#SBATCH -n 96
#SBATCH --time=00:10:00  # Adjust the time limit as needed

# Load the required modules
module load OpenMPI/4.0.3-GCC-9.3.0
module load Python/3.8.2-GCCcore-9.3.0

# Run the MPI Python script
mpirun -np 96 python your_python_script.py

