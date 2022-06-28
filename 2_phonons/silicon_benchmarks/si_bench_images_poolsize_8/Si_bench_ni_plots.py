import numpy as np

from qe_benchmarking import qe_helper, ni_plots

if __name__ == "__main__":
    ### Plot absolute times

    cputimes, walltimes, n_procs = qe_helper.extract_times_ni("out_files", type="ph", multiple_runs=True)

    ni_plots.plot_images(walltimes, n_procs, "si_ph_poolsize_8")

    walltimes_max, cputimes_max = ni_plots.take_image_max(walltimes), ni_plots.take_image_max(cputimes)

    ni_plots.plot(walltimes_max, n_procs, "si_ph_poolsize_8", "absolute", plot_error=True, figsize="big")

    ### Plot speedup

    cputimes_singlecore, walltimes_singlecore = qe_helper.extract_times("out_files_singlecore", type="ph", multiple_runs=False)[0:2]

    cputime_singlecore = np.mean(cputimes_singlecore)
    walltime_singlecore = np.mean(walltimes_singlecore)

    speedup = {}

    for ni in n_procs:
        speedup[ni] = np.zeros(walltimes_max[ni].shape)
        for run_index, walltime_ni in enumerate(walltimes_max[ni]):
            speedup[ni][run_index] = walltime_singlecore / walltime_ni

    ni_plots.plot(speedup, n_procs, "si_ph_poolsize_8", "speedup", plot_error=True)

    ### Plot idle time

    wait_time = {}

    for ni in n_procs:
        wait_time[ni] = np.zeros(walltimes_max[ni].shape)

    for ni in n_procs:
        for run_index, walltime_ni in enumerate(walltimes_max[ni]):
            wait_time[ni][run_index] = (walltime_ni - cputimes_max[ni][run_index]) / walltime_ni

    ni_plots.plot(wait_time, n_procs, "si_ph_poolsize_8", "wait")

    ### Plot efficiency

    efficiency = {}

    for ni in n_procs:
        efficiency[ni] = np.zeros(walltimes_max[ni].shape)
        for run_index, walltime_ni in enumerate(walltimes_max[ni]):
            efficiency[ni][run_index] = speedup[ni][run_index] / n_procs[ni][run_index]

    ni_plots.plot(efficiency, n_procs, "si_ph_poolsize_8", "efficiency")