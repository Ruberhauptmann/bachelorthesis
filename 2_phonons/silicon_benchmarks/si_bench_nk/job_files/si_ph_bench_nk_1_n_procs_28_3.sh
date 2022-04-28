#!/bin/bash
#$ -q th1prio.q
#$ -e $HOME/job_logs/error_logs/
#$ -o /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/silicon/phonons/bench_nk/nk_1/28
#$ -l h_cpu=05:00:00
#$ -l excl=TRUE
#$ -pe mpi 28
#$ -N si_ph_bench_nk_1_n_procs_28_3
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0-intel-compiler

module load intel/oneAPI-2021.4

mpirun $QEPREFIX/bin/pw.x -nk 1 -nd 9 -i in_files/si_ph_bench_nk_1_n_procs_28_3.scf

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/ph.x -nk 1 -nd 9 -i in_files/si_ph_bench_nk_1_n_procs_28_3.ph