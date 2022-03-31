#!/bin/bash
#$ -q lernfix.q
#$ -e $HOME/job_logs/error_logs/
#$ -o /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/silicon/bench_nk_parallel_mkl/nd_1/nk_8
#$ -l h_cpu=01:00:00
#$ -pe mpi 40
#$ -N silicon_bench_nk_8_n_procs_40
#$ -l excl=TRUE
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0-mkl

module load intel/mkl/2021.04
module load openmpi/4.1.0.gcc10.2-infiniband

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/pw.x -nd 1 -nk 8 -i in_files/silicon_bench_nk_8_n_procs_40.scf