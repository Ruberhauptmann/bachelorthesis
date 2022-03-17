import re
import os
import numpy as np

def convert_to_seconds(hours, minutes, seconds=0):
    """Converts times in 00h00m00s format to seconds
    """
    if not hours:
        hours = 0
    else:
        hours = float(hours[:-1])
    if not minutes:
        minutes = 0
    else:
        minutes = float(minutes[:-1])
    if not seconds:
        seconds = 0
    else:
        seconds = float(seconds[:-1])

    #print(hours, minutes, seconds)

    return hours * 3600 + minutes * 60 + seconds

def search_times(searchlines, n_procs):
    cpu_time = 0
    sys_time = 0
    wall_time = 0
    execution_time = 0

    if searchlines[-1].split(" ")[0] == "sys":
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
    else:
        print("Time was not measured using time. Defaulting on Quantum Espresso times instead.")
        for line in searchlines:
            if "PWSCF        :" in line:
                #execution_time = convert_to_seconds(*re.findall("([ ,0-9]{1,2}h)?([ ,0-9]{1,2}m)?([ ,0-9]{1,2}.[0-9]{1,2}s)", line)[0])
                #wall_time = convert_to_seconds(*re.findall("([ ,0-9]{1,2}h)?([ ,0-9]{1,2}m)?([ ,0-9]{1,2}.[0-9]{1,2}s)", line)[1])
                execution_time = convert_to_seconds(*re.findall("([ ,0-9]{1,2}h)?([ ,0-9]{1,2}m|[ ,0-9]{1,2}.[0-9]{1,2}s)", line)[0])
                wall_time = convert_to_seconds(*re.findall("([ ,0-9]{1,2}h)?([ ,0-9]{1,2}m|[ ,0-9]{1,2}.[0-9]{1,2}s)", line)[1])

    return execution_time, wall_time

def search_nprocs(searchlines):
    """
    
    """
    n_procs = 0
    for line in searchlines:
        if "running on" in line:
            n_procs = re.search("[0-9]+", line).group(0)

    return n_procs

def extract_times(out_files_path, multiple_runs=False):
    if multiple_runs:
        runs = os.listdir(out_files_path)
    else:
        runs = [""]

    n_procs = np.zeros(len(os.listdir(out_files_path + "/" + runs[0])))
    walltimes = np.zeros((len(runs), len(os.listdir(out_files_path + "/" + runs[0]))))
    cputimes = np.zeros((len(runs), len(os.listdir(out_files_path + "/" + runs[0]))))

    for run_index, run in enumerate(runs):
        files = os.listdir(out_files_path + "/" + run)

        for file_index, file in enumerate(files):
            filepath = out_files_path + "/" + run + "/" + file
            with open(filepath, "r") as f:
                searchlines = f.readlines()
            n_procs[file_index] = search_nprocs(searchlines)
            cputimes[run_index, file_index], walltimes[run_index, file_index] = search_times(searchlines, n_procs[file_index])

        cputimes[run_index] = np.array(cputimes[run_index, n_procs.argsort()])
        walltimes[run_index] = np.array(walltimes[run_index, n_procs.argsort()])
        n_procs = n_procs[n_procs.argsort()]

        return cputimes, walltimes, n_procs

def extract_times_nk(out_files_path, multiple_runs=False):
    runs_nk = os.listdir(out_files_path)

    n_procs = {}
    walltimes = {}
    cputimes = {}

    for nk in runs_nk:
        n_procs[nk] = np.zeros(len(os.listdir(out_files_path + "/" + nk)))
        walltimes[nk] = np.zeros(len(os.listdir(out_files_path + "/" + nk)))
        cputimes[nk] = np.zeros(len(os.listdir(out_files_path + "/" + nk)))

        files = os.listdir(out_files_path + "/" + nk)

        for file_index, file in enumerate(files):
            filepath = out_files_path + "/" + nk + "/" + file
            with open(filepath, "r") as f:
                searchlines = f.readlines()
            n_procs[nk][file_index] = search_nprocs(searchlines)
            cputimes[nk][file_index], walltimes[nk][file_index] = search_times(searchlines, n_procs[nk][file_index])

        cputimes[nk] = np.array(cputimes[nk][n_procs[nk].argsort()])
        walltimes[nk] =  np.array(walltimes[nk][n_procs[nk].argsort()])
        n_procs[nk] = n_procs[nk][n_procs[nk].argsort()]

    return cputimes, walltimes, n_procs

