import os
import numpy as np
import sys

sys.path.append("../../")

from helper import qe_helper
from helper.plot_helper import nprocs_plots

if __name__ == "__main__":
    ### Plot absolute times

    cputimes, walltimes, n_procs = qe_helper.extract_times("out_files", multiple_runs=True)

    nprocs_plots.plot(cputimes, walltimes, n_procs, "si", "absolute")

    ### Plot speedup

    cputimes_singlecore, walltimes_singlecore = qe_helper.extract_times("out_files_singlecore", multiple_runs=False)[0:2]

    cputime_singlecore = np.mean(cputimes_singlecore)
    walltime_singlecore = np.mean(walltimes_singlecore)

    speedup_cpu = cputime_singlecore / cputimes
    speedup_wall = walltime_singlecore / walltimes

    nprocs_plots.plot(speedup_cpu, speedup_wall, n_procs, "si", "speedup")

    ### Plot efficiency

    efficiency_cpu = speedup_cpu / n_procs
    efficiency_wall = speedup_wall / n_procs

    nprocs_plots.plot(efficiency_cpu, efficiency_wall, n_procs, "si", "efficiency")
