#!/bin/bash
#$ -q th1prio.q
#$ -e $HOME/job_logs/error_logs/
#$ -o /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/TaS2/bench_la_parallel_intel/0/nd_36
#$ -l h_cpu=05:00:00
#$ -l h_vmem=3G
#$ -pe mpi 72
#$ -N TaS2_bench_nd_36_n_procs_72_0
#$ -l excl=TRUE
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0-intel-compiler

module load intel/oneAPI-2021.4

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/pw.x -nk 2 -nd 36 -i in_files/TaS2_bench_nd_36_n_procs_72_0.scf