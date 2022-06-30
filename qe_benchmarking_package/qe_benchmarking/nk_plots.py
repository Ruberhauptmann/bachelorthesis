import numpy as np
import matplotlib.pyplot as plt
plt.style.use('seaborn-colorblind')

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