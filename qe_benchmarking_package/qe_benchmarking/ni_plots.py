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
    y_images_std, y_images_mean = take_image_mean(y)
    y_run_std, y_run_mean = take_mean(y_images_mean)
    for ni in y:
        y_run_std[ni] = np.mean(y_images_std[ni], axis=0)

    fig, ax1 = plt.subplots()

    for ni in n_procs:
        ax1.fill_between(n_procs[ni][0], y_run_mean[ni]-y_run_std[ni], y_run_mean[ni]+y_run_std[ni], alpha=0.2)
        ax1.plot(n_procs[ni][0], y_run_mean[ni], label=ni, marker='o', linestyle='dashed')

    ax1.set_ylabel("runtime [s]")
    ax1.legend()

    filename = prefix + "_images_distribution.pdf"

    fig.savefig(filename, bbox_inches="tight")

def plot(y, n_procs, prefix, type, plot_error=False):
    y_std, y_mean = take_mean(y)

    fig, ax1 = plt.subplots()

    for ni in n_procs:
        if plot_error:
            ax1.fill_between(n_procs[ni][0], y_mean[ni]-y_std[ni], y_mean[ni]+y_std[ni], alpha=0.2)
            ax1.plot(n_procs[ni][0], y_mean[ni], label=ni, marker='o', linestyle='dashed')
        else:
            ax1.plot(n_procs[ni][0], y_mean[ni], label=ni, marker='o', linestyle='dashed')

    max_nprocs = 0
    for ni in n_procs:
        if np.max(n_procs[ni].flatten()) > max_nprocs:
            max_nprocs = np.max(n_procs[ni].flatten())
    
    if type == "speedup":
        linear_nprocs = np.linspace(0, max_nprocs)
        ax1.plot(linear_nprocs, linear_nprocs)

    ax1.set_xlabel("Number of processors")

    if type == "absolute":
        ax1.set_ylabel("runtime [s]")
    if type == "speedup":
        ax1.axhline(y=1, color='r', linestyle='dashed')
        ax1.set_ylabel("speedup")
    if type == "wait":
        ax1.set_ylabel("system time")
    if type == "efficiency":
        ax1.set_ylabel("efficiency (speedup / Number of processors)")

    ax1.legend()

    filename = prefix + "_bench_ni_" + type + ".pdf"

    fig.savefig(filename, bbox_inches="tight")