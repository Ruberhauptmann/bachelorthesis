#!/bin/bash
#$ -q th1prio.q
#$ -e $HOME/job_logs/error_logs/
#$ -o /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/silicon/phonons/bench_la_parallel_intel/3/nd_4
#$ -l h_cpu=10:00:00
#$ -l excl=TRUE
#$ -pe mpi 40
#$ -N silicon_ph_bench_nd_4_n_procs_40_3
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0-intel-compiler

module load intel/oneAPI-2021.4

mpirun $QEPREFIX/bin/pw.x -nd 4 -i in_files/silicon_ph_bench_nd_4_n_procs_40_3.scf

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/ph.x -nd 4 -i in_files/silicon_ph_bench_nd_4_n_procs_40_3.ph