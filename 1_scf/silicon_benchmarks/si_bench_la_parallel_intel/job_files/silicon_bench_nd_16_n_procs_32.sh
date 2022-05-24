#!/bin/bash
#$ -q th1prio.q
#$ -e $HOME/job_logs/error_logs/
#$ -o /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/silicon/bench_la_parallel_intel/nd_16
#$ -l h_cpu=01:00:00
#$ -l h_vmem=1G
#$ -pe mpi 32
#$ -N silicon_bench_nd_16_n_procs_32
#$ -l excl=TRUE
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0-intel-compiler

module load intel/oneAPI-2021.4

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/pw.x -nd 16 -i in_files/silicon_bench_nd_16_n_procs_32.scf