#!/bin/bash
#$ -q infinix.q
#$ -e $HOME/job_logs/error_logs/
#$ -o /fastscratch/tsievers/job_logs/
#$ -l h_cpu=05:00:00
#$ -l h_vmem=3G
#$ -l excl=TRUE
#$ -pe mpi 144
#$ -N TaS2_24x24_phonons
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0-intel-compiler
#QEPREFIX=/fastscratch/tsievers/qe-7.0-scalapack

#module load scalapack/2.2.0
module load intel/oneAPI-2021.4

mpirun $QEPREFIX/bin/pw.x -nk 8 -i TaS2_6mRy_24x24.scf

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/ph.x -ni 8 -nk 1 -i TaS2_full.ph
