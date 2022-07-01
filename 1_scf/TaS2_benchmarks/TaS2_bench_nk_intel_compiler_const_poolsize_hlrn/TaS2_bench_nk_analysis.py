import numpy as np
import matplotlib.pyplot as plt

from qe_benchmarking import qe_helper, nk_plots

def take_mean(y):
    y_std = {}
    y_mean = {}
    for nk in y:
        y_std[nk] = np.std(y[nk], axis=0, ddof=1)
        y_mean[nk] = np.mean(y[nk], axis=0)

    return y_std, y_mean

def plot_two(y, n_procs, prefix, type):
    TEXTWIDTH = 5.62315

    y_std = []
    y_mean = []

    for i, y_sub in enumerate(y):
        y_std_tmp, y_mean_tmp = take_mean(y_sub)
        y_std.append(y_std_tmp)
        y_mean.append(y_mean_tmp)

    width = 1.3 * TEXTWIDTH
    height = 0.4 * width

    fig, axes = plt.subplots(1, 2, figsize=(width, height))
    fig.set_tight_layout(True)

    for i, y_sub in enumerate(y_mean):
        axes[i].set_xlabel("number of processors $N$")
        for nk in n_procs:
            color = next(axes[i]._get_lines.prop_cycler)['color']
            print(nk, color)
            if type[i] == "absolute":
                axes[i].set_ylabel("runtime $T$ [$s$]")
                axes[i].fill_between(n_procs[nk][0], y_mean[i][nk]-y_std[i][nk], y_mean[i][nk]+y_std[i][nk], alpha=0.2, color=color)
                axes[i].plot(n_procs[nk][0], y_mean[i][nk], label=nk, marker='o', linestyle='dashed', color=color)
            if type[i] == "speedup":
                axes[i].set_ylabel("speedup $S$")
                axes[i].fill_between(n_procs[nk][0], y_mean[i][nk]-y_std[i][nk], y_mean[i][nk]+y_std[i][nk], alpha=0.2, color=color)
                axes[i].plot(n_procs[nk][0], y_mean[i][nk], label=nk, marker='o', linestyle='dashed', color=color)
            if type[i] == "wait":
                axes[i].set_ylabel('wait time [%]')
                axes[i].plot(n_procs[nk][0], y_mean[i][nk] * 100, label=nk, marker='o', linestyle='dashed', color=color)
            if type[i] == "efficiency":
                axes[i].plot(n_procs[nk][0], y_mean[i][nk], label=nk, marker='o', linestyle='dashed')

        axes[i].legend(ncol=3)
        axes[i].grid(0.3)

    filename = prefix + "_bench_nk_" + type[0] + "_" + type[1] + ".pdf"

    fig.savefig(filename, bbox_inches="tight")


def plot(y, n_procs, prefix, type, plot_error=False, figsize="big"):
    TEXTWIDTH = 5.62315

    y_std, y_mean = take_mean(y)

    if figsize == "big":
        width = TEXTWIDTH
        height = 0.75 * width
        fig, ax1 = plt.subplots(figsize=(width, height))
    if figsize == "small":
        width = 0.7 * TEXTWIDTH
        height = 0.75 * width
        fig, ax1 = plt.subplots(figsize=(width, height))

    ax1.set_xlabel("number of processors $N$")
    if type == "absolute":
        ax1.set_ylabel("runtime $T$ [$s$]")
    if type == "speedup":
        max_nprocs = 0
        for nk in n_procs:
            if np.max(n_procs[nk].flatten()) > max_nprocs:
                max_nprocs = np.max(n_procs[nk].flatten())
        linear_nprocs = np.linspace(0, max_nprocs)
        ax1.plot(linear_nprocs, linear_nprocs)
        ax1.axhline(y=1, color='r', linestyle='dashed')
        ax1.set_ylabel("speedup $S$")
    if type == "wait":
        ax1.set_ylabel("wait time [%]")
    if type == "efficiency":
        ax1.set_ylabel("efficiency (speedup / Number of processors)")

    for nk in n_procs:
        color = next(ax1._get_lines.prop_cycler)['color']
        if type == "absolute":
            ax1.fill_between(n_procs[nk][0], y_mean[nk]-y_std[nk], y_mean[nk]+y_std[nk], alpha=0.2, color=color)
            ax1.plot(n_procs[nk][0], y_mean[nk], label=nk, marker='o', linestyle='dashed', color=color)
        if type == "speedup":
            ax1.fill_between(n_procs[nk][0], y_mean[nk]-y_std[nk], y_mean[nk]+y_std[nk], alpha=0.2, color=color)
            ax1.plot(n_procs[nk][0], y_mean[nk], label=nk, marker='o', linestyle='dashed', color=color)
        if type == "wait":
            ax1.plot(n_procs[nk][0], y_mean[nk] * 100, label=nk, marker='o', linestyle='dashed')
        if type == "efficiency":
            ax1.plot(n_procs[nk][0], y_mean[nk], label=nk, marker='o', linestyle='dashed')

    ax1.legend()
    ax1.grid(0.3)

    filename = prefix + "_bench_nk_" + type + ".pdf"

    fig.savefig(filename, bbox_inches="tight")

if __name__ == "__main__":
    ### Plot absolute times

    cputimes, walltimes, n_procs = qe_helper.extract_times_nk("out_files", multiple_runs=True)

    nk_plots.plot(walltimes, n_procs, "TaS2_hlrn", "absolute", plot_error=True)

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

    nk_plots.plot(speedup, n_procs, "TaS2_hlrn", "speedup", plot_error=True)

    ### Plot idle time

    wait_time = {}

    for nk in n_procs:
        wait_time[nk] = np.zeros(walltimes[nk].shape)
        for run_index, walltime_nk in enumerate(walltimes[nk]):
            wait_time[nk][run_index] = (walltime_nk - cputimes[nk][run_index]) / walltime_nk

    print(wait_time)

    nk_plots.plot(wait_time, n_procs, "TaS2_hlrn", "wait", plot_error=True)

    plot_two([walltimes, wait_time], n_procs, "TaS2_hlrn", ["absolute", "wait"])

    ### Plot efficiency

    efficiency = {}

    for nk in n_procs:
        efficiency[nk] = np.zeros(walltimes[nk].shape)
        for run_index, walltime_nk in enumerate(walltimes[nk]):
            efficiency[nk][run_index] = speedup[nk][run_index] / n_procs[nk][run_index]

    nk_plots.plot(efficiency, n_procs, "TaS2_hlrn", "efficiency", plot_error=True)