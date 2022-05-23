#!/bin/bash
#$ -q th1prio.q
#$ -o /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/TaS2/bench_nprocs/2
#$ -pe mpi 6
#$ -N TaS2_bench_ompi_n_procs_6_2
#$ -l h_cpu=25:00:00
#$ -l h_vmem=8G
#$ -l excl=TRUE
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0

module load openmpi/4.1.0.gcc10.2-infiniband

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/pw.x -i in_files/TaS2_bench_ompi_n_procs_6_2.scf