#!/bin/bash
#$ -q th1prio.q
#$ -e $HOME/job_logs/error_logs/
#$ -o /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/silicon/bench_nprocs_scalapack/1
#$ -pe mpi 2
#$ -N silicon_bench_scalapack_n_procs_2_1
#$ -l h_cpu=00:30:00
#$ -l excl=TRUE
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0-scalapack

module load scalapack/2.2.0

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/pw.x -nd 1 -i in_files/silicon_bench_scalapack_n_procs_2_1.scf