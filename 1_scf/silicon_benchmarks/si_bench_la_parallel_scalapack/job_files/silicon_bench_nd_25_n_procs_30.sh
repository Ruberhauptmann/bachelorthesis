#!/bin/bash
#$ -q lernfix.q
#$ -e $HOME/job_logs/error_logs/
#$ -o /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/silicon/bench_scalapack_parallel/nd_25
#$ -l h_cpu=01:00:00
#$ -pe mpi 30
#$ -N silicon_bench_nd_25_n_procs_30
#$ -l excl=TRUE
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0-scalapack

module load scalapack/2.2.0

export LIBRARY_PATH=/opt/sw1/public/scalapack/2.2.0:$LIBRARY_PATH

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/pw.x -nd 25 -i in_files/silicon_bench_nd_25_n_procs_30.scf