#!/bin/bash
#$ -q th1prio.q
#$ -e $HOME/job_logs/error_logs/
#$ -o /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/TaS2/phonons/bench_nk_const_poolsize/0/2
#$ -l h_cpu=20:00:00
#$ -l excl=TRUE
#$ -pe mpi 128
#$ -N TaS2_ph_bench_poolsize_2_n_procs_128_0
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0-intel-compiler

module load intel/oneAPI-2021.4

mpirun -np 128 $QEPREFIX/bin/pw.x -nk 64 -nd 1 -i in_files/TaS2_ph_bench_poolsize_2_n_procs_128_0.scf

mpirun -np 128 $QEPREFIX/bin/ph.x -nk 64 -nd 1 -i in_files/TaS2_ph_bench_poolsize_2_n_procs_128_0.ph