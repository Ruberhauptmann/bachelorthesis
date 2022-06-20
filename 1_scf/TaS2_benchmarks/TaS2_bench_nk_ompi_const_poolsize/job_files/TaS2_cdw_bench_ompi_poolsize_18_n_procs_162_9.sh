#!/bin/bash
#$ -q th1prio.q
#$ -e $HOME/job_logs/error_logs/
#$ -o /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/TaS2/bench_nk_ompi_const_poolsize/9/18
#$ -l h_cpu=03:00:00
#$ -l h_vmem=3G
#$ -pe mpi 162
#$ -N TaS2_cdw_bench_ompi_poolsize_18_n_procs_162_9
#$ -l excl=TRUE
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0

module load openmpi/4.1.0.gcc10.2-infiniband

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/pw.x -nd 1 -nk 9 -i in_files/TaS2_cdw_bench_ompi_poolsize_18_n_procs_162_9.scf