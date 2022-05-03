import numpy as np
import sys
import matplotlib.pyplot as plt
from pyparsing import line

sys.path.append("../../")

from helper import qe_helper
from helper.plot_helper import nk_plots

def plot(cpu_y, wall_y, n_procs, prefix, type):
    fig, ax1 = plt.subplots()

    for nk in n_procs:
        ax1.plot(n_procs[nk], cpu_y[nk], label=nk, marker='o', linestyle='')
    
    if type == "speedup":
        linear_nprocs = np.linspace(0, n_procs[list(n_procs)[-1]][-1])
        ax1.plot(linear_nprocs, linear_nprocs)

    ax1.set_xlabel("Number of processors")

    if type == "absolute":
        ax1.set_ylabel("runtime [s]")
    if type == "speedup":
        ax1.axhline(y=1, color='r', linestyle='dashed')
        ax1.set_ylabel("speedup")
    if type == "efficiency":
        ax1.set_ylabel("efficiency (speedup / Number of processors)")

    ax1.legend()

    filename = prefix + "_bench_nk_" + type + ".pdf"

    fig.savefig(filename, bbox_inches="tight")

if __name__ == "__main__":
    ### Plot absolute times

    cputimes, walltimes, n_procs = qe_helper.extract_times_nk("out_files", multiple_runs=False)

    plot(walltimes, cputimes, n_procs, "TaS2", "absolute")

    ### Plot speedup

    cputimes_singlecore, walltimes_singlecore = qe_helper.extract_times("out_files_singlecore", multiple_runs=False)[0:2]

    cputime_singlecore = np.mean(cputimes_singlecore)
    walltime_singlecore = np.mean(walltimes_singlecore)

    speedup_cpu = {}
    speedup_wall = {}

    for nk in n_procs:
        speedup_cpu[nk] = cputime_singlecore / cputimes[nk]
        speedup_wall[nk] = walltime_singlecore / walltimes[nk]

    plot(speedup_wall, speedup_cpu, n_procs, "TaS2", "speedup")
