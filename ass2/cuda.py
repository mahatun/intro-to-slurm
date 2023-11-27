import numba
from numba import cuda
import math
import timeit

@cuda.jit
def sum_of_square_root_gpu(start, end, result):
    thread_id = cuda.grid(1)
    stride = cuda.gridsize(1)

    total = 0
    for i in range(start + thread_id, end + 1, stride):
        total += math.sqrt(i ** 2)
    
    result[thread_id] = total

N = 100000  # Replace with your desired value of N
threads_per_block = 256
blocks_per_grid = (N + threads_per_block - 1) // threads_per_block

local_start = 1
local_end = N

num_threads = threads_per_block * blocks_per_grid
result = cuda.device_array(num_threads)

sum_of_square_root_gpu[blocks_per_grid, threads_per_block](local_start, local_end, result)
ts=timeit.default_timer()
sum_of_square_root_gpu[blocks_per_grid, threads_per_block](local_start, local_end, result)
te=timeit.default_timer()
print("cpu time is:", te - ts)

total_result = result.copy_to_host().sum()
print(f"The sum of squares from 1 to {N} is: {total_result}")
