import numpy as np
import matplotlib.pyplot as plt
plt.style.use('seaborn-colorblind')

def take_mean(cpu_y, wall_y):
    cpu_std = np.std(cpu_y, axis=0)
    wall_std = np.std(wall_y, axis=0)

    cpu_y = np.mean(cpu_y, axis=0)
    wall_y = np.mean(wall_y, axis=0)

    return cpu_std, wall_std, cpu_y,wall_y 

def plot(cpu_y, wall_y, n_procs, prefix, type, plot_error=False):
    cpu_std, wall_std, cpu_y, wall_y = take_mean(cpu_y, wall_y)

    fig, ax1 = plt.subplots()

    if plot_error:
        ax1.fill_between(n_procs, cpu_y-cpu_std, cpu_y+cpu_std, alpha=0.2)
        ax1.plot(n_procs, cpu_y, label="CPU", marker='o', linestyle='dashed')
        ax1.fill_between(n_procs, wall_y-wall_std, wall_y+wall_std, alpha=0.2)
        ax1.plot(n_procs, wall_y, label="WALL", marker='o', linestyle='dashed')
    else:
        ax1.plot(n_procs, cpu_y, label="CPU", marker='o', linestyle='dashed')
        ax1.plot(n_procs, wall_y, label="WALL", marker='o', linestyle='dashed')

    ax1.set_xlabel("Number of processors")

    if type == "absolute":
        ax1.set_ylabel("runtime [s]")
    if type == "speedup":
        ax1.axhline(y=1, color='r', linestyle='dashed')
        ax1.set_ylabel("speedup")
    if type == "efficiency":
        ax1.set_ylabel("efficiency (speedup / Number of processors)")

    ax1.legend()

    filename = prefix + "_bench_nprocs_" + type + ".pdf"

    fig.savefig(filename, bbox_inches="tight")
