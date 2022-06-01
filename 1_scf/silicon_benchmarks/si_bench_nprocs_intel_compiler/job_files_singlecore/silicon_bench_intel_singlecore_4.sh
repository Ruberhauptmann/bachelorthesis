#!/bin/bash
#$ -q th1prio.q
#$ -e $HOME/job_logs/error_logs/
#$ -o /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/silicon/bench_nprocs_intel_compiler/singlecore/4
#$ -pe mpi 1
#$ -N silicon_bench_intel_singlecore_4
#$ -l h_cpu=00:30:00
#$ -l h_vmem=1G
#$ -l excl=TRUE
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0-intel-compiler

module load intel/oneAPI-2021.4

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/pw.x -i in_files_singlecore/silicon_bench_intel_singlecore_4.scf