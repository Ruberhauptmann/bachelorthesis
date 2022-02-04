import os
import numpy as np
import matplotlib.pyplot as plt


files = os.listdir("out_files")
walltimes = np.zeros((2, len(files)))
cputimes = np.zeros((2, len(files)))

print(files)

for i, file in enumerate(files):
    with open("out_files/" + file, "r") as f:
        searchlines = f.readlines()
    for line in searchlines:
        if "kinetic-energy cutoff" in line:
            cputimes[0, i] = line.split(" ")[-3]
            walltimes[0, i] = line.split(" ")[-3]
        if "PWSCF        :" in line:
            print(line.split(" ")[-2][:-1])
            cputimes[1, i] = float(line.split(" ")[-2][:-1])
            walltimes[1, i] = float(line.split(" ")[-9][:-1])

print(cputimes)
print(walltimes)

plt.plot(cputimes[0], cputimes[1], label="CPU time")
plt.plot(walltimes[0], walltimes[1], label="WALL time")

plt.legend()

plt.xlabel("kinetic energy cutoff [Ry]")
plt.ylabel("runtime [s]")

plt.savefig("si_bench_singlecore_ecutwfc.pdf", bbox_inches="tight")
