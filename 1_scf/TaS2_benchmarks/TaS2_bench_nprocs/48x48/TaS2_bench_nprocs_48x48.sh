#!/bin/bash
#$ -q lernfix.q
#$ -e $HOME/job_logs/error_logs/
#$ -o $HOME/job_logs/TaS2/bench_nprocs/48x48/
#$ -l h_cpu=01:00:00
#$ -l h_vmem=2G
#$ -l excl=TRUE
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0

module load openmpi/4.1.0.gcc10.2-infiniband

mpirun $QEPREFIX/bin/pw.x -i in_files/TaS2_bench_$1.scf

