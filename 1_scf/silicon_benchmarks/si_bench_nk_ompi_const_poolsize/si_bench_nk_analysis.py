import numpy as np

from qe_benchmarking import qe_helper, nk_plots

if __name__ == "__main__":
    ### Plot absolute times

    cputimes, walltimes, n_procs = qe_helper.extract_times_nk("out_files", multiple_runs=False)

    nk_plots.plot(walltimes, n_procs, "si_ompi", "absolute")

    ### Plot speedup

    cputimes_singlecore, walltimes_singlecore = qe_helper.extract_times("out_files_singlecore", multiple_runs=False)[0:2]

    cputime_singlecore = np.mean(cputimes_singlecore)
    walltime_singlecore = np.mean(walltimes_singlecore)

    speedup = {}

    for nk in n_procs:
        speedup[nk] = walltime_singlecore / walltimes[nk]

    nk_plots.plot(speedup, n_procs, "si_ompi", "speedup")

    ### Plot idle time

    wait_time = {}

    for nk in n_procs:
        wait_time[nk] = (walltimes[nk] - cputimes[nk]) / walltimes[nk]

    nk_plots.plot(wait_time, n_procs, "si_ompi", "wait")

    ### Plot efficiency

    efficiency = {}

    for nk in n_procs:
        efficiency[nk] = speedup[nk] / n_procs[nk]

    nk_plots.plot(efficiency, n_procs, "si_ompi", "efficiency")