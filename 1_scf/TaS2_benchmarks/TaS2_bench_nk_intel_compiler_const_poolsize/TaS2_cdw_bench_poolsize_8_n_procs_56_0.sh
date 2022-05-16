#!/bin/bash
#$ -q infinix.q
#$ -e $HOME/job_logs/error_logs/
#$ -o /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/TaS2/bench_nk_intel_compiler_const_poolsize/8
#$ -l h_cpu=1:00:00
#$ -l h_vmem=3G
#$ -pe mpi 56
#$ -N TaS2_cdw_bench_poolsize_8_n_procs_56_0
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0-intel-compiler

module load intel/oneAPI-2021.4

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/pw.x -nk 7 -i TaS2_cdw_bench_poolsize_8_n_procs_56_0.scf
