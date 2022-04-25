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

n_scf=80
nk=4
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
n_scf=5
nk=5
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
n_scf=10
nk=5
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
n_scf=15
nk=5
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
n_scf=20
nk=5
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
n_scf=25
nk=5
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
n_scf=50
nk=5
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
n_scf=40
nk=8
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
n_scf=80
nk=8
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
n_scf=50
nk=10
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
n_scf=32
nk=16
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
n_scf=64
nk=16
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
n_scf=20
nk=20
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
n_scf=40
nk=20
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
n_scf=25
nk=25
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
n_scf=32
nk=32
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out