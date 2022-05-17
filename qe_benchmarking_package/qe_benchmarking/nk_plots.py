from matplotlib import markers
import numpy as np
import matplotlib.pyplot as plt
plt.style.use('seaborn-colorblind')

def plot(y, n_procs, prefix, type):
    fig, ax1 = plt.subplots()

    for nk in n_procs:
        ax1.plot(n_procs[nk], y[nk], label=nk, marker='o', linestyle='dashed')
    
    if type == "speedup":
        linear_nprocs = np.linspace(0, n_procs[list(n_procs)[-1]][-1])
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