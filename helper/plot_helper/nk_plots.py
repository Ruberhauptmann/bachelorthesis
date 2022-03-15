import numpy as np
import matplotlib.pyplot as plt
plt.style.use('seaborn-colorblind')

def plot(cpu_y, wall_y, n_procs, prefix, type):
    fig, ax1 = plt.subplots()

    for nk in n_procs:
        ax1.plot(n_procs[nk], cpu_y[nk], label=nk, marker='o', linestyle='dashed')

    ax1.set_xlabel("Number of processors")

    if type == "absolute":
        ax1.set_ylabel("runtime [s]")
    if type == "speedup":
        ax1.axhline(y=1, color='r', linestyle='dashed')
        ax1.set_ylabel("speedup")
    if type == "efficiency":
        ax1.set_ylabel("efficiency (speedup / Number of processors)")

    ax1.legend()

    filename = prefix + "_bench_nk_" + type + ".pdf"

    fig.savefig(filename, bbox_inches="tight")