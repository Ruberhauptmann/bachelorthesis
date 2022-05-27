#!/bin/bash
#$ -q th1prio.q
#$ -e $HOME/job_logs/error_logs/
#$ -o /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/silicon/bench_nk_intel_compiler_const_poolsize/5/2
#$ -l h_cpu=01:00:00
#$ -l h_vmem=1G
#$ -l excl=TRUE
#$ -pe mpi 24
#$ -N silicon_bench_poolsize_2_n_procs_24_5
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0-intel-compiler

module load intel/oneAPI-2021.4

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/pw.x -nk 12 -i in_files/silicon_bench_poolsize_2_n_procs_24_5.scf