import os
import numpy as np
import matplotlib.pyplot as plt
import re


files = os.listdir("out_files")
k_points = np.zeros(len(files))
e_tot = np.zeros(len(files))

for i, file in enumerate(files):
    k_points[i] = re.search("[0-9]+", file).group(0)
    with open("out_files/" + file, "r") as f:
        searchlines = f.readlines()
    for line in searchlines:
        if "!    total energy" in line:
            e_tot[i] = re.search("-\d+.\d+", line).group(0)

plt.plot(k_points, e_tot, marker='o', linestyle='dashed')

plt.xlabel("N (NxNxN Monkhorst-Pack grid)")
plt.ylabel("total energy [Ry]")

plt.savefig("si_kpoints.pdf", bbox_inches="tight")

convergence_crit = 1e-3

converged_index = np.argmax(abs(np.ediff1d(e_tot))<convergence_crit)
print("Calculation is converged with N = ", k_points[converged_index])

