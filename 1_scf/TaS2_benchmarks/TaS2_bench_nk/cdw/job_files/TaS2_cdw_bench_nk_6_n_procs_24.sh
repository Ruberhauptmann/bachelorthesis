#!/bin/bash
#$ -q lernfix.q
#$ -e $HOME/job_logs/error_logs/
#$ -o /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/TaS2/bench_nk/cdw/nk_6
#$ -l h_cpu=60:00:00
#$ -l h_vmem=3G
#$ -pe mpi 24
#$ -N TaS2_cdw_bench_nk_6_n_procs_24
#$ -l excl=TRUE
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0

module load openmpi/4.1.0.gcc10.2-infiniband

mpirun $QEPREFIX/bin/pw.x -nk 6 -i in_files/TaS2_cdw_bench_nk_6_n_procs_24.scf