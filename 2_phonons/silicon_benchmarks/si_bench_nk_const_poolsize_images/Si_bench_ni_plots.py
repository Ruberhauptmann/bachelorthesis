import numpy as np

from qe_benchmarking import qe_helper, ni_plots

if __name__ == "__main__":
    ### Plot absolute times

    cputimes, walltimes, n_procs = qe_helper.extract_times_ni("out_files", type="ph", multiple_runs=False)

    print(walltimes)
    print(n_procs)

    ni_plots.plot(walltimes, n_procs, "si_intel", "absolute", plot_error=False)

    ### Plot speedup

    cputimes_singlecore, walltimes_singlecore = qe_helper.extract_times("out_files_singlecore", type="ph", multiple_runs=False)[0:2]

    cputime_singlecore = np.mean(cputimes_singlecore)
    walltime_singlecore = np.mean(walltimes_singlecore)

    speedup = {}

    for ni in n_procs:
        speedup[ni] = np.zeros(walltimes[ni].shape)
        for run_index, walltime_ni in enumerate(walltimes[ni]):
            speedup[ni][run_index] = walltime_singlecore / walltime_ni

    ni_plots.plot(speedup, n_procs, "si_intel", "speedup", plot_error=False)

    ### Plot idle time

    wait_time = {}

    for ni in n_procs:
        wait_time[ni] = np.zeros(walltimes[ni].shape)
        for run_index, walltime_ni in enumerate(walltimes[ni]):
            wait_time[ni][run_index] = (walltime_ni - cputimes[ni][run_index]) / walltime_ni

    ni_plots.plot(wait_time, n_procs, "si_intel", "wait", plot_error=False)

    ### Plot efficiency

    efficiency = {}

    for ni in n_procs:
        efficiency[ni] = np.zeros(walltimes[ni].shape)
        for run_index, walltime_ni in enumerate(walltimes[ni]):
            efficiency[ni][run_index] = speedup[ni][run_index] / n_procs[ni][run_index]

    ni_plots.plot(efficiency, n_procs, "si_intel", "efficiency", plot_error=True)