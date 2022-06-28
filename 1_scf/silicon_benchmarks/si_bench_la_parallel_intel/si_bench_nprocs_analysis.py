from matplotlib.pyplot import plot
import numpy as np

from qe_benchmarking import qe_helper, nd_plots

if __name__ == "__main__":
    ### Plot absolute times

    cputimes, walltimes, n_procs = qe_helper.extract_times_nk("out_files", multiple_runs=True)

    nd_plots.plot(walltimes, n_procs, "si_intel", "absolute", plot_error=True)

    ### Plot speedup

    cputimes_singlecore, walltimes_singlecore = qe_helper.extract_times("out_files_singlecore", multiple_runs=True)[0:2]

    cputime_singlecore = np.mean(cputimes_singlecore)
    walltime_singlecore = np.mean(walltimes_singlecore)

    speedup = {}

    for nk in n_procs:
        speedup[nk] = walltime_singlecore / walltimes[nk]

    nd_plots.plot(speedup, n_procs, "si_intel", "speedup", plot_error=True)

    ### Plot idle time

    wait_time = {}

    for nk in n_procs:
        wait_time[nk] = (walltimes[nk] - cputimes[nk]) / walltimes[nk]

    nd_plots.plot(wait_time, n_procs, "si_intel", "wait")
    
    nd_plots.plot_two([speedup, walltimes], n_procs, "si_intel", ["speedup", "absolute"])

    ### Plot efficiency

    efficiency = {}

    for nk in n_procs:
        efficiency[nk] = speedup[nk] / n_procs[nk]

    nd_plots.plot(efficiency, n_procs, "si_intel", "efficiency")