#!/bin/bash
#$ -q lernfix.q
#$ -e $HOME/job_logs/error_logs/
#$ -o $HOME/job_logs/silicon/bench_nprocs_infiniband/
#$ -l h_cpu=01:00:00
#$ -l excl=TRUE
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0

module load openmpi/4.1.0.gcc10.2-infiniband

mpirun --mca btl self,vader,openib $QEPREFIX/bin/pw.x -i in_files/si_bench_$1.scf
