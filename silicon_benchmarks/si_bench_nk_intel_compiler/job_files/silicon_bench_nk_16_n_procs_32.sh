#!/bin/bash
#$ -q th1prio.q
#$ -e $HOME/job_logs/error_logs/
#$ -o /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/silicon/bench_nk_intel_compiler/nk_16
#$ -l h_cpu=01:00:00
#$ -l h_vmem=3G
#$ -l excl=TRUE
#$ -pe mpi 32
#$ -N silicon_bench_nk_16_n_procs_32
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0-intel-compiler

ulimit -l unlimited
ulimit -a

module load intel/oneAPI-2021.4

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/pw.x -nk 16 -i in_files/silicon_bench_nk_16_n_procs_32.scf