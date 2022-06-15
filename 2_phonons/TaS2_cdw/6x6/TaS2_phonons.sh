#!/bin/bash
#$ -q th1prio.q
#$ -e $HOME/job_logs/error_logs/
#$ -o /fastscratch/tsievers/TaS2_cdw_phonons_full_180
#$ -l h_cpu=150:00:00
#$ -l h_vmem=3G
#$ -l excl=TRUE
#$ -pe mpi 180
#$ -cwd
#$ -S /bin/bash
#$ -N TaS2_cdw_6
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0-intel-compiler

module load intel/oneAPI-2021.4

mpirun $QEPREFIX/bin/pw.x -nk 5 -i TaS2_cdw.scf

mpirun $QEPREFIX/bin/ph.x -nk 5 -i TaS2.ph
