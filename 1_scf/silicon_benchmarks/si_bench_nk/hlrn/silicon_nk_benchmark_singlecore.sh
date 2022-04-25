#!/bin/bash
#SBATCH --nodes 1
#SBATCH --tasks-per-node 96
#SBATCH --partition standard96
#SBATCH --time 12:00:00

module load intel
module load impi

export PATH=$HOME/qe-7.0/bin:$PATH
export SLURM_CPU_BIND=none

cd $SLURM_SUBMIT_DIR

n_scf=1
nk=1
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out