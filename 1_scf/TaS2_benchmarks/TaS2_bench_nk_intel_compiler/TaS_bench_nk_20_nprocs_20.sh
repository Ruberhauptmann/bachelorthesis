#!/bin/bash
#$ -q th1prio.q
#$ -e $HOME/job_logs/error_logs/
#$ -o {{ log_path }}
#$ -l h_cpu=01:00:00
#$ -l h_vmem=3G
#$ -l excl=TRUE
#$ -pe mpi {{ n_procs }}
#$ -N {{ job_name }}
#$ -cwd
#$ -S /bin/bash
#$ -M tsievers@physnet.uni-hamburg.de -m as

QEPREFIX=/fastscratch/tsievers/qe-7.0-intel-compiler

ulimit -l unlimited
ulimit -a

module load intel/oneAPI-2021.4

/usr/bin/time --format=%e -p mpirun $QEPREFIX/bin/pw.x -nk {{ nk }} -i {{ in_files_path }}/{{ job_name }}.scf
