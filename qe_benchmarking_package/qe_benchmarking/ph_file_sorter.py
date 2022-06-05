from copy import copy
import os
from distutils.dir_util import copy_tree

input_path = '/fastscratch/tsievers/si_ph_benchmark_images/'
times_in = os.path.join(input_path, 'output') 
frq_in = os.path.join(input_path, 'frq')

output_path = os.path.join(os.getenv('HOME'), 'Projects/bachelorthesis/2_phonons/silicon_benchmarks/si_bench_images')

times_out = os.path.join(output_path, 'out_files')
frq_out = os.path.join(output_path, 'frq')

os.makedirs(times_out, exist_ok=True)
os.makedirs(frq_out, exist_ok=True)

copy_tree(times_in, times_out)
copy_tree(frq_in, frq_out)
