#!/bin/bash
#$ -q th1prio.q
#$ -e $HOME/job_logs/error_logs/
#$ -o /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/silicon/phonons/bench_nk_const_poolsize/4/2
#$ -l h_cpu=07:00:00
#$ -l excl=TRUE
#$ -l h_vmem=4G
#$ -pe mpi 2
#$ -N si_ph_bench_poolsize_2_n_procs_2_4
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0-intel-compiler

module load intel/oneAPI-2021.4

mpirun $QEPREFIX/bin/pw.x -nk 1 -nd 1 -i in_files/si_ph_bench_poolsize_2_n_procs_2_4.scf

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/ph.x -nk 1 -nd 1 -i in_files/si_ph_bench_poolsize_2_n_procs_2_4.ph