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

files = os.listdir("out_files")
walltimes = np.zeros((2, len(files)))
cputimes = np.zeros((2, len(files)))

print(files)

for i, file in enumerate(files):
    cputimes[0, i] = file.split("_")[-1].split(".")[0]
    walltimes[0, i] = file.split("_")[-1].split(".")[0]
    with open("out_files/" + file, "r") as f:
        searchlines = f.readlines()
    for line in searchlines:
        if "PWSCF        :" in line:
            cputimes[1, i] = convert_to_seconds(*re.findall("([ ,0-9]{1,2}h)?([ ,0-9]{1,2}m)?([ ,0-9]{1,2}.[0-9]{1,2}s)", line)[0])
            walltimes[1, i] = convert_to_seconds(*re.findall("([ ,0-9]{1,2}h)?([ ,0-9]{1,2}m)?([ ,0-9]{1,2}.[0-9]{1,2}s)", line)[1])

print(cputimes)
print(walltimes)

plt.plot(cputimes[0], cputimes[1], label="CPU time")
plt.plot(walltimes[0], walltimes[1], label="WALL time")

plt.legend()

plt.xlabel("N (NxNxN Monkhorst-Pack grid)")
plt.ylabel("runtime [s]")

plt.savefig("si_bench_singlecore_kpoints.pdf", bbox_inches="tight")

