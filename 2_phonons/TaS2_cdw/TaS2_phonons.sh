#!/bin/bash
#$ -q infinix.q
#$ -e $HOME/job_logs/error_logs/
#$ -o /fastscratch/tsievers/TaS2_cdw_phonons/
#$ -l h_cpu=48:00:00
#$ -l h_vmem=3G
#$ -pe mpi 180
#$ -N TaS2_phonons
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0-intel-compiler

module load intel/oneAPI-2021.4

mpirun $QEPREFIX/bin/pw.x -nk 10 -i TaS2_cdw.scf

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/ph.x -nk 10 -i TaS2.ph
