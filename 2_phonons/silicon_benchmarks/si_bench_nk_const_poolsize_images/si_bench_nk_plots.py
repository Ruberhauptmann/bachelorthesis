import numpy as np
import os

from qe_benchmarking import nk_plots, qe_helper

if __name__ == "__main__":
    nimage_list = os.listdir('out_files')

    for nimage in nimage_list:
        ### Plot absolute times

        cputimes, walltimes, n_procs = qe_helper.extract_times_nk("out_files/" + nimage, type="ph", multiple_runs=False)

        nk_plots.plot(walltimes, cputimes, n_procs, "si_ph_" + nimage, "absolute")

        ### Plot speedup

        cputimes_singlecore, walltimes_singlecore = qe_helper.extract_times("out_files_singlecore", type="ph", multiple_runs=False)[0:2]

        cputime_singlecore = np.mean(cputimes_singlecore)
        walltime_singlecore = np.mean(walltimes_singlecore)

        speedup_cpu = {}
        speedup_wall = {}

        for nk in n_procs:
            speedup_cpu[nk] = cputime_singlecore / cputimes[nk]
            speedup_wall[nk] = walltime_singlecore / walltimes[nk]

        nk_plots.plot(speedup_wall, speedup_cpu, n_procs, "si_ph_" + nimage, "speedup")

        ### Plot idle time

        wait_time = {}

        for nk in n_procs:
            wait_time[nk] = (walltimes[nk] - cputimes[nk]) / walltimes[nk]

        nk_plots.plot(wait_time, wait_time, n_procs, "si_ph_" + nimage, "wait")

        ### Plot efficiency

        efficiency_cpu = {}
        efficiency_wall = {}

        for nk in n_procs:
            efficiency_cpu[nk] = speedup_cpu[nk] / n_procs[nk]
            efficiency_wall[nk] = speedup_wall[nk] / n_procs[nk]

        nk_plots.plot(efficiency_cpu, efficiency_wall, n_procs, "si_ph_" + nimage, "efficiency")