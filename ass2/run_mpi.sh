#!/bin/bash

# Load the required modules

module load Python/3.8.2-GCCcore-9.3.0

# Define the Python script to run
python_script="your_python_script.py"  # Replace with the actual name of your Python script

# Loop through the number of cores from 1 to 128
for num_cores in {1..128}; do
    # Create a unique SLURM batch script for each core count
    batch_script="batch_script_${num_cores}.sbatch"

    # Write the SLURM batch script content
    cat > "${batch_script}" <<EOL
#!/bin/bash
#SBATCH -J mpi_job
#SBATCH -N 1
#SBATCH -n ${num_cores}
#SBATCH --time=00:10:00  # Adjust the time limit as needed

# Load the required modules
module load OpenMPI/4.0.3-GCC-9.3.0
module load Python/3.8.2-GCCcore-9.3.0

# Run the MPI Python script
mpirun -np ${num_cores} python ${python_script}

EOL

    # Submit the SLURM batch script
    sbatch "${batch_script}"
done

