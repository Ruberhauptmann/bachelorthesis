import os
from distutils.dir_util import copy_tree

def sort_files(input_path, output_path):
    #input_path = '/fastscratch/tsievers/si_ph_benchmark_images/'
    times_in = os.path.join(input_path, 'output') 
    frq_in = os.path.join(input_path, 'frq')

    #output_path = os.path.join(os.getenv('HOME'), 'Projects/bachelorthesis/2_phonons/silicon_benchmarks/si_bench_images')

    times_out = os.path.join(output_path, 'out_files')
    frq_out = os.path.join(output_path, 'frq')

    os.makedirs(times_out, exist_ok=True)
    os.makedirs(frq_out, exist_ok=True)

    if input(f"{times_in} will be copied into {times_out}. Is that right? ").lower() in ["y", "yes"]:
        copy_tree(times_in, times_out)

    if input(f"{frq_in} will be copied into {frq_out}. Is that right? ").lower() in ["y", "yes"]:
        copy_tree(frq_in, frq_out)
