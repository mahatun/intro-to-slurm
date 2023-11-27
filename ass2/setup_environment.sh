#!/bin/bash
#SBATCH -J setup_environment  # Job name
#SBATCH -o setup_environmentO.txt  # Name of stdout output file
#SBATCH -e setup_environmentE.txt  # Name of stderr error file
#SBATCH -p special  # Specify the partition or queue name
#SBATCH -N 1  # Total number of nodes (1 node for simplicity)
#SBATCH --ntasks-per-node=1  # Number of tasks (MPI processes) per node
#SBATCH --cpus-per-task=1  # Number of cores per task

# Load required modules
module load Python/3.8.2-GCCcore-9.3.0

# Create a virtual environment
python3 -m venv myenv

# Activate the virtual environment
source myenv/bin/activate

# Install necessary packages
pip install mpi4py numpy numba

# Deactivate the virtual environment
deactivate

