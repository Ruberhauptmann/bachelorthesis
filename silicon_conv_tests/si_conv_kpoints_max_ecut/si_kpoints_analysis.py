import os
import numpy as np
import matplotlib.pyplot as plt


files = os.listdir("out_files")
data = np.zeros((2, len(files)))

print(files)

for i, file in enumerate(files):
    data[0, i] = file.split("_")[2].split(".")[0]
    with open("out_files/" + file, "r") as f:
        searchlines = f.readlines()
    for line in searchlines:
        if "!    total energy" in line:
            data[1, i] = line.split(" ")[-2]

data = np.array([data[0, data.argsort()[0]], data[1, data.argsort()[0]]])
print(data)

plt.plot(data[0], data[1], marker='o', linestyle='dashed')

plt.xlabel("N (NxNxN Monkhorst-Pack grid)")
plt.ylabel("total energy [Ry]")

plt.savefig("si_kpoints.pdf", bbox_inches="tight")

convergence_crit = 1e-3

converged_index = np.argmax(abs(np.ediff1d(data[1]))<convergence_crit)
print("Calculation is converged with N = ", data[0][converged_index])
