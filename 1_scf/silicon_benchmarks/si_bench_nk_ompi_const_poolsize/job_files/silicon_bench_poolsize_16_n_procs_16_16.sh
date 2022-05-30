#!/bin/bash
#$ -q th1prio.q
#$ -e $HOME/job_logs/error_logs/
#$ -o /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/silicon/bench_nk_ompi_const_poolsize/16/16
#$ -l h_cpu=01:00:00
#$ -l h_vmem=1G
#$ -l excl=TRUE
#$ -pe mpi 16
#$ -N silicon_bench_poolsize_16_n_procs_16_16
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0

module load openmpi/4.1.0.gcc10.2-infiniband

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/pw.x -nk 1 -i in_files/silicon_bench_poolsize_16_n_procs_16_16.scf