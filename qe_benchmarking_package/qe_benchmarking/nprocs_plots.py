import numpy as np
import matplotlib.pyplot as plt
plt.style.use('seaborn-colorblind')

def take_mean(y):
    wall_std = np.std(y, axis=0)

    y = np.mean(y, axis=0)

    return wall_std, y 

def plot_two(y, n_procs, prefix, type):
    TEXTWIDTH = 5.62315

    width = 1.3 * TEXTWIDTH
    height = 0.4 * width
    fig, axes = plt.subplots(1, 2, figsize=(width, height))
    fig.set_tight_layout(True)
    #fig, axes = plt.subplots(1, 2)

    y_std = [np.zeros(len(y[i])) for i in range(len(y))]

    for i, y_sub in enumerate(y):
        axes[i].set_xlabel("Number of processors $N$")

        if y_sub.ndim != 1:
            print(take_mean(y_sub))
            y_std[i], y[i] = take_mean(y_sub)

        if type[i] == "absolute":
            axes[i].set_ylabel("runtime $T$ [s]")
            axes[i].fill_between(n_procs, y[i]-y_std[i], y[i]+y_std[i], alpha=0.2)
            axes[i].plot(n_procs, y[i], marker='o', linestyle='dashed')
        if type[i] == "speedup":
            axes[i].set_ylabel("speedup $S$")
            linear_nprocs = np.linspace(0, n_procs[-1])
            axes[i].plot(linear_nprocs, linear_nprocs)
            axes[i].fill_between(n_procs, y[i]-y_std[i], y[i]+y_std[i], alpha=0.2)
            axes[i].plot(n_procs, y[i], marker='o', linestyle='dashed')
            axes[i].axhline(y=1, color='r', linestyle='dashed')
        if type[i] == "wait":
            axes[i].set_ylabel('wait time [%]')
            axes[i].plot(n_procs, y[i] * 100, marker='o', linestyle='dashed')
        if type[i] == "efficiency":
            axes[i].set_ylabel("efficiency (speedup / Number of processors)")
            axes[i].plot(n_procs, y[i], marker='o', linestyle='dashed')

        axes[i].grid(0.3)

    filename = prefix + "_bench_nprocs_" + type[0] + "_" + type[1] + ".pdf"

    fig.savefig(filename, bbox_inches="tight")


def plot(y, n_procs, prefix, type, plot_error=False, figsize="big"):
    TEXTWIDTH = 5.62315

    y_std = 0
    if y.ndim != 1:
        y_std, y = take_mean(y)

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
        ax1.fill_between(n_procs, y-y_std, y+y_std, alpha=0.2)
        ax1.plot(n_procs, y, marker='o', linestyle='dashed')
        ax1.set_ylabel("runtime $T$ [s]")
    if type == "speedup":
        linear_nprocs = np.linspace(1, n_procs[-1])
        ax1.plot(linear_nprocs, linear_nprocs)
        ax1.fill_between(n_procs, y-y_std, y+y_std, alpha=0.2)
        ax1.plot(n_procs, y, marker='o', linestyle='dashed')
        #ax1.axhline(y=1, color='r', linestyle='dashed')
        ax1.set_ylabel("speedup $S$")
    if type == "wait":
        ax1.plot(n_procs, y * 100, marker='o', linestyle='dashed')
        ax1.set_ylabel('wait time [% of runtime]')
    if type == "efficiency":
        ax1.plot(n_procs, y, marker='o', linestyle='dashed')
        ax1.set_ylabel("efficiency (speedup / Number of processors)")

    ax1.grid(0.3)

    filename = prefix + "_bench_nprocs_" + type + ".pdf"

    fig.savefig(filename, bbox_inches="tight")
