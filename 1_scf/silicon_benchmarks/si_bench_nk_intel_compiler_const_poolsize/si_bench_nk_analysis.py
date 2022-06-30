import numpy as np
import matplotlib.pyplot as plt
plt.style.use('seaborn-colorblind')

from qe_benchmarking import qe_helper, nk_plots

def plot(y, n_procs, prefix, type, plot_error=False):
    y_std, y_mean = nk_plots.take_mean(y)

    fig, ax1 = plt.subplots()

    for nk in n_procs:
        if plot_error:
            ax1.fill_between(n_procs[nk][0], y_mean[nk]-y_std[nk], y_mean[nk]+y_std[nk], alpha=0.2)
            ax1.plot(n_procs[nk][0], y_mean[nk], label=nk, marker='o', linestyle='dashed')
        else:
            ax1.plot(n_procs[nk][0], y_mean[nk], label=nk, marker='o', linestyle='dashed')

    max_nprocs = 0
    for nk in n_procs:
        if np.max(n_procs[nk].flatten()) > max_nprocs:
            max_nprocs = np.max(n_procs[nk].flatten())
    
    if type == "speedup":
        linear_nprocs = np.linspace(0, max_nprocs)
        ax1.plot(linear_nprocs, linear_nprocs)

    ax1.set_xlabel("Number of processors")

    if type == "absolute":
        ax1.set_ylabel("runtime [s]")
        ax1.axhline(y=25, color='orange', linestyle='dashed')
    if type == "speedup":
        ax1.axhline(y=1, color='r', linestyle='dashed')
        ax1.set_ylabel("speedup")
    if type == "wait":
        ax1.set_ylabel("system time")
    if type == "efficiency":
        ax1.set_ylabel("efficiency (speedup / Number of processors)")

    ax1.legend()

    filename = prefix + "_bench_nk_" + type + ".pdf"

    fig.savefig(filename, bbox_inches="tight")

if __name__ == "__main__":
    ### Plot absolute times

    cputimes, walltimes, n_procs = qe_helper.extract_times_nk("out_files", multiple_runs=True)

    walltimes_std, walltimes_mean = nk_plots.take_mean(walltimes)

    minimum_time = np.min(walltimes_mean["2"])
    print("Minimum time: ", minimum_time)
    print("With processors: ", int(n_procs["2"][0][np.where(walltimes_mean["2"] == minimum_time)][0]))

    print("Time at ", n_procs["2"][0][4], " processors: ", walltimes_mean["2"][4])

    nk_plots.plot(walltimes, n_procs, "si_intel", "absolute", plot_error=True)

    nk_plots.plot(walltimes, n_procs, "small_si_intel", "absolute", plot_error=True, figsize="small")

    ### Plot speedup

    cputimes_singlecore, walltimes_singlecore = qe_helper.extract_times("out_files_singlecore", multiple_runs=True)[0:2]

    cputime_singlecore = np.mean(cputimes_singlecore)
    walltime_singlecore = np.mean(walltimes_singlecore)

    speedup = {}

    for nk in n_procs:
        speedup[nk] = np.zeros(walltimes[nk].shape)
        for run_index, walltime_nk in enumerate(walltimes[nk]):
            speedup[nk][run_index] = walltime_singlecore / walltime_nk

    nk_plots.plot(speedup, n_procs, "si_intel", "speedup", plot_error=True)

    nk_plots.plot(speedup, n_procs, "small_si_intel", "speedup", plot_error=True, figsize="small")

    ### Plot idle time

    wait_time = {}

    for nk in n_procs:
        wait_time[nk] = np.zeros(walltimes[nk].shape)
        for run_index, walltime_nk in enumerate(walltimes[nk]):
            wait_time[nk][run_index] = (walltime_nk - cputimes[nk][run_index]) / walltime_nk

    nk_plots.plot(wait_time, n_procs, "si_intel", "wait", plot_error=True)

    ### Plot efficiency

    efficiency = {}

    for nk in n_procs:
        efficiency[nk] = np.zeros(walltimes[nk].shape)
        for run_index, walltime_nk in enumerate(walltimes[nk]):
            efficiency[nk][run_index] = speedup[nk][run_index] / n_procs[nk][run_index]

    nk_plots.plot(efficiency, n_procs, "si_intel", "efficiency", plot_error=True)