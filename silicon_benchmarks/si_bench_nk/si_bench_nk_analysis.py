import os
import shutil
from turtle import speed
from matplotlib import style
import numpy as np
import matplotlib.pyplot as plt
import re
import glob

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

#shutil.rmtree("out_files_nprocs")
os.makedirs("out_files_nprocs", exist_ok=True)

runs_nk = os.listdir("out_files")

n_procs = {}
walltimes = {}
cputimes = {}

n_procs_counter = {}

nk_list = []

for run in runs_nk:
    n_procs[run] = np.zeros(len(os.listdir("out_files/" + run)))
    walltimes[run] = np.zeros(len(os.listdir("out_files/" + run)))
    cputimes[run] = np.zeros(len(os.listdir("out_files/" + run)))

for i, run in enumerate(runs_nk):
    files = os.listdir("out_files/" + run)
    nk_list.append(run)

    for j, file in enumerate(files):
        with open("out_files/" + run + "/" + file, "r") as f:
            searchlines = f.readlines()
        for line in searchlines:
            if "running on" in line:
                number_of_processors = re.search("[0-9]+", line).group(0)
                n_procs[run][j] = number_of_processors
                os.makedirs("out_files_nprocs/" + number_of_processors, exist_ok=True)
                #shutil.copy("out_files/" + run + "/" + file, "out_files_nprocs/" + number_of_processors + "/" + file)
            if "PWSCF        :" in line:
                cputimes[run][j] = convert_to_seconds(*re.findall("([ ,0-9]{1,2}h)?([ ,0-9]{1,2}m)?([ ,0-9]{1,2}.[0-9]{1,2}s)", line)[0])
                walltimes[run][j] = convert_to_seconds(*re.findall("([ ,0-9]{1,2}h)?([ ,0-9]{1,2}m)?([ ,0-9]{1,2}.[0-9]{1,2}s)", line)[1])

    cputimes[run] = np.array(cputimes[run][n_procs[run].argsort()])
    walltimes[run] = np.array(walltimes[run][n_procs[run].argsort()])
    n_procs[run] = n_procs[run][n_procs[run].argsort()]

runs_nprocs = os.listdir("out_files_nprocs")

nk = {}
walltimes_nprocs = {}
cputimes_nprocs = {}

for run in runs_nprocs:
    nk[run] = np.zeros(len(os.listdir("out_files_nprocs/" + run)))
    walltimes_nprocs[run] = np.zeros(len(os.listdir("out_files_nprocs/" + run)))
    cputimes_nprocs[run] = np.zeros(len(os.listdir("out_files_nprocs/" + run)))

#print(nk)#
#print(cputimes_nprocs)

for i, run in enumerate(nk):
    files = os.listdir("out_files_nprocs/" + run)

    for j, file in enumerate(files):
        with open("out_files_nprocs/" + run + "/" + file, "r") as f:
            searchlines = f.readlines()
        for line in searchlines:
            if "npool" in line:
                nk[run][j] = re.search("[0-9]+", line).group(0)
            if "PWSCF        :" in line:
                cputimes_nprocs[run][j] = convert_to_seconds(*re.findall("([ ,0-9]{1,2}h)?([ ,0-9]{1,2}m)?([ ,0-9]{1,2}.[0-9]{1,2}s)", line)[0])
                walltimes_nprocs[run][j] = convert_to_seconds(*re.findall("([ ,0-9]{1,2}h)?([ ,0-9]{1,2}m)?([ ,0-9]{1,2}.[0-9]{1,2}s)", line)[1])
        if nk[run][j] == 0:
            nk[run][j] = 1

    cputimes_nprocs[run] = np.array(cputimes_nprocs[run][nk[run].argsort()])
    walltimes_nprocs[run] = np.array(walltimes_nprocs[run][nk[run].argsort()])
    nk[run] = nk[run][nk[run].argsort()]

# Cleanup data

"""
keys_to_remove = ['nk_40', 'nk_32', 'nk_25', 'nk_5']

for key in keys_to_remove:
    del n_procs[key]
    del cputimes[key]
    del walltimes[key]
"""


#cpu_std = np.std(cputimes, axis=0)
#wall_std = np.std(walltimes, axis=0)

#cputimes = np.mean(cputimes, axis=0)
#walltimes = np.mean(walltimes, axis=0)

print(nk)

fig, ax1 = plt.subplots()

for i, run in enumerate(n_procs):
    #print(n_procs)
    #print(cputimes[i])
    #ax1.fill_between(n_procs, cputimes-cpu_std, cputimes+cpu_std, alpha=0.2)
    ax1.plot(n_procs[run], cputimes[run], label=run, marker='o', linestyle='dashed')
    #ax1.fill_between(n_procs, walltimes-wall_std, walltimes+wall_std, alpha=0.2)
    #ax1.plot(n_procs, walltimes[i], label=run, marker='o', linestyle='dashed')

ax1.plot(n_procs["nk_2"], n_procs["nk_2"])

ax1.set_xlabel("Number of processors")
ax1.set_ylabel("runtime [s]")

#left, bottom, width, height = [0.25, 0.565, 0.3, 0.3]
#ax2 = fig.add_axes([left, bottom, width, height])
#ax2.plot(n_procs, walltimes - cputimes, label="WALL-CPU", marker='o', linestyle='dashed', color="red")

#ax2.set_xlabel("Number of processors")
#ax2.set_ylabel("runtime [s]")

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

#cpu_singlecore_std = np.std(cputimes_singlecore)
#wall_singlecore_std = np.std(walltimes_singlecore)

cputime_singlecore = np.mean(cputimes_singlecore)
walltime_singlecore = np.mean(walltimes_singlecore)


fig, ax1 = plt.subplots()

for i, run in enumerate(n_procs):
    speedup_cpu = cputime_singlecore / cputimes[run]
    #speedup_wall = walltime_singlecore / walltimes

    ax1.plot(n_procs[run], speedup_cpu, label=run, marker='o', linestyle='dashed')
    #ax1.plot(n_procs, speedup_wall, label="WALL", marker='o', linestyle='dashed')

#ax1.plot(n_procs["nk_2"], n_procs["nk_2"])

ax1.axhline(y=1, color='r', linestyle='dashed')

ax1.plot(n_procs["nk_2"], 0.6 * n_procs["nk_2"])

ax1.set_xlabel("Number of processors")
ax1.set_ylabel("speedup")

ax1.legend()

fig.savefig("si_bench_nk_speedup.pdf", bbox_inches="tight")

# Efficiency plots

fig, ax1 = plt.subplots()

for i, run in enumerate(n_procs):
    speedup_cpu = cputime_singlecore / cputimes[run]
    efficiency_cpu = speedup_cpu / n_procs[run]
    #speedup_wall = walltime_singlecore / walltimes

    ax1.plot(n_procs[run], efficiency_cpu, label=run, marker='o', linestyle='dashed')
    #ax1.plot(n_procs, speedup_wall, label="WALL", marker='o', linestyle='dashed')

#ax1.plot(n_procs["nk_2"], n_procs["nk_2"])

#ax1.axhline(y=1, color='r', linestyle='dashed')

#ax1.plot(n_procs["nk_2"], 0.6 * n_procs["nk_2"])

ax1.set_xlabel("Number of processors")
ax1.set_ylabel("efficiency (speedup / Number of processors)")

ax1.legend()

fig.savefig("si_bench_nk_efficiency.pdf", bbox_inches="tight")

# nk Plots

#cpu_std = np.std(cputimes, axis=0)
#wall_std = np.std(walltimes, axis=0)

#cputimes = np.mean(cputimes, axis=0)
#walltimes = np.mean(walltimes, axis=0)

fig, ax1 = plt.subplots()

for i, run in enumerate(nk):
    #print(n_procs)
    #print(cputimes[i])
    #ax1.fill_between(n_procs, cputimes-cpu_std, cputimes+cpu_std, alpha=0.2)
    ax1.plot(nk[run], cputimes_nprocs[run], label=run, marker='o', linestyle='none')
    #ax1.fill_between(n_procs, walltimes-wall_std, walltimes+wall_std, alpha=0.2)
    #ax1.plot(n_procs, walltimes[i], label=run, marker='o', linestyle='dashed')

#ax1.plot(n_procs["nk_2"], n_procs["nk_2"])

ax1.set_xlabel("Number of Pools (Nk)")
ax1.set_ylabel("runtime [s]")

#left, bottom, width, height = [0.25, 0.565, 0.3, 0.3]
#ax2 = fig.add_axes([left, bottom, width, height])
#ax2.plot(n_procs, walltimes - cputimes, label="WALL-CPU", marker='o', linestyle='dashed', color="red")

#ax2.set_xlabel("Number of processors")
#ax2.set_ylabel("runtime [s]")

fig.legend(loc = "lower right", bbox_to_anchor = [0.9, 0.11])

fig.savefig("si_bench_nk_x_nk.pdf", bbox_inches="tight")

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

#cpu_singlecore_std = np.std(cputimes_singlecore)
#wall_singlecore_std = np.std(walltimes_singlecore)

cputime_singlecore = np.mean(cputimes_singlecore)
walltime_singlecore = np.mean(walltimes_singlecore)


fig, ax1 = plt.subplots()

for i, run in enumerate(nk):
    speedup_cpu = cputime_singlecore / cputimes_nprocs[run]
    #speedup_wall = walltime_singlecore / walltimes

    ax1.plot(nk[run], speedup_cpu, label=run, marker='o', linestyle='none')
    #ax1.plot(n_procs, speedup_wall, label="WALL", marker='o', linestyle='dashed')

#ax1.plot(n_procs["nk_2"], n_procs["nk_2"])

ax1.axhline(y=1, color='r', linestyle='dashed')

ax1.set_xlabel("Number of pools (Nk)")
ax1.set_ylabel("speedup")

ax1.legend()

fig.savefig("si_bench_nk_speedup_x_Nk.pdf", bbox_inches="tight")

