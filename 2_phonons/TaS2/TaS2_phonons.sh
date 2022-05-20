#!/bin/bash
#$ -q infinix.q
#$ -e $HOME/job_logs/error_logs/
#$ -o /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/TaS2/phonons
#$ -l h_cpu=40:00:00
#$ -l h_vmem=2G
#$ -pe mpi 200
#$ -N TaS2_phonons
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

#QEPREFIX=/fastscratch/tsievers/qe-7.0-intel-compiler
QEPREFIX=/fastscratch/tsievers/qe-7.0-scalapack

module load scalapack/2.2.0

mpirun $QEPREFIX/bin/pw.x -nk 20 -i TaS2_cdw.scf

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/ph.x -ni 10 -nk 2 -i TaS2.ph
