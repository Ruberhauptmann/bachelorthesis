#!/bin/bash
#$ -q th1prio.q
#$ -e $HOME/job_logs/error_logs/
#$ -o /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/silicon/bench_nprocs_openblas/1
#$ -pe mpi 26
#$ -N silicon_bench_openblas_n_procs_26_1
#$ -l h_cpu=00:30:00
#$ -l excl=TRUE
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0-openblas

module load openmpi/4.1.0.gcc10.2-infiniband
module load openblas/0.3.20

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/pw.x -i in_files/silicon_bench_openblas_n_procs_26_1.scf