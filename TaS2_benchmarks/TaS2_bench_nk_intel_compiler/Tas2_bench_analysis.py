import enum
import numpy as np
import sys
import os

sys.path.append("../../")

from helper import qe_helper
from helper.plot_helper import nk_plots

if __name__ == "__main__":
    nk_list = os.listdir("out_files/")
    print(nk_list)
    
    cputimes = {}
    walltimes = {}

    for nk in nk_list:
        n_procs_list = os.listdir("out_files/" + nk)

        cputimes[nk] = {}

        for n_procs in n_procs_list:
            print(n_procs)
            files = os.listdir("out_files/" + nk + "/" + n_procs)

            cputimes[nk][n_procs] = np.zeros(len(files))

            for file_index, file in enumerate(files):
                with open("out_files/" + nk + "/" + n_procs + "/" + file, "r") as f:
                    searchlines = f.readlines()
                    cputimes[nk][n_procs][file_index] = qe_helper.search_times(searchlines, int(n_procs))[0]

    for nk in cputimes:
        for n_procs in cputimes[nk]:
            print("nk = {nk}, N processors = {n_procs}, Mean execution time = {cpu_time:.2f} +- {cpu_time_std}". format(nk=nk, n_procs=n_procs, cpu_time=np.mean(cputimes[nk][n_procs]), cpu_time_std=np.std(cputimes[nk][n_procs])))
