#!/bin/bash
#$ -q lernfix.q
#$ -e $HOME/job_logs/error_logs/
#$ -o /Users/tjark/job_logs/silicon/bench_nk/nk_19
#$ -l h_cpu=01:00:00
#$ -pe mpi 19
#$ -N silicon_bench_nk_19_n_procs_19
#$ -l excl=TRUE
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0

module load openmpi/4.1.0.gcc10.2-infiniband

mpirun $QEPREFIX/bin/pw.x -nk 19 -i in_files/silicon_bench_nk_19_n_procs_19.scf