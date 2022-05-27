import numpy as np
import matplotlib.pyplot as plt
from sympy import MutableSparseMatrix
plt.style.use('seaborn-colorblind')

def take_mean(y):
    y_std = {}
    y_mean = {}
    for nk in y:
        y_std[nk] = np.std(y[nk], axis=0)
        y_mean[nk] = np.mean(y[nk], axis=0)

    return y_std, y_mean

def plot(y, n_procs, prefix, type, plot_error=False):
    y_std, y_mean = take_mean(y)

    fig, ax1 = plt.subplots()

    for nk in n_procs:
        if plot_error:
            ax1.fill_between(n_procs[nk][0], y_mean[nk]-y_std[nk], y_mean[nk]+y_std[nk], alpha=0.2)
            ax1.plot(n_procs[nk][0], y_mean[nk], label=nk, marker='o', linestyle='dashed')
        else:
            ax1.plot(n_procs[nk], y_mean[nk], label=nk, marker='o', linestyle='dashed')

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