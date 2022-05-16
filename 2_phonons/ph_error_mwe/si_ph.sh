#!/bin/bash
#$ -q th1prio.q
#$ -l h_cpu=02:00:00
#$ -l excl=TRUE
#$ -pe mpi 80
#$ -N si_ph
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=BITTEEINTRAGEN

module load intel/oneAPI-2021.4

mpirun $QEPREFIX/pw.x -nk 40 -nd 9 -i si_ph.scf

/usr/bin/time --format=%e -p mpirun $QEPREFIX/ph.x -ni 8 -nk 5 -nd 9 -i si_ph.ph
