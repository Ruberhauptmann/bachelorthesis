import numpy as np
import matplotlib.pyplot as plt
plt.style.use('seaborn-colorblind')

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
    if type == "speedup":
        ax1.axhline(y=1, color='r', linestyle='dashed')
        ax1.set_ylabel("speedup")
    if type == "wait":
        ax1.set_ylabel("system time")
    if type == "efficiency":
        ax1.set_ylabel("efficiency (speedup / Number of processors)")

    filename = prefix + "_bench_nprocs_" + type + ".pdf"

    fig.savefig(filename, bbox_inches="tight")
