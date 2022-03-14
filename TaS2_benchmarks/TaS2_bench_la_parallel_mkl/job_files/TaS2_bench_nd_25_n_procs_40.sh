#!/bin/bash
#$ -q lernfix.q
#$ -e $HOME/job_logs/error_logs/
#$ -o /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/TaS2/bench_nd/bench_mkl_parallel/nd_25
#$ -l h_cpu=60:00:00
#$ -l h_vmem=3G
#$ -pe mpi 40
#$ -N TaS2_bench_nd_25_n_procs_40
#$ -l excl=TRUE
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0-mkl

module load intel/mkl/2021.04
module load openmpi/4.1.0.gcc10.2-infiniband

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/pw.x -nd 25 -i in_files/TaS2_bench_nd_25_n_procs_40.scf