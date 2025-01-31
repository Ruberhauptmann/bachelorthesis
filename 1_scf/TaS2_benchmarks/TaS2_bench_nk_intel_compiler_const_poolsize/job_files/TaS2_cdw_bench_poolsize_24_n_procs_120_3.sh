#!/bin/bash
#$ -q th1prio.q
#$ -e $HOME/job_logs/error_logs/
#$ -o /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/TaS2/bench_nk_intel_compiler_const_poolsize/3/24
#$ -l h_cpu=03:00:00
#$ -l h_vmem=3G
#$ -pe mpi 120
#$ -N TaS2_cdw_bench_poolsize_24_n_procs_120_3
#$ -l excl=TRUE
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0-intel-compiler

module load intel/oneAPI-2021.4

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/pw.x -nd 1 -nk 5 -i in_files/TaS2_cdw_bench_poolsize_24_n_procs_120_3.scf