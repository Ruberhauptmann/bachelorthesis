import numpy as np

from qe_benchmarking import qe_helper, nprocs_plots

if __name__ == "__main__":
    ### Plot absolute times

    cputimes, walltimes, n_procs = qe_helper.extract_times("out_files", multiple_runs=True)

    nprocs_plots.plot(walltimes, n_procs, "TaS2_ompi", "absolute")

    ### Plot speedup

    cputimes_singlecore, walltimes_singlecore = qe_helper.extract_times("out_files_singlecore", multiple_runs=True)[0:2]

    walltimes_singlecore = walltimes_singlecore * 4
    print(walltimes_singlecore)
    walltime_singlecore = np.mean(walltimes_singlecore)
    print(walltime_singlecore)
    print(walltimes)

    speedup = walltime_singlecore / walltimes
    print(speedup)

    nprocs_plots.plot(speedup, n_procs, "TaS2_ompi", "speedup")

    ### Plot idle time

    wait_time = (walltimes - cputimes) / walltimes

    nprocs_plots.plot(wait_time, n_procs, "TaS2_ompi", "wait")

    ### Plot efficiency

    efficiency_wall = speedup / n_procs

    nprocs_plots.plot(efficiency_wall, n_procs, "TaS2_ompi", "efficiency")
