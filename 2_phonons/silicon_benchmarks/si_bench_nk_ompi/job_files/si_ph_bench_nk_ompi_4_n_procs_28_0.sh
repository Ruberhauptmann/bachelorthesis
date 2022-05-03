#!/bin/bash
#$ -q th1prio.q
#$ -e $HOME/job_logs/error_logs/
#$ -o /afs/physnet.uni-hamburg.de/users/th1_we/tsievers/job_logs/silicon/phonons/bench_nk_ompi/nk_4/28
#$ -l h_cpu=07:00:00
#$ -l excl=TRUE
#$ -pe mpi 28
#$ -N si_ph_bench_nk_ompi_4_n_procs_28_0
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0-scalapack

module load scalapack/2.2.0

mpirun $QEPREFIX/bin/pw.x -nk 4 -nd 9 -i in_files/si_ph_bench_nk_ompi_4_n_procs_28_0.scf

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/ph.x -nk 4 -nd 9 -i in_files/si_ph_bench_nk_ompi_4_n_procs_28_0.ph