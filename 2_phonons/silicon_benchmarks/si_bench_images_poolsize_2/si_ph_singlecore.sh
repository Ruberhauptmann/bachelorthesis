#!/bin/bash
#$ -q th1prio.q
#$ -e $HOME/job_logs/error_logs/
#$ -o /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/silicon/phonons/
#$ -l h_cpu=30:00:00
#$ -l h_vmem=10G
#$ -l excl=TRUE
#$ -pe mpi 1
#$ -N si_ph_bench_n_procs_1
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0-intel-compiler

module load intel/oneAPI-2021.4

mpirun $QEPREFIX/bin/pw.x -i si_ph_bench_singlecore.scf

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/ph.x -i si_ph_bench_singlecore.ph