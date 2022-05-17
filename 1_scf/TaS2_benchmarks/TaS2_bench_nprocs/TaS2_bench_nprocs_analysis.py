import numpy as np

from qe_benchmarking import qe_helper, nprocs_plots

if __name__ == "__main__":
    ### Plot absolute times

    cputimes, walltimes, n_procs = qe_helper.extract_times("out_files", multiple_runs=False)

    nprocs_plots.plot(walltimes, n_procs, "TaS2_ompi", "absolute")

    ### Plot speedup

    cputimes_singlecore, walltimes_singlecore = qe_helper.extract_times("out_files_singlecore", multiple_runs=False)[0:2]

    walltime_singlecore = np.mean(walltimes_singlecore)

    speedup = walltime_singlecore / walltimes

    nprocs_plots.plot(speedup, n_procs, "TaS2_ompi", "speedup")

    ### Plot idle time

    wait_time = (walltimes - cputimes) / walltimes

    nprocs_plots.plot(wait_time, n_procs, "TaS2_ompi", "wait")

    ### Plot efficiency

    efficiency_wall = speedup / n_procs

    nprocs_plots.plot(efficiency_wall, n_procs, "TaS2_ompi", "efficiency")
