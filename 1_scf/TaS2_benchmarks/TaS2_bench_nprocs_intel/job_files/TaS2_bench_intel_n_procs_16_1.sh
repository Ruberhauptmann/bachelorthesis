#!/bin/bash
#$ -q th1prio.q
#$ -o /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/TaS2/bench_nprocs_intel/1
#$ -pe mpi 16
#$ -N TaS2_bench_intel_n_procs_16_1
#$ -l h_cpu=6:00:00
#$ -l h_vmem=3G
#$ -l excl=TRUE
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0-intel-compiler

module load intel/oneAPI-2021.4

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/pw.x -i in_files/TaS2_bench_intel_n_procs_16_1.scf