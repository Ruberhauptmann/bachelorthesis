#!/bin/bash
#$ -q infinix.q
#$ -e $HOME/job_logs/error_logs/
#$ -o /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/silicon/phonons/bench_nk_const_poolsize_images/10
#$ -l h_cpu=02:00:00
#$ -l excl=TRUE
#$ -pe mpi 480
#$ -N si_ph_bench_nimages_10_n_procs_480_0
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0-intel-compiler

module load intel/oneAPI-2021.4

mpirun $QEPREFIX/bin/pw.x -nk 240 -nd 9 -i in_files/si_ph_bench_nimages_10_n_procs_480_0.scf

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/ph.x -ni 10 -nk 24 -nd 9 -i in_files/si_ph_bench_nimages_10_n_procs_480_0.ph