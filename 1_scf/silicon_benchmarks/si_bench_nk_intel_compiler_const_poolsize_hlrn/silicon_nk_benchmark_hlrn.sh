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


mpirun -np 1 pw.x -nk 1 < silicon.scf > out_files/0/singlecore/silicon_bench_singlecore_0.out

mpirun -np 8 pw.x -nk 4 -nd 1 < silicon.scf > out_files/0/2/silicon_bench_nk_4_n_procs_8_0.out

mpirun -np 16 pw.x -nk 8 -nd 1 < silicon.scf > out_files/0/2/silicon_bench_nk_8_n_procs_16_0.out

mpirun -np 24 pw.x -nk 12 -nd 1 < silicon.scf > out_files/0/2/silicon_bench_nk_12_n_procs_24_0.out

mpirun -np 32 pw.x -nk 16 -nd 1 < silicon.scf > out_files/0/2/silicon_bench_nk_16_n_procs_32_0.out

mpirun -np 40 pw.x -nk 20 -nd 1 < silicon.scf > out_files/0/2/silicon_bench_nk_20_n_procs_40_0.out

mpirun -np 48 pw.x -nk 24 -nd 1 < silicon.scf > out_files/0/2/silicon_bench_nk_24_n_procs_48_0.out

mpirun -np 56 pw.x -nk 28 -nd 1 < silicon.scf > out_files/0/2/silicon_bench_nk_28_n_procs_56_0.out

mpirun -np 64 pw.x -nk 32 -nd 1 < silicon.scf > out_files/0/2/silicon_bench_nk_32_n_procs_64_0.out

mpirun -np 72 pw.x -nk 36 -nd 1 < silicon.scf > out_files/0/2/silicon_bench_nk_36_n_procs_72_0.out

mpirun -np 80 pw.x -nk 40 -nd 1 < silicon.scf > out_files/0/2/silicon_bench_nk_40_n_procs_80_0.out

mpirun -np 8 pw.x -nk 1 -nd 1 < silicon.scf > out_files/0/8/silicon_bench_nk_1_n_procs_8_0.out

mpirun -np 16 pw.x -nk 2 -nd 1 < silicon.scf > out_files/0/8/silicon_bench_nk_2_n_procs_16_0.out

mpirun -np 24 pw.x -nk 3 -nd 1 < silicon.scf > out_files/0/8/silicon_bench_nk_3_n_procs_24_0.out

mpirun -np 32 pw.x -nk 4 -nd 1 < silicon.scf > out_files/0/8/silicon_bench_nk_4_n_procs_32_0.out

mpirun -np 40 pw.x -nk 5 -nd 1 < silicon.scf > out_files/0/8/silicon_bench_nk_5_n_procs_40_0.out

mpirun -np 48 pw.x -nk 6 -nd 1 < silicon.scf > out_files/0/8/silicon_bench_nk_6_n_procs_48_0.out

mpirun -np 56 pw.x -nk 7 -nd 1 < silicon.scf > out_files/0/8/silicon_bench_nk_7_n_procs_56_0.out

mpirun -np 64 pw.x -nk 8 -nd 1 < silicon.scf > out_files/0/8/silicon_bench_nk_8_n_procs_64_0.out

mpirun -np 72 pw.x -nk 9 -nd 1 < silicon.scf > out_files/0/8/silicon_bench_nk_9_n_procs_72_0.out

mpirun -np 80 pw.x -nk 10 -nd 1 < silicon.scf > out_files/0/8/silicon_bench_nk_10_n_procs_80_0.out

mpirun -np 16 pw.x -nk 1 -nd 1 < silicon.scf > out_files/0/16/silicon_bench_nk_1_n_procs_16_0.out

mpirun -np 32 pw.x -nk 2 -nd 1 < silicon.scf > out_files/0/16/silicon_bench_nk_2_n_procs_32_0.out

mpirun -np 48 pw.x -nk 3 -nd 1 < silicon.scf > out_files/0/16/silicon_bench_nk_3_n_procs_48_0.out

mpirun -np 64 pw.x -nk 4 -nd 1 < silicon.scf > out_files/0/16/silicon_bench_nk_4_n_procs_64_0.out

mpirun -np 80 pw.x -nk 5 -nd 1 < silicon.scf > out_files/0/16/silicon_bench_nk_5_n_procs_80_0.out
