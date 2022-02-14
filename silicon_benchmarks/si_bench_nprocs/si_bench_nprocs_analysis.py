import os
from turtle import speed
from matplotlib import style
import numpy as np
import matplotlib.pyplot as plt
import re

def convert_to_seconds(hours, minutes, seconds):
    """Converts times in 00h00m00s format to seconds
    """
    if not hours:
        hours = 0
    else:
        hours = float(hours[:-1])
    if not minutes:
        minutes = 0
    else:
        minutes = float(minutes[:-1])

    seconds = float(seconds[:-1])

    return hours * 3600 + minutes * 60 + seconds

runs = os.listdir("out_files")

n_procs = np.zeros(len(os.listdir("out_files/1")))
walltimes = np.zeros((len(runs), len(os.listdir("out_files/1"))))
cputimes = np.zeros((len(runs), len(os.listdir("out_files/1"))))

for run in runs:
    files = os.listdir("out_files/" + run)

    for i, file in enumerate(files):
        with open("out_files/" + run + "/" + file, "r") as f:
            searchlines = f.readlines()
        for line in searchlines:
            if "running on" in line:
                n_procs[i] = re.search("[0-9]+", line).group(0)
            if "PWSCF        :" in line:
                cputimes[int(run) - 1, i] = convert_to_seconds(*re.findall("([ ,0-9]{1,2}h)?([ ,0-9]{1,2}m)?([ ,0-9]{1,2}.[0-9]{1,2}s)", line)[0])
                walltimes[int(run) - 1, i] = convert_to_seconds(*re.findall("([ ,0-9]{1,2}h)?([ ,0-9]{1,2}m)?([ ,0-9]{1,2}.[0-9]{1,2}s)", line)[1])

    cputimes[int(run) - 1] = np.array(cputimes[int(run) - 1, n_procs.argsort()])
    walltimes[int(run) - 1] = np.array(walltimes[int(run) - 1, n_procs.argsort()])

cpu_std = np.std(cputimes, axis=0)
wall_std = np.std(walltimes, axis=0)

cputimes = np.mean(cputimes, axis=0)
walltimes = np.mean(walltimes, axis=0)

fig, ax1 = plt.subplots()

ax1.fill_between(n_procs, cputimes-cpu_std, cputimes+cpu_std, alpha=0.2)
ax1.plot(n_procs, cputimes, label="CPU", marker='o', linestyle='dashed')
ax1.fill_between(n_procs, walltimes-wall_std, walltimes+wall_std, alpha=0.2)
ax1.plot(n_procs, walltimes, label="WALL", marker='o', linestyle='dashed')

ax1.set_xlabel("Number of processors")
ax1.set_ylabel("runtime [s]")

left, bottom, width, height = [0.25, 0.565, 0.3, 0.3]
ax2 = fig.add_axes([left, bottom, width, height])
ax2.plot(n_procs, walltimes - cputimes, label="WALL-CPU", marker='o', linestyle='dashed', color="red")

ax2.set_xlabel("Number of processors")
ax2.set_ylabel("runtime [s]")

fig.legend(loc = "lower right", bbox_to_anchor = [0.9, 0.11])

fig.savefig("si_bench_nprocs.pdf", bbox_inches="tight")

# Speedup plots

files_singlecore = os.listdir("out_files_singlecore")
walltimes_singlecore = np.zeros((len(files_singlecore)))
cputimes_singlecore = np.zeros((len(files_singlecore)))

for i, file in enumerate(files_singlecore):
    with open("out_files_singlecore/" + file, "r") as f:
        searchlines = f.readlines()
    for line in searchlines:
        if "PWSCF        :" in line:
            cputimes_singlecore[i] = convert_to_seconds(*re.findall("([ ,0-9]{1,2}h)?([ ,0-9]{1,2}m)?([ ,0-9]{1,2}.[0-9]{1,2}s)", line)[0])
            walltimes_singlecore[i] = convert_to_seconds(*re.findall("([ ,0-9]{1,2}h)?([ ,0-9]{1,2}m)?([ ,0-9]{1,2}.[0-9]{1,2}s)", line)[1])

cpu_singlecore_std = np.std(cputimes_singlecore)
wall_singlecore_std = np.std(walltimes_singlecore)

cputime_singlecore = np.mean(cputimes_singlecore)
walltime_singlecore = np.mean(walltimes_singlecore)

speedup_cpu = cputime_singlecore / cputimes
speedup_wall = walltime_singlecore / walltimes

fig, ax1 = plt.subplots()

ax1.plot(n_procs, speedup_cpu, label="CPU", marker='o', linestyle='dashed')
ax1.plot(n_procs, speedup_wall, label="WALL", marker='o', linestyle='dashed')

ax1.axhline(y=1, color='r', linestyle='dashed')

ax1.set_xlabel("Number of processors")
ax1.set_ylabel("speedup")

ax1.legend()

fig.savefig("si_bench_nprocs_speedup.pdf", bbox_inches="tight")
