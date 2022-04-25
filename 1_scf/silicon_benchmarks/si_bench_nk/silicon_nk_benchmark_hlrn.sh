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

nk=2
n_scf=2
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=2
n_scf=4
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=2
n_scf=6
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=2
n_scf=8
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=2
n_scf=10
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=2
n_scf=12
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=2
n_scf=14
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=2
n_scf=16
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=2
n_scf=18
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=2
n_scf=20
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=2
n_scf=22
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=2
n_scf=24
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=2
n_scf=26
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=2
n_scf=28
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=2
n_scf=30
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=2
n_scf=32
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=2
n_scf=34
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=2
n_scf=36
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=2
n_scf=38
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=2
n_scf=40
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=4
n_scf=4
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=4
n_scf=8
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=4
n_scf=12
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=4
n_scf=16
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=4
n_scf=20
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=4
n_scf=24
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=4
n_scf=28
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=4
n_scf=32
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=4
n_scf=36
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=4
n_scf=40
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=5
n_scf=5
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=5
n_scf=10
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=5
n_scf=15
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=5
n_scf=20
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=5
n_scf=25
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=5
n_scf=30
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=5
n_scf=35
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=5
n_scf=40
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=8
n_scf=8
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=8
n_scf=16
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=8
n_scf=24
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=8
n_scf=32
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=8
n_scf=40
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=10
n_scf=10
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=10
n_scf=20
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=10
n_scf=30
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=10
n_scf=40
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=16
n_scf=16
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=16
n_scf=32
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=20
n_scf=20
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=20
n_scf=40
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=25
n_scf=25
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=32
n_scf=32
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
nk=40
n_scf=40
mpirun -n $n_scf pw.x -nk $nk < silicon.scf > silicon_bench_nk_"$nk"_n_procs_"$n_scf".out
