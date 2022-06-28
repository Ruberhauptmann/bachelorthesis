import numpy as np

from qe_benchmarking import qe_helper, nprocs_plots

if __name__ == "__main__":
    ### Plot absolute times

    cputimes, walltimes, n_procs = qe_helper.extract_times("out_files", multiple_runs=True)

    nprocs_plots.plot(walltimes, n_procs, "TaS2_intel", "absolute", plot_error=True, figsize="small")

    ### Plot speedup

    cputimes_singlecore, walltimes_singlecore = qe_helper.extract_times("out_files_singlecore", multiple_runs=True)[0:2]

    walltimes_singlecore = walltimes_singlecore * 4
    walltime_singlecore = np.mean(walltimes_singlecore)

    speedup = walltime_singlecore / walltimes

    nprocs_plots.plot(speedup, n_procs, "TaS2_intel", "speedup", plot_error=True, figsize="big")

    ### Plot idle time

    wait_time = (walltimes - cputimes) / walltimes

    nprocs_plots.plot(wait_time, n_procs, "TaS2_intel", "wait", figsize="small")

    ### Plot them side by side

    nprocs_plots.plot_two([walltimes, wait_time], n_procs, "TaS2_intel", ["absolute", "wait"])

    ### Plot efficiency

    efficiency_wall = speedup / n_procs

    nprocs_plots.plot(efficiency_wall, n_procs, "TaS2_intel", "efficiency")
