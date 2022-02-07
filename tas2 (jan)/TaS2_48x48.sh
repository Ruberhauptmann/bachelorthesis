#!/bin/bash
#$ -q lernfix.q
#$ -e $HOME/job_logs/tas2_testing/error_logs/
#$ -o $HOME/job_logs/tas2_testing/logs/
#$ -pe mpi 20
#$ -l h_cpu=01:00:00
#$ -cwd
#$ -S /bin/bash

QEPREFIX=/fastscratch/tsievers/qe-7.0

module load openmpi/4.1.0.gcc10.2-infiniband

mpirun -n 20 $QEPREFIX/bin/pw.x -i TaS2_2mRy_48x48.scf

