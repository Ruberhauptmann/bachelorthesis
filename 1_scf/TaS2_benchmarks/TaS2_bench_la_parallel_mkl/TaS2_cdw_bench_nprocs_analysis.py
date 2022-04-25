import os
import numpy as np
import sys
import matplotlib.pyplot as plt
plt.style.use('seaborn-colorblind')

sys.path.append("../../")

from helper import qe_helper
from helper.plot_helper import nprocs_plots

if __name__ == "__main__":
    runs_nk = os.listdir("out_files")

    n_procs = {}
    walltimes = {}
    cputimes = {}

    n_procs_counter = {}

    nk_list = []

    for run in runs_nk:
        n_procs[run] = np.zeros(len(os.listdir("out_files/" + run)))
        walltimes[run] = np.zeros(len(os.listdir("out_files/" + run)))
        cputimes[run] = np.zeros(len(os.listdir("out_files/" + run)))

    for i, run in enumerate(runs_nk):
        files = os.listdir("out_files/" + run)

        for file_index, file in enumerate(files):
            with open("out_files/" + run + "/" + file, "r") as f:
                searchlines = f.readlines()
            n_procs[run][file_index] = qe_helper.search_nprocs(searchlines)
            cputimes[run][file_index], walltimes[run][file_index] = qe_helper.search_times(searchlines, n_procs[run][file_index])

        cputimes[run] = np.array(cputimes[run][n_procs[run].argsort()])
        walltimes[run] = np.array(walltimes[run][n_procs[run].argsort()])
        n_procs[run] = n_procs[run][n_procs[run].argsort()]

    ### Plot absolute times

    fig, ax1 = plt.subplots()

    for i, run in enumerate(n_procs):
        ax1.plot(n_procs[run], cputimes[run], label=run, marker='o', linestyle='dashed')
        #ax1.plot(n_procs[run], walltimes[run], label="WALL " + run, marker='o', linestyle='dashed')

    ax1.set_xlabel("Number of processors")
    ax1.set_ylabel("runtime [s]")

    #fig.legend(loc = "lower right", bbox_to_anchor = [0.9, 0.11])
    ax1.legend()

    fig.savefig("TaS2_bench_parallel_mkl_absolute.pdf", bbox_inches="tight")

    ### Plot speedup

    with open ("out_files_singlecore/" + os.listdir("out_files_singlecore")[0]) as f:
        searchlines = f.readlines()
    
    cputime_singlecore, walltime_singlecore = qe_helper.search_times(searchlines, 1)

    speedup_cpu = {}
    speedup_wall = {}

    for i, run in enumerate(n_procs):
        speedup_cpu[run] = cputime_singlecore / cputimes[run]
        speedup_wall[run] =  walltime_singlecore / walltimes[run]

    fig, ax1 = plt.subplots()

    for i, run in enumerate(n_procs):
        ax1.plot(n_procs[run], speedup_cpu[run], label=run, marker='o', linestyle='dashed')
        #ax1.plot(n_procs[run], walltimes[run], label="WALL " + run, marker='o', linestyle='dashed')

    ax1.set_xlabel("Number of processors")
    ax1.set_ylabel("speedup")

    ax1.legend()

    fig.savefig("TaS2_bench_parallel_mkl_speedup.pdf", bbox_inches="tight")
