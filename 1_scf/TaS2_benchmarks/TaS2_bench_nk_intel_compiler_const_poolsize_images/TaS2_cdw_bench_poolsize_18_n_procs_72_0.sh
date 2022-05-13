#!/bin/bash
#$ -q th1prio.q
#$ -e $HOME/job_logs/error_logs/
#$ -o /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/TaS2/bench_nk_intel_compiler_const_poolsize/18
#$ -l h_cpu=1:00:00
#$ -l h_vmem=3G
#$ -pe mpi 72
#$ -N TaS2_cdw_bench_poolsize_18_n_procs_72_0
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0-intel-compiler

module load intel/oneAPI-2021.4

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/pw.x -nk 4 -i TaS2_cdw_bench_poolsize_18_n_procs_72_0.scf
