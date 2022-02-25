#!/bin/bash
#$ -q lernfix.q
#$ -e $HOME/job_logs/error_logs/
#$ -o /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/TaS2/bench_nk/cdw/nk_16
#$ -l h_cpu=60:00:00
#$ -pe mpi 16
#$ -N TaS2_cdw_bench_nk_16_n_procs_16
#$ -l excl=TRUE
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0

module load openmpi/4.1.0.gcc10.2-infiniband

mpirun $QEPREFIX/bin/pw.x -nk 16 -i in_files/TaS2_cdw_bench_nk_16_n_procs_16.scf