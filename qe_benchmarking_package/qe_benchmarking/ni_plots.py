from tkinter.tix import TEXT
import numpy as np
import matplotlib.pyplot as plt
plt.style.use('seaborn-colorblind')

def take_mean(y):
    y_std = {}
    y_mean = {}
    for ni in y:
        y_std[ni] = np.std(y[ni], axis=0, ddof=1)
        y_mean[ni] = np.mean(y[ni], axis=0)

    return y_std, y_mean

def take_image_mean(y):
    y_std = {}
    y_mean = {}

    for ni in y:
        y_std[ni] = np.zeros((len(y[ni]), len(y[ni][0])))
        y_mean[ni] = np.zeros((len(y[ni]), len(y[ni][0])))

    for ni in y:
        for run_index, run in enumerate(y[ni]):
            for time_index, times in enumerate(run):
                y_std[ni][run_index][time_index] = np.std(times, axis=0, ddof=1)
                y_mean[ni][run_index][time_index] = np.mean(times, axis=0)

    return y_std, y_mean

def take_image_max(y):
    y_max = {}
    for ni in y:
        y_max[ni] = np.zeros((len(y[ni]), len(y[ni][0])))
        for run_index, run in enumerate(y[ni]):
            for time_index, times in enumerate(run):
                y_max[ni][run_index][time_index] = np.max(times)

    return y_max

def plot_images(y, n_procs, prefix):
    TEXTWIDTH = 5.62315
    y_images_std, y_images_mean = take_image_mean(y)
    y_run_std, y_run_mean = take_mean(y_images_mean)
    for ni in y:
        y_run_std[ni] = np.mean(y_images_std[ni], axis=0)

    width = TEXTWIDTH
    height = 0.75 * width
    fig, ax1 = plt.subplots(figsize=(width, height))

    for ni in n_procs:
        color = next(ax1._get_lines.prop_cycler)['color']
        if len(n_procs[ni][0]) == 1:
            ax1.errorbar(n_procs[ni][0], y_run_mean[ni], y_run_std[ni], color=color)
        else:
            ax1.fill_between(n_procs[ni][0], y_run_mean[ni]-y_run_std[ni], y_run_mean[ni]+y_run_std[ni], alpha=0.2, color=color)
        ax1.plot(n_procs[ni][0], y_run_mean[ni], label=ni, marker='o', linestyle='dashed', color=color)

    ax1.grid(0.3)

    ax1.set_xlabel("number of processors $N$")
    ax1.set_ylabel("runtime [s]")
    ax1.legend()

    filename = prefix + "_images_distribution.pdf"

    fig.savefig(filename, bbox_inches="tight")

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

    max_nprocs = 0
    for ni in n_procs:
        if np.max(n_procs[ni].flatten()) > max_nprocs:
            max_nprocs = np.max(n_procs[ni].flatten())


    for i, y_sub in enumerate(y_mean):
        if type[i] == "speedup":
            linear_nprocs = np.linspace(0, max_nprocs)
            axes[i].plot(linear_nprocs, linear_nprocs)
        axes[i].set_xlabel("number of processors $N$")
        for nk in n_procs:
            color = next(axes[i]._get_lines.prop_cycler)['color']
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

        axes[i].legend()
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

    max_nprocs = 0
    for ni in n_procs:
        if np.max(n_procs[ni].flatten()) > max_nprocs:
            max_nprocs = np.max(n_procs[ni].flatten())

    if type == "speedup":
        linear_nprocs = np.linspace(1, max_nprocs)
        ax1.plot(linear_nprocs, linear_nprocs)

    args = np.array([int(x) for x in list(n_procs.keys())])
    args = [str(x) for x in args[np.argsort(args)]]

    for ni in args:
    #for ni in n_procs:
        color = next(ax1._get_lines.prop_cycler)['color']
        if plot_error:
            if len(n_procs[ni][0]) == 1:
                ax1.errorbar(n_procs[ni][0], y_mean[ni], y_std[ni], color=color)
            ax1.fill_between(n_procs[ni][0], y_mean[ni]-y_std[ni], y_mean[ni]+y_std[ni], alpha=0.2, color=color)
            ax1.plot(n_procs[ni][0], y_mean[ni], label="ni " + ni, marker='o', linestyle='dashed', color=color)
        elif type == "wait":
            ax1.plot(n_procs[ni][0], y_mean[ni] * 100, label=ni, marker='o', linestyle='dashed', color=color)
        else:
            ax1.plot(n_procs[ni][0], y_mean[ni], label=ni, marker='o', linestyle='dashed', color=color)

    ax1.set_xlabel("number of processors $N$")

    if type == "absolute":
        ax1.set_ylabel("runtime $T$ [s]")
    if type == "speedup":
        #ax1.axhline(y=1, color='r', linestyle='dashed')
        ax1.set_ylabel("speedup $S$")
    if type == "wait":
        ax1.set_ylabel("wait time [%]")
    if type == "efficiency":
        ax1.set_ylabel("efficiency (speedup / Number of processors)")

    ax1.legend()
    ax1.grid(0.3)

    filename = prefix + "_bench_ni_" + type + ".pdf"

    fig.savefig(filename, bbox_inches="tight")