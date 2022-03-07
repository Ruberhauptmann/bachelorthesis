import re

def extract_times(searchlines, n_procs):
    cpu_time = 0
    wall_time = 0
    match_cputime = re.search("\d+.\d{2}", searchlines[-1])
    match_systime = re.search("\d+.\d{2}", searchlines[-2])
    match_walltime = re.search("\d+.\d{2}", searchlines[-3])
    if match_cputime:
        cpu_time = float(match_cputime[0])
    if match_systime:
        sys_time = float(match_systime[0])
    if match_walltime:
        wall_time = float(match_walltime[0])

    execution_time = (cpu_time + sys_time) / n_procs
    return execution_time, wall_time

def extract_nprocs(searchlines):
    """
    
    """
    n_procs = 0
    for line in searchlines:
        if "running on" in line:
            n_procs = re.search("[0-9]+", line).group(0)

    return n_procs
