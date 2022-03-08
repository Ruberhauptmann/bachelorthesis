#!/bin/bash
#$ -q lernfix.q
#$ -e $HOME/job_logs/error_logs/
#$ -o /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/silicon/bench_scalapack_parallel/nd_36
#$ -l h_cpu=01:00:00
#$ -pe mpi 40
#$ -N silicon_bench_nd_36_n_procs_40
#$ -l excl=TRUE
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0-scalapack

module load scalapack/2.2.0

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/pw.x -nd 36 -i in_files/silicon_bench_nd_36_n_procs_40.scf