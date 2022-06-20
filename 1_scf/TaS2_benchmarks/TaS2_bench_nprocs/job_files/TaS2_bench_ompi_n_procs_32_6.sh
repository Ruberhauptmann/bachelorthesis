#!/bin/bash
#$ -q th1prio.q
#$ -o /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/TaS2/bench_nprocs/6
#$ -pe mpi 32
#$ -N TaS2_bench_ompi_n_procs_32_6
#$ -l h_cpu=10:00:00
#$ -l h_vmem=3G
#$ -l excl=TRUE
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0

module load openmpi/4.1.0.gcc10.2-infiniband

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/pw.x -i in_files/TaS2_bench_ompi_n_procs_32_6.scf