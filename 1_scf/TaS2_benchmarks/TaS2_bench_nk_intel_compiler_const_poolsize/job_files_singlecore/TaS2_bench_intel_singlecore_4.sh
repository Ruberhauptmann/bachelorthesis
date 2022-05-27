#!/bin/bash
#$ -q th1prio.q
#$ -e $HOME/job_logs/error_logs/
#$ -o /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/TaS2/bench_nprocs_intel/singlecore/4
#$ -l h_cpu=24:00:00
#$ -l h_vmem=8G
#$ -pe mpi 1
#$ -N TaS2_bench_intel_singlecore_4
#$ -l excl=TRUE
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0-intel-compiler

module load intel/oneAPI-2021.4

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/pw.x -nd 1 -i in_files_singlecore/TaS2_bench_intel_singlecore_4.scf