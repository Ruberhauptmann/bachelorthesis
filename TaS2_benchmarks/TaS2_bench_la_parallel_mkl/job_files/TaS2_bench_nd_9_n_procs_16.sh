#!/bin/bash
#$ -q lernfix.q
#$ -e $HOME/job_logs/error_logs/
#$ -o /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/TaS2/bench_nd/bench_mkl_parallel/nd_9
#$ -l h_cpu=60:00:00
#$ -l h_vmem=3G
#$ -pe mpi 16
#$ -N TaS2_bench_nd_9_n_procs_16
#$ -l excl=TRUE
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0-mkl

module load intel/mkl/2021.04
module load openmpi/4.1.0.gcc10.2-infiniband

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/pw.x -nd 9 -i in_files/TaS2_bench_nd_9_n_procs_16.scf