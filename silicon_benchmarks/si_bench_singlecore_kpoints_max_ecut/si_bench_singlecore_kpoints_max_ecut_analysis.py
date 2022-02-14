import os
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

k_points = np.zeros(len(os.listdir("out_files/1")))
walltimes = np.zeros((len(runs), len(os.listdir("out_files/1"))))
cputimes = np.zeros((len(runs), len(os.listdir("out_files/1"))))

for run in runs:
    files = os.listdir("out_files/" + run)

    for i, file in enumerate(files):
        k_points[i] = re.search("[0-9]+", file).group(0)
        with open("out_files/" + run + "/" + file, "r") as f:
            searchlines = f.readlines()
        for line in searchlines:
            if "PWSCF        :" in line:
                cputimes[int(run) - 1, i] = convert_to_seconds(*re.findall("([ ,0-9]{1,2}h)?([ ,0-9]{1,2}m)?([ ,0-9]{1,2}.[0-9]{1,2}s)", line)[0])
                walltimes[int(run) - 1, i] = convert_to_seconds(*re.findall("([ ,0-9]{1,2}h)?([ ,0-9]{1,2}m)?([ ,0-9]{1,2}.[0-9]{1,2}s)", line)[1])

    cputimes[int(run) - 1] = np.array(cputimes[int(run) - 1, k_points.argsort()])
    walltimes[int(run) - 1] = np.array(walltimes[int(run) - 1, k_points.argsort()])

cpu_std = np.std(cputimes, axis=0)
wall_std = np.std(walltimes, axis=0)

cputimes = np.mean(cputimes, axis=0)
walltimes = np.mean(walltimes, axis=0)

fig, ax1 = plt.subplots()

ax1.fill_between(k_points**3, cputimes-cpu_std, cputimes+cpu_std, alpha=0.2)
ax1.plot(k_points**3, cputimes, label="CPU", marker='o', linestyle='dashed')
ax1.fill_between(k_points**3, walltimes-wall_std, walltimes+wall_std, alpha=0.2)
ax1.plot(k_points**3, walltimes, label="WALL", marker='o', linestyle='dashed')

ax1.legend()

ax1.set_xlabel("Number of kpoints")
ax1.set_ylabel("runtime [s]")

fig.savefig("si_bench_singlecore_kpoints_max_ecut.pdf", bbox_inches="tight")
