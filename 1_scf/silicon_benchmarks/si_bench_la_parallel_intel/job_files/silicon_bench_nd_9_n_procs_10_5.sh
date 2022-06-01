#!/bin/bash
#$ -q th1prio.q
#$ -e $HOME/job_logs/error_logs/
#$ -o /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/silicon/bench_la_parallel_intel/5/nd_9
#$ -l h_cpu=01:00:00
#$ -l h_vmem=1G
#$ -pe mpi 10
#$ -N silicon_bench_nd_9_n_procs_10_5
#$ -l excl=TRUE
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0-intel-compiler

module load intel/oneAPI-2021.4

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/pw.x -nd 9 -i in_files/silicon_bench_nd_9_n_procs_10_5.scf