#!/bin/bash
#$ -q lernfix.q
#$ -e $HOME/job_logs/error_logs/
#$ -o $HOME/job_logs/silicon/bench_nprocs_scalapack/
#$ -l h_cpu=01:00:00
#$ -l excl=TRUE
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0-scalapack

module load scalapack/2.2.0

export LIBRARY_PATH=/opt/sw1/public/scalapack/2.2.0:$LIBRARY_PATH

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/pw.x -i in_files/si_bench_$1.scf
