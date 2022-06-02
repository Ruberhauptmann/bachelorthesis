#!/bin/bash
#$ -q th1prio.q
#$ -e $HOME/job_logs/error_logs/
#$ -o /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/silicon/phonons/bench_la_parallel_intel/0/nd_9
#$ -l h_cpu=02:00:00
#$ -l excl=TRUE
#$ -pe mpi 36
#$ -N silicon_ph_bench_nd_9_n_procs_36_0
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0-intel-compiler

module load intel/oneAPI-2021.4

mpirun $QEPREFIX/bin/pw.x -nd 9 -i in_files/silicon_ph_bench_nd_9_n_procs_36_0.scf

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/ph.x -nd 9 -i in_files/silicon_ph_bench_nd_9_n_procs_36_0.ph