import os
import numpy as np
import matplotlib.pyplot as plt


files = os.listdir("out_files")
data = np.zeros((2, len(files)))

print(files)

for i, file in enumerate(files):
    with open("out_files/" + file, "r") as f:
        searchlines = f.readlines()
    for line in searchlines:
        if "kinetic-energy cutoff" in line:
            data[0, i] = line.split(" ")[-3]
        if "!    total energy" in line:
            data[1, i] = line.split(" ")[-2]

print(data)

plt.plot(data[0], data[1])

plt.xlabel("kinetic energy cutoff [Ry]")
plt.ylabel("total energy [Ry]")

plt.savefig("si_ecutwfc.pdf", bbox_inches="tight")

convergence_crit = 1e-3

converged_index = np.argmax(abs(np.ediff1d(data[1]))<convergence_crit)
print("Calculation is converged with E_cut = ", data[0][converged_index])
