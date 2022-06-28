import numpy as np
import matplotlib.pyplot as plt
plt.style.use('seaborn-colorblind')

def take_mean(y):
    y_std = {}
    y_mean = {}
    for nd in y:
        y_std[nd] = np.std(y[nd], axis=0, ddof=1)
        y_mean[nd] = np.mean(y[nd], axis=0)

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
        if type[i] == "speedup":
            max_nprocs = 0
            for nd in n_procs:
                if np.max(n_procs[nd].flatten()) > max_nprocs:
                    max_nprocs = np.max(n_procs[nd].flatten())
            linear_nprocs = np.linspace(0, max_nprocs)
            axes[i].plot(linear_nprocs, linear_nprocs)
            axes[i].axhline(y=1, color='r', linestyle='dashed')

        for nd in n_procs:
            color = next(axes[i]._get_lines.prop_cycler)['color']
            if type[i] == "absolute":
                axes[i].set_ylabel("runtime $T$ [$s$]")
                axes[i].fill_between(n_procs[nd][0], y_mean[i][nd]-y_std[i][nd], y_mean[i][nd]+y_std[i][nd], alpha=0.2, color=color)
                axes[i].plot(n_procs[nd][0], y_mean[i][nd], label=nd, marker='o', linestyle='dashed', color=color)
            if type[i] == "speedup":
                axes[i].set_ylabel("speedup $S$")
                axes[i].fill_between(n_procs[nd][0], y_mean[i][nd]-y_std[i][nd], y_mean[i][nd]+y_std[i][nd], alpha=0.2, color=color)
                axes[i].plot(n_procs[nd][0], y_mean[i][nd], label=nd, marker='o', linestyle='dashed', color=color)
            if type[i] == "wait":
                axes[i].set_ylabel('wait time [%]')
                axes[i].plot(n_procs[nd][0], y_mean[i][nd], label=nd, marker='o', linestyle='dashed')
            if type[i] == "efficiency":
                axes[i].plot(n_procs[nd][0], y_mean[i][nd], label=nd, marker='o', linestyle='dashed')

        axes[i].legend()
        axes[i].grid(0.3)

    filename = prefix + "_bench_nd_" + type[0] + "_" + type[1] + ".pdf"

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
        for nd in n_procs:
            if np.max(n_procs[nd].flatten()) > max_nprocs:
                max_nprocs = np.max(n_procs[nd].flatten())
        linear_nprocs = np.linspace(0, max_nprocs)
        ax1.plot(linear_nprocs, linear_nprocs)
        ax1.axhline(y=1, color='r', linestyle='dashed')
        ax1.set_ylabel("speedup $S$")
    if type == "wait":
        ax1.set_ylabel("wait time [%]")
    if type == "efficiency":
        ax1.set_ylabel("efficiency (speedup / Number of processors)")

    for nd in n_procs:
        color = next(ax1._get_lines.prop_cycler)['color']
        if type == "absolute":
            ax1.fill_between(n_procs[nd][0], y_mean[nd]-y_std[nd], y_mean[nd]+y_std[nd], alpha=0.2, color=color)
            ax1.plot(n_procs[nd][0], y_mean[nd], label=nd, marker='o', linestyle='dashed', color=color)
        if type == "speedup":
            ax1.fill_between(n_procs[nd][0], y_mean[nd]-y_std[nd], y_mean[nd]+y_std[nd], alpha=0.2, color=color)
            ax1.plot(n_procs[nd][0], y_mean[nd], label=nd, marker='o', linestyle='dashed', color=color)
        if type == "wait":
            ax1.plot(n_procs[nd][0], y_mean[nd], label=nd, marker='o', linestyle='dashed')
        if type == "efficiency":
            ax1.plot(n_procs[nd][0], y_mean[nd], label=nd, marker='o', linestyle='dashed')

    ax1.legend()
    ax1.grid(0.3)

    filename = prefix + "_bench_nd_" + type + ".pdf"

    fig.savefig(filename, bbox_inches="tight")