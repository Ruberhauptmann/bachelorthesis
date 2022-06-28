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
        linear_nprocs = np.linspace(0, max_nprocs)
        ax1.plot(linear_nprocs, linear_nprocs)

    for ni in n_procs:
        color = next(ax1._get_lines.prop_cycler)['color']
        if plot_error:
            if len(n_procs[ni][0]) == 1:
                ax1.errorbar(n_procs[ni][0], y_mean[ni], y_std[ni], color=color)
            ax1.fill_between(n_procs[ni][0], y_mean[ni]-y_std[ni], y_mean[ni]+y_std[ni], alpha=0.2, color=color)
            ax1.plot(n_procs[ni][0], y_mean[ni], label=ni, marker='o', linestyle='dashed', color=color)
        elif type == "wait":
            ax1.plot(n_procs[ni][0], y_mean[ni] * 100, label=ni, marker='o', linestyle='dashed', color=color)
        else:
            ax1.plot(n_procs[ni][0], y_mean[ni], label=ni, marker='o', linestyle='dashed', color=color)

    ax1.set_xlabel("number of processors $N$")

    if type == "absolute":
        ax1.set_ylabel("runtime $T$ [s]")
    if type == "speedup":
        ax1.axhline(y=1, color='r', linestyle='dashed')
        ax1.set_ylabel("speedup $S$")
    if type == "wait":
        ax1.set_ylabel("wait time [%]")
    if type == "efficiency":
        ax1.set_ylabel("efficiency (speedup / Number of processors)")

    ax1.legend()
    ax1.grid(0.3)

    filename = prefix + "_bench_ni_" + type + ".pdf"

    fig.savefig(filename, bbox_inches="tight")