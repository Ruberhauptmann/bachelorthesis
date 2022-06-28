import numpy as np
import matplotlib.pyplot as plt
plt.style.use('seaborn-colorblind')

from qe_benchmarking import qe_helper, nprocs_plots

def take_mean(y):
    wall_std = np.std(y, axis=0)

    y = np.mean(y, axis=0)

    return wall_std, y 

def plot(y, n_procs, prefix, type, plot_error=False):
    y_std = 0
    if y.ndim != 1:
        y_std, y = take_mean(y)

    fig, ax1 = plt.subplots(figsize=[6.4, 4.8])

    if plot_error:
        ax1.fill_between(n_procs, y-y_std, y+y_std, alpha=0.2)
        ax1.plot(n_procs, y, marker='o', linestyle='dashed')
    else:
        ax1.plot(n_procs, y, marker='o', linestyle='dashed')

    if type == "speedup":
        linear_nprocs = np.linspace(0, n_procs[-1])
        ax1.plot(linear_nprocs, linear_nprocs)

    ax1.set_xlabel("Number of processors")

    if type == "absolute":
        ax1.set_ylabel("runtime [s]")
        ax1.set_ylim([0, None])
        ax1.axhline(y=100, color='orange', linestyle='dashed')
    if type == "speedup":
        ax1.axhline(y=1, color='r', linestyle='dashed')
        ax1.set_ylabel("speedup")
    if type == "wait":
        ax1.set_ylabel("system time")
    if type == "efficiency":
        ax1.set_ylabel("efficiency (speedup / Number of processors)")

    filename = prefix + "_bench_nprocs_" + type + ".pdf"

    fig.savefig(filename, bbox_inches="tight")

if __name__ == "__main__":
    ### Plot absolute times

    cputimes, walltimes, n_procs = qe_helper.extract_times("out_files", multiple_runs=True)

    plot(walltimes, n_procs, "si_intel", "absolute", plot_error=True)

    nprocs_plots.plot(walltimes, n_procs, "small_si_intel", "absolute", plot_error=True, figsize="small")

    print(n_procs[0])
    print(take_mean(walltimes)[1][0])
    print(n_procs[1])
    print(take_mean(walltimes)[1][1])
    print(n_procs[2])
    print(take_mean(walltimes)[1][2])
    print(n_procs[5])
    print(take_mean(walltimes)[1][5])
    print(n_procs[10])
    print(take_mean(walltimes)[1][10])

    ### Plot speedup

    cputimes_singlecore, walltimes_singlecore = qe_helper.extract_times("out_files_singlecore", multiple_runs=True)[0:2]

    walltime_singlecore = np.mean(walltimes_singlecore)

    speedup = walltime_singlecore / walltimes

    nprocs_plots.plot(speedup, n_procs, "si_intel", "speedup", plot_error=True)

    nprocs_plots.plot(speedup, n_procs, "small_si_intel", "speedup", plot_error=True, figsize="small")

    ### Plot idle time

    wait_time = (walltimes - cputimes) / walltimes

    nprocs_plots.plot(wait_time, n_procs, "si_intel", "wait")

    ### Plot efficiency

    efficiency = speedup / n_procs

    nprocs_plots.plot(efficiency, n_procs, "si_intel", "efficiency", plot_error=True)
