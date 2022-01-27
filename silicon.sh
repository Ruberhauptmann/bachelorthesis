#!/bin/bash
#$ -q infinix-noht.q
#$ -e $HOME/job_logs/silicon_testing/error_logs/
#$ -o $HOME/job_logs/silicon_testing/logs/
#$ -pe mpi 1
#$ -l h_cpu=01:00:00
#$ -cwd
#$ -S /bin/bash

QEPREFIX=/fastscratch/tsievers/qe-7.0

module load openmpi/4.1.0.gcc10.2-infiniband

mpirun -n 1 $QEPREFIX/bin/pw.x -i silicon.in

