#!/bin/bash
#SBATCH -J mpi_pi_approximation
#SBATCH -N 1
#SBATCH --time=00:10:00  # Adjust the time limit as needed

# Load the required mod
module load Python/3.8.2-GCCcore-9.3.0

# Define the Python script to run
python_script="python_s.py"  # Replace with the actual name of your Python script

# Loop through different total_points and number of cores
for total_points in 1000 10000 100000 1000000; do
    for num_cores in 1 2 4 8; do
        # Create a unique output file for each run
        output_file="output_${total_points}_${num_cores}.txt"

        # Run the MPI Python script
        mpirun -np ${num_cores} python ${python_script} ${total_points} > ${output_file}
    done
done

