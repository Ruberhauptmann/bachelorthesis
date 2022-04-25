#!/bin/bash
#$ -q lernfix.q
#$ -e $HOME/job_logs/error_logs/
#$ -o $HOME/job_logs/TaS2/bench_nprocs/
#$ -l h_cpu=60:00:00
#$ -l h_vmem=3G
#$ -pe mpi 20
#$ -N TaS2_bench_nk_1
#$ -l excl=TRUE
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0

module load openmpi/4.1.0.gcc10.2-infiniband

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/pw.x -nk 1 -i in_files/TaS2_bench_nk_2_n_procs_2.scf
