#!/bin/bash
#$ -q idefix.q
#$ -e $HOME/job_logs/error_logs/
#$ -o /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/silicon/bench_nk_intel_compiler_const_poolsize_idefix/0/2
#$ -l h_cpu=01:00:00
#$ -l h_vmem=3G
#$ -l excl=TRUE
#$ -pe mpi 100
#$ -N silicon_bench_intel_poolsize_2_n_procs_100_0
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0-intel-compiler

module load intel/oneAPI-2021.4

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/pw.x -nk 50 -i in_files/silicon_bench_intel_poolsize_2_n_procs_100_0.scf