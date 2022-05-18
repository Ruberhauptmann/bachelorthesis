#!/bin/bash
#$ -q th1prio.q
#$ -e $HOME/job_logs/error_logs/
#$ -o /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/TaS2/phonons
#$ -l h_cpu=40:00:00
#$ -pe mpi 200
#$ -N TaS2_phonons
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0-intel-compiler

module load intel/oneAPI-2021.4

mpirun $QEPREFIX/bin/pw.x -nk 20 -i TaS2_cdw.scf

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/ph.x -ni 10 -nk 2 -i TaS2.ph