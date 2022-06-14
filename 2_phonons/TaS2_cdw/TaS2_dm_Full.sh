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

mpirun $QEPREFIX/bin/q2r.x < TaS2_q2r.in > TaS2_q2r.output
mpirun $QEPREFIX/bin/matdyn.x < TaS2_md.in > TaS2_md.output

