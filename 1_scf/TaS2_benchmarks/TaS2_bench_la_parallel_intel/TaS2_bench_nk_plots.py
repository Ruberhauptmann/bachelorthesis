import numpy as np

from qe_benchmarking import qe_helper, nd_plots
import scipy as sp

if __name__ == "__main__":
    ### Plot absolute times

    cputimes, walltimes, n_procs = qe_helper.extract_times_nk("out_files", multiple_runs=True)

    nd_plots.plot(walltimes, n_procs, "TaS2_intel_la_parallel", "absolute", plot_error=True)

    ### Plot speedup

    cputimes_singlecore, walltimes_singlecore = qe_helper.extract_times("out_files_singlecore", multiple_runs=True)[0:2]

    walltimes_singlecore = walltimes_singlecore * 4

    cputime_singlecore = np.mean(cputimes_singlecore)
    walltime_singlecore = np.mean(walltimes_singlecore)

    speedup = {}

    for nk in n_procs:
        speedup[nk] = np.zeros(walltimes[nk].shape)
        for run_index, walltime_nk in enumerate(walltimes[nk]):
            speedup[nk][run_index] = walltime_singlecore / walltime_nk

    nd_plots.plot(speedup, n_procs, "TaS2_intel_la_parallel", "speedup", plot_error=True)

    ### Plot idle time

    wait_time = {}

    for nk in n_procs:
        wait_time[nk] = np.zeros(walltimes[nk].shape)
        for run_index, walltime_nk in enumerate(walltimes[nk]):
            wait_time[nk][run_index] = (walltime_nk - cputimes[nk][run_index]) / walltime_nk

    nd_plots.plot(wait_time, n_procs, "TaS2_intel_la_parallel", "wait", plot_error=True)

    ### Plot efficiency

    efficiency = {}

    for nk in n_procs:
        efficiency[nk] = np.zeros(walltimes[nk].shape)
        for run_index, walltime_nk in enumerate(walltimes[nk]):
            efficiency[nk][run_index] = speedup[nk][run_index] / n_procs[nk][run_index]

    nd_plots.plot(efficiency, n_procs, "TaS2_intel_la_parallel", "efficiency", plot_error=True)