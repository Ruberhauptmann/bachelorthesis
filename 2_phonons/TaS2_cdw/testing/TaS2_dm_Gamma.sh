#!/bin/bash
#$ -q infinix.q
#$ -e $HOME/job_logs/error_logs/
#$ -l h_cpu=00:10:00
#$ -l h_vmem=1G
#$ -pe mpi 1
#$ -cwd
#$ -S /bin/bash
#$ -N TaS2_cdw_Gamma
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0-intel-compiler

module load intel/oneAPI-2021.4

mpirun $QEPREFIX/bin/dynmat.x < TaS2_dm_Gamma.in > TaS2_dm_Gamma.output
