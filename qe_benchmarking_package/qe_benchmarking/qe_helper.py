import re
import os
import numpy as np

def convert_to_seconds(hours, minutes, seconds=0):
    return hours * 3600 + minutes * 60 + seconds

def separate_time_string(time_string):
    if "h" in time_string:
        hours = float(re.search("\d+(?=h)", time_string)[0])
        minutes = float(re.search("\d+(?=m)", time_string)[0])
        seconds = 0
    elif "m" in time_string:
        hours = 0
        minutes = float(re.search("\d+(?=m)", time_string)[0])
        seconds = float(re.search("\d+[.]\d+(?=s)", time_string)[0])
    else:
        hours = 0
        minutes = 0
        seconds = float(re.search("\d+[.]\d+(?=s)", time_string)[0])

    return hours, minutes, seconds

def search_times(searchlines, type="pw"):
    wall_time = 0
    execution_time = 0

    search_string = {"pw": "PWSCF        :", 
                     "ph": "PHONON       :"}

    for line in searchlines:
        if search_string[type] in line:
            execution_time_string = re.search("(?<=:).*(?=CPU)", line)[0].strip()
            wall_time_string = re.search("(?<=CPU).*(?=WALL)", line)[0].strip()

            execution_time = convert_to_seconds(*separate_time_string(execution_time_string))
            wall_time = convert_to_seconds(*separate_time_string(wall_time_string))

    return execution_time, wall_time

def search_nprocs(searchlines):
    n_procs = 0
    for line in searchlines:
        if "running on" in line:
            n_procs = re.search("[0-9]+", line).group(0)

    return n_procs

def extract_times(out_files_path, type="pw", multiple_runs=False):
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
            cputimes[run_index, file_index], walltimes[run_index, file_index] = search_times(searchlines, type)

        cputimes[run_index] = np.array(cputimes[run_index, n_procs.argsort()])
        walltimes[run_index] = np.array(walltimes[run_index, n_procs.argsort()])
        n_procs = n_procs[n_procs.argsort()]

    return cputimes, walltimes, n_procs

def extract_times_nk(out_files_path, type="pw", multiple_runs=False):
    if multiple_runs:
        runs = os.listdir(out_files_path)
    else:
        runs = [""]

    n_procs = {}
    walltimes = {}
    cputimes = {}

    runs_nk = os.listdir(out_files_path + "/" + runs[0])

    for nk in runs_nk:
        n_procs[nk] = np.zeros((len(runs), len(os.listdir(out_files_path + "/" + runs[0] + "/" + nk))))
        walltimes[nk] = np.zeros((len(runs), len(os.listdir(out_files_path + "/" + runs[0] + "/" + nk))))
        cputimes[nk] = np.zeros((len(runs), len(os.listdir(out_files_path + "/" + runs[0] + "/" + nk))))

    for run_index, run in enumerate(runs):
        runs_nk = os.listdir(out_files_path + "/" + run)

        for nk in runs_nk:
            files = os.listdir(out_files_path + "/" + run + "/" + nk)

            for file_index, file in enumerate(files):
                filepath = out_files_path + "/" + run + "/" + nk + "/" + file
                with open(filepath, "r") as f:
                    searchlines = f.readlines()
                n_procs[nk][run_index][file_index] = search_nprocs(searchlines)
                cputimes[nk][run_index][file_index], walltimes[nk][run_index][file_index] = search_times(searchlines, type)

            cputimes[nk][run_index] = np.array(cputimes[nk][run_index][n_procs[nk][run_index].argsort()])
            walltimes[nk][run_index] =  np.array(walltimes[nk][run_index][n_procs[nk][run_index].argsort()])
            n_procs[nk][run_index] = n_procs[nk][run_index][n_procs[nk][run_index].argsort()]

    return cputimes, walltimes, n_procs
