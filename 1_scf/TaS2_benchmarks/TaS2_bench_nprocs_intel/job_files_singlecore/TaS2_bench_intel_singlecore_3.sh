#!/bin/bash
#$ -q th1prio.q
#$ -o /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/TaS2/bench_nprocs_intel/singlecore/3
#$ -pe mpi 4
#$ -N TaS2_bench_intel_singlecore_3
#$ -l h_cpu=25:00:00
#$ -l h_vmem=20G
#$ -l s_vmem=15G
#$ -l excl=TRUE
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0-intel-compiler

module load intel/oneAPI-2021.4

/usr/bin/time --format=%e -p mpirun -n 1 $QEPREFIX/bin/pw.x -i in_files_singlecore/TaS2_bench_intel_singlecore_3.scf