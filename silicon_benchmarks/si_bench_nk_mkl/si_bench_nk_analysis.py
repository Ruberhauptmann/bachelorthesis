import numpy as np
import sys

sys.path.append("../../")

from helper import qe_helper
from helper.plot_helper import nk_plots

if __name__ == "__main__":
    ### Plot absolute times

    cputimes, walltimes, n_procs = qe_helper.extract_times_nk("out_files", multiple_runs=False)

    nk_plots.plot(cputimes, walltimes, n_procs, "si", "absolute")

    ### Plot speedup

    cputimes_singlecore, walltimes_singlecore = qe_helper.extract_times("out_files_singlecore", multiple_runs=True)[0:2]

    cputime_singlecore = np.mean(cputimes_singlecore)
    walltime_singlecore = np.mean(walltimes_singlecore)

    speedup_cpu = {}
    speedup_wall = {}

    for nk in n_procs:
        speedup_cpu[nk] = cputime_singlecore / cputimes[nk]
        speedup_wall[nk] = walltime_singlecore / walltimes[nk]

    nk_plots.plot(speedup_cpu, speedup_wall, n_procs, "si", "speedup")
