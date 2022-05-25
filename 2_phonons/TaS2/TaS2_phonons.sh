#!/bin/bash
#$ -q infinix.q
#$ -e $HOME/job_logs/error_logs/
#$ -o /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/TaS2/phonons
#$ -l h_cpu=48:00:00
#$ -l h_vmem=2G
#$ -l excl=TRUE
#$ -pe mpi 100
#$ -N TaS2_24x24_phonons
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0-intel-compiler
#QEPREFIX=/fastscratch/tsievers/qe-7.0-scalapack

#module load scalapack/2.2.0
module load intel/oneAPI-2021.4

mpirun $QEPREFIX/bin/pw.x -nk 5 -i TaS2_6mRy_24x24.scf

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/ph.x -nk 5 -i TaS2.ph | tee /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/TaS2/phonons/output.txt
