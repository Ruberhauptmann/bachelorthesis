#!/bin/bash
#$ -q infinix.q
#$ -e $HOME/job_logs/error_logs/
#$ -o /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/silicon/bench_nk_intel_compiler_const_poolsize/16
#$ -l h_cpu=00:10:00
#$ -l h_vmem=1G
#$ -pe mpi 80
#$ -N silicon_bench_poolsize_16_n_procs_80_0
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0-intel-compiler

module load intel/oneAPI-2021.4

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/pw.x -nk 5 -i in_files/silicon_bench_poolsize_16_n_procs_80_0.scf