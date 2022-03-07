import os
import numpy as np
import sys

sys.path.append("../../")

from helper import qe_helper
from helper.plot_helper import nprocs_plots

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
            n_procs[file_index] = qe_helper.extract_nprocs(searchlines)
            cputimes[run_index, file_index], walltimes[run_index, file_index] = qe_helper.extract_times(searchlines, n_procs[file_index])

        cputimes[run_index] = np.array(cputimes[run_index, n_procs.argsort()])
        walltimes[run_index] = np.array(walltimes[run_index, n_procs.argsort()])

        return cputimes, walltimes, n_procs

if __name__ == "__main__":
    ### Plot absolute times

    cputimes, walltimes, n_procs = extract_times("out_files", multiple_runs=True)

    print(cputimes)
    print(walltimes)

    nprocs_plots.plot(cputimes, walltimes, n_procs, "si", "absolute")

    ### Plot speedup

    cputimes_singlecore, walltimes_singlecore = extract_times("out_files_singlecore", multiple_runs=False)[0:2]

    cputime_singlecore = np.mean(cputimes_singlecore)
    walltime_singlecore = np.mean(walltimes_singlecore)

    speedup_cpu = cputime_singlecore / cputimes
    speedup_wall = walltime_singlecore / walltimes

    nprocs_plots.plot(speedup_cpu, speedup_wall, n_procs, "si", "speedup")

    ### Plot efficiency

    efficiency_cpu = speedup_cpu / n_procs
    efficiency_wall = speedup_wall / n_procs

    nprocs_plots.plot(efficiency_cpu, efficiency_wall, n_procs, "si", "efficiency")
