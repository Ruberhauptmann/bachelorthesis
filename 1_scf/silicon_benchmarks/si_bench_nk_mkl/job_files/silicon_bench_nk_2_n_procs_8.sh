#!/bin/bash
#$ -q lernfix.q
#$ -e $HOME/job_logs/error_logs/
#$ -o /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/silicon/bench_nk_mkl/nk_2
#$ -l h_cpu=01:00:00
#$ -pe mpi 8
#$ -N silicon_bench_nk_2_n_procs_8
#$ -l excl=TRUE
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0-mkl

module load intel/mkl/2021.04
module load openmpi/4.1.0.gcc10.2-infiniband

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/pw.x -nk 2 -i in_files/silicon_bench_nk_2_n_procs_8.scf