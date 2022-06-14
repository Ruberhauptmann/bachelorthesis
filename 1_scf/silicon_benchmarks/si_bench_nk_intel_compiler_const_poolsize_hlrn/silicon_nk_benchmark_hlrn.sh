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


mpirun -np 1 pw.x -nk 1 < silicon.scf > out_file_silicon/singlecore/0/silicon_bench_singlecore_0.log

mpirun -np 4 pw.x -nk 2 -nd 1 < silicon.scf > out_files_silicon/0/2/silicon_bench_poolsize_2_n_procs_4_0.log

mpirun -np 8 pw.x -nk 4 -nd 1 < silicon.scf > out_files_silicon/0/2/silicon_bench_poolsize_2_n_procs_8_0.log

mpirun -np 16 pw.x -nk 8 -nd 1 < silicon.scf > out_files_silicon/0/2/silicon_bench_poolsize_2_n_procs_16_0.log

mpirun -np 24 pw.x -nk 12 -nd 1 < silicon.scf > out_files_silicon/0/2/silicon_bench_poolsize_2_n_procs_24_0.log

mpirun -np 32 pw.x -nk 16 -nd 1 < silicon.scf > out_files_silicon/0/2/silicon_bench_poolsize_2_n_procs_32_0.log

mpirun -np 40 pw.x -nk 20 -nd 1 < silicon.scf > out_files_silicon/0/2/silicon_bench_poolsize_2_n_procs_40_0.log

mpirun -np 48 pw.x -nk 24 -nd 1 < silicon.scf > out_files_silicon/0/2/silicon_bench_poolsize_2_n_procs_48_0.log

mpirun -np 56 pw.x -nk 28 -nd 1 < silicon.scf > out_files_silicon/0/2/silicon_bench_poolsize_2_n_procs_56_0.log

mpirun -np 64 pw.x -nk 32 -nd 1 < silicon.scf > out_files_silicon/0/2/silicon_bench_poolsize_2_n_procs_64_0.log

mpirun -np 72 pw.x -nk 36 -nd 1 < silicon.scf > out_files_silicon/0/2/silicon_bench_poolsize_2_n_procs_72_0.log

mpirun -np 80 pw.x -nk 40 -nd 1 < silicon.scf > out_files_silicon/0/2/silicon_bench_poolsize_2_n_procs_80_0.log

mpirun -np 8 pw.x -nk 1 -nd 1 < silicon.scf > out_files_silicon/0/8/silicon_bench_poolsize_8_n_procs_8_0.log

mpirun -np 16 pw.x -nk 2 -nd 1 < silicon.scf > out_files_silicon/0/8/silicon_bench_poolsize_8_n_procs_16_0.log

mpirun -np 24 pw.x -nk 3 -nd 1 < silicon.scf > out_files_silicon/0/8/silicon_bench_poolsize_8_n_procs_24_0.log

mpirun -np 32 pw.x -nk 4 -nd 1 < silicon.scf > out_files_silicon/0/8/silicon_bench_poolsize_8_n_procs_32_0.log

mpirun -np 40 pw.x -nk 5 -nd 1 < silicon.scf > out_files_silicon/0/8/silicon_bench_poolsize_8_n_procs_40_0.log

mpirun -np 48 pw.x -nk 6 -nd 1 < silicon.scf > out_files_silicon/0/8/silicon_bench_poolsize_8_n_procs_48_0.log

mpirun -np 56 pw.x -nk 7 -nd 1 < silicon.scf > out_files_silicon/0/8/silicon_bench_poolsize_8_n_procs_56_0.log

mpirun -np 64 pw.x -nk 8 -nd 1 < silicon.scf > out_files_silicon/0/8/silicon_bench_poolsize_8_n_procs_64_0.log

mpirun -np 72 pw.x -nk 9 -nd 1 < silicon.scf > out_files_silicon/0/8/silicon_bench_poolsize_8_n_procs_72_0.log

mpirun -np 80 pw.x -nk 10 -nd 1 < silicon.scf > out_files_silicon/0/8/silicon_bench_poolsize_8_n_procs_80_0.log

mpirun -np 16 pw.x -nk 1 -nd 1 < silicon.scf > out_files_silicon/0/16/silicon_bench_poolsize_16_n_procs_16_0.log

mpirun -np 32 pw.x -nk 2 -nd 1 < silicon.scf > out_files_silicon/0/16/silicon_bench_poolsize_16_n_procs_32_0.log

mpirun -np 48 pw.x -nk 3 -nd 1 < silicon.scf > out_files_silicon/0/16/silicon_bench_poolsize_16_n_procs_48_0.log

mpirun -np 64 pw.x -nk 4 -nd 1 < silicon.scf > out_files_silicon/0/16/silicon_bench_poolsize_16_n_procs_64_0.log

mpirun -np 80 pw.x -nk 5 -nd 1 < silicon.scf > out_files_silicon/0/16/silicon_bench_poolsize_16_n_procs_80_0.log

mpirun -np 1 pw.x -nk 1 < silicon.scf > out_file_silicon/singlecore/1/silicon_bench_singlecore_1.log

mpirun -np 4 pw.x -nk 2 -nd 1 < silicon.scf > out_files_silicon/1/2/silicon_bench_poolsize_2_n_procs_4_1.log

mpirun -np 8 pw.x -nk 4 -nd 1 < silicon.scf > out_files_silicon/1/2/silicon_bench_poolsize_2_n_procs_8_1.log

mpirun -np 16 pw.x -nk 8 -nd 1 < silicon.scf > out_files_silicon/1/2/silicon_bench_poolsize_2_n_procs_16_1.log

mpirun -np 24 pw.x -nk 12 -nd 1 < silicon.scf > out_files_silicon/1/2/silicon_bench_poolsize_2_n_procs_24_1.log

mpirun -np 32 pw.x -nk 16 -nd 1 < silicon.scf > out_files_silicon/1/2/silicon_bench_poolsize_2_n_procs_32_1.log

mpirun -np 40 pw.x -nk 20 -nd 1 < silicon.scf > out_files_silicon/1/2/silicon_bench_poolsize_2_n_procs_40_1.log

mpirun -np 48 pw.x -nk 24 -nd 1 < silicon.scf > out_files_silicon/1/2/silicon_bench_poolsize_2_n_procs_48_1.log

mpirun -np 56 pw.x -nk 28 -nd 1 < silicon.scf > out_files_silicon/1/2/silicon_bench_poolsize_2_n_procs_56_1.log

mpirun -np 64 pw.x -nk 32 -nd 1 < silicon.scf > out_files_silicon/1/2/silicon_bench_poolsize_2_n_procs_64_1.log

mpirun -np 72 pw.x -nk 36 -nd 1 < silicon.scf > out_files_silicon/1/2/silicon_bench_poolsize_2_n_procs_72_1.log

mpirun -np 80 pw.x -nk 40 -nd 1 < silicon.scf > out_files_silicon/1/2/silicon_bench_poolsize_2_n_procs_80_1.log

mpirun -np 8 pw.x -nk 1 -nd 1 < silicon.scf > out_files_silicon/1/8/silicon_bench_poolsize_8_n_procs_8_1.log

mpirun -np 16 pw.x -nk 2 -nd 1 < silicon.scf > out_files_silicon/1/8/silicon_bench_poolsize_8_n_procs_16_1.log

mpirun -np 24 pw.x -nk 3 -nd 1 < silicon.scf > out_files_silicon/1/8/silicon_bench_poolsize_8_n_procs_24_1.log

mpirun -np 32 pw.x -nk 4 -nd 1 < silicon.scf > out_files_silicon/1/8/silicon_bench_poolsize_8_n_procs_32_1.log

mpirun -np 40 pw.x -nk 5 -nd 1 < silicon.scf > out_files_silicon/1/8/silicon_bench_poolsize_8_n_procs_40_1.log

mpirun -np 48 pw.x -nk 6 -nd 1 < silicon.scf > out_files_silicon/1/8/silicon_bench_poolsize_8_n_procs_48_1.log

mpirun -np 56 pw.x -nk 7 -nd 1 < silicon.scf > out_files_silicon/1/8/silicon_bench_poolsize_8_n_procs_56_1.log

mpirun -np 64 pw.x -nk 8 -nd 1 < silicon.scf > out_files_silicon/1/8/silicon_bench_poolsize_8_n_procs_64_1.log

mpirun -np 72 pw.x -nk 9 -nd 1 < silicon.scf > out_files_silicon/1/8/silicon_bench_poolsize_8_n_procs_72_1.log

mpirun -np 80 pw.x -nk 10 -nd 1 < silicon.scf > out_files_silicon/1/8/silicon_bench_poolsize_8_n_procs_80_1.log

mpirun -np 16 pw.x -nk 1 -nd 1 < silicon.scf > out_files_silicon/1/16/silicon_bench_poolsize_16_n_procs_16_1.log

mpirun -np 32 pw.x -nk 2 -nd 1 < silicon.scf > out_files_silicon/1/16/silicon_bench_poolsize_16_n_procs_32_1.log

mpirun -np 48 pw.x -nk 3 -nd 1 < silicon.scf > out_files_silicon/1/16/silicon_bench_poolsize_16_n_procs_48_1.log

mpirun -np 64 pw.x -nk 4 -nd 1 < silicon.scf > out_files_silicon/1/16/silicon_bench_poolsize_16_n_procs_64_1.log

mpirun -np 80 pw.x -nk 5 -nd 1 < silicon.scf > out_files_silicon/1/16/silicon_bench_poolsize_16_n_procs_80_1.log

mpirun -np 1 pw.x -nk 1 < silicon.scf > out_file_silicon/singlecore/2/silicon_bench_singlecore_2.log

mpirun -np 4 pw.x -nk 2 -nd 1 < silicon.scf > out_files_silicon/2/2/silicon_bench_poolsize_2_n_procs_4_2.log

mpirun -np 8 pw.x -nk 4 -nd 1 < silicon.scf > out_files_silicon/2/2/silicon_bench_poolsize_2_n_procs_8_2.log

mpirun -np 16 pw.x -nk 8 -nd 1 < silicon.scf > out_files_silicon/2/2/silicon_bench_poolsize_2_n_procs_16_2.log

mpirun -np 24 pw.x -nk 12 -nd 1 < silicon.scf > out_files_silicon/2/2/silicon_bench_poolsize_2_n_procs_24_2.log

mpirun -np 32 pw.x -nk 16 -nd 1 < silicon.scf > out_files_silicon/2/2/silicon_bench_poolsize_2_n_procs_32_2.log

mpirun -np 40 pw.x -nk 20 -nd 1 < silicon.scf > out_files_silicon/2/2/silicon_bench_poolsize_2_n_procs_40_2.log

mpirun -np 48 pw.x -nk 24 -nd 1 < silicon.scf > out_files_silicon/2/2/silicon_bench_poolsize_2_n_procs_48_2.log

mpirun -np 56 pw.x -nk 28 -nd 1 < silicon.scf > out_files_silicon/2/2/silicon_bench_poolsize_2_n_procs_56_2.log

mpirun -np 64 pw.x -nk 32 -nd 1 < silicon.scf > out_files_silicon/2/2/silicon_bench_poolsize_2_n_procs_64_2.log

mpirun -np 72 pw.x -nk 36 -nd 1 < silicon.scf > out_files_silicon/2/2/silicon_bench_poolsize_2_n_procs_72_2.log

mpirun -np 80 pw.x -nk 40 -nd 1 < silicon.scf > out_files_silicon/2/2/silicon_bench_poolsize_2_n_procs_80_2.log

mpirun -np 8 pw.x -nk 1 -nd 1 < silicon.scf > out_files_silicon/2/8/silicon_bench_poolsize_8_n_procs_8_2.log

mpirun -np 16 pw.x -nk 2 -nd 1 < silicon.scf > out_files_silicon/2/8/silicon_bench_poolsize_8_n_procs_16_2.log

mpirun -np 24 pw.x -nk 3 -nd 1 < silicon.scf > out_files_silicon/2/8/silicon_bench_poolsize_8_n_procs_24_2.log

mpirun -np 32 pw.x -nk 4 -nd 1 < silicon.scf > out_files_silicon/2/8/silicon_bench_poolsize_8_n_procs_32_2.log

mpirun -np 40 pw.x -nk 5 -nd 1 < silicon.scf > out_files_silicon/2/8/silicon_bench_poolsize_8_n_procs_40_2.log

mpirun -np 48 pw.x -nk 6 -nd 1 < silicon.scf > out_files_silicon/2/8/silicon_bench_poolsize_8_n_procs_48_2.log

mpirun -np 56 pw.x -nk 7 -nd 1 < silicon.scf > out_files_silicon/2/8/silicon_bench_poolsize_8_n_procs_56_2.log

mpirun -np 64 pw.x -nk 8 -nd 1 < silicon.scf > out_files_silicon/2/8/silicon_bench_poolsize_8_n_procs_64_2.log

mpirun -np 72 pw.x -nk 9 -nd 1 < silicon.scf > out_files_silicon/2/8/silicon_bench_poolsize_8_n_procs_72_2.log

mpirun -np 80 pw.x -nk 10 -nd 1 < silicon.scf > out_files_silicon/2/8/silicon_bench_poolsize_8_n_procs_80_2.log

mpirun -np 16 pw.x -nk 1 -nd 1 < silicon.scf > out_files_silicon/2/16/silicon_bench_poolsize_16_n_procs_16_2.log

mpirun -np 32 pw.x -nk 2 -nd 1 < silicon.scf > out_files_silicon/2/16/silicon_bench_poolsize_16_n_procs_32_2.log

mpirun -np 48 pw.x -nk 3 -nd 1 < silicon.scf > out_files_silicon/2/16/silicon_bench_poolsize_16_n_procs_48_2.log

mpirun -np 64 pw.x -nk 4 -nd 1 < silicon.scf > out_files_silicon/2/16/silicon_bench_poolsize_16_n_procs_64_2.log

mpirun -np 80 pw.x -nk 5 -nd 1 < silicon.scf > out_files_silicon/2/16/silicon_bench_poolsize_16_n_procs_80_2.log

mpirun -np 1 pw.x -nk 1 < silicon.scf > out_file_silicon/singlecore/3/silicon_bench_singlecore_3.log

mpirun -np 4 pw.x -nk 2 -nd 1 < silicon.scf > out_files_silicon/3/2/silicon_bench_poolsize_2_n_procs_4_3.log

mpirun -np 8 pw.x -nk 4 -nd 1 < silicon.scf > out_files_silicon/3/2/silicon_bench_poolsize_2_n_procs_8_3.log

mpirun -np 16 pw.x -nk 8 -nd 1 < silicon.scf > out_files_silicon/3/2/silicon_bench_poolsize_2_n_procs_16_3.log

mpirun -np 24 pw.x -nk 12 -nd 1 < silicon.scf > out_files_silicon/3/2/silicon_bench_poolsize_2_n_procs_24_3.log

mpirun -np 32 pw.x -nk 16 -nd 1 < silicon.scf > out_files_silicon/3/2/silicon_bench_poolsize_2_n_procs_32_3.log

mpirun -np 40 pw.x -nk 20 -nd 1 < silicon.scf > out_files_silicon/3/2/silicon_bench_poolsize_2_n_procs_40_3.log

mpirun -np 48 pw.x -nk 24 -nd 1 < silicon.scf > out_files_silicon/3/2/silicon_bench_poolsize_2_n_procs_48_3.log

mpirun -np 56 pw.x -nk 28 -nd 1 < silicon.scf > out_files_silicon/3/2/silicon_bench_poolsize_2_n_procs_56_3.log

mpirun -np 64 pw.x -nk 32 -nd 1 < silicon.scf > out_files_silicon/3/2/silicon_bench_poolsize_2_n_procs_64_3.log

mpirun -np 72 pw.x -nk 36 -nd 1 < silicon.scf > out_files_silicon/3/2/silicon_bench_poolsize_2_n_procs_72_3.log

mpirun -np 80 pw.x -nk 40 -nd 1 < silicon.scf > out_files_silicon/3/2/silicon_bench_poolsize_2_n_procs_80_3.log

mpirun -np 8 pw.x -nk 1 -nd 1 < silicon.scf > out_files_silicon/3/8/silicon_bench_poolsize_8_n_procs_8_3.log

mpirun -np 16 pw.x -nk 2 -nd 1 < silicon.scf > out_files_silicon/3/8/silicon_bench_poolsize_8_n_procs_16_3.log

mpirun -np 24 pw.x -nk 3 -nd 1 < silicon.scf > out_files_silicon/3/8/silicon_bench_poolsize_8_n_procs_24_3.log

mpirun -np 32 pw.x -nk 4 -nd 1 < silicon.scf > out_files_silicon/3/8/silicon_bench_poolsize_8_n_procs_32_3.log

mpirun -np 40 pw.x -nk 5 -nd 1 < silicon.scf > out_files_silicon/3/8/silicon_bench_poolsize_8_n_procs_40_3.log

mpirun -np 48 pw.x -nk 6 -nd 1 < silicon.scf > out_files_silicon/3/8/silicon_bench_poolsize_8_n_procs_48_3.log

mpirun -np 56 pw.x -nk 7 -nd 1 < silicon.scf > out_files_silicon/3/8/silicon_bench_poolsize_8_n_procs_56_3.log

mpirun -np 64 pw.x -nk 8 -nd 1 < silicon.scf > out_files_silicon/3/8/silicon_bench_poolsize_8_n_procs_64_3.log

mpirun -np 72 pw.x -nk 9 -nd 1 < silicon.scf > out_files_silicon/3/8/silicon_bench_poolsize_8_n_procs_72_3.log

mpirun -np 80 pw.x -nk 10 -nd 1 < silicon.scf > out_files_silicon/3/8/silicon_bench_poolsize_8_n_procs_80_3.log

mpirun -np 16 pw.x -nk 1 -nd 1 < silicon.scf > out_files_silicon/3/16/silicon_bench_poolsize_16_n_procs_16_3.log

mpirun -np 32 pw.x -nk 2 -nd 1 < silicon.scf > out_files_silicon/3/16/silicon_bench_poolsize_16_n_procs_32_3.log

mpirun -np 48 pw.x -nk 3 -nd 1 < silicon.scf > out_files_silicon/3/16/silicon_bench_poolsize_16_n_procs_48_3.log

mpirun -np 64 pw.x -nk 4 -nd 1 < silicon.scf > out_files_silicon/3/16/silicon_bench_poolsize_16_n_procs_64_3.log

mpirun -np 80 pw.x -nk 5 -nd 1 < silicon.scf > out_files_silicon/3/16/silicon_bench_poolsize_16_n_procs_80_3.log

mpirun -np 1 pw.x -nk 1 < silicon.scf > out_file_silicon/singlecore/4/silicon_bench_singlecore_4.log

mpirun -np 4 pw.x -nk 2 -nd 1 < silicon.scf > out_files_silicon/4/2/silicon_bench_poolsize_2_n_procs_4_4.log

mpirun -np 8 pw.x -nk 4 -nd 1 < silicon.scf > out_files_silicon/4/2/silicon_bench_poolsize_2_n_procs_8_4.log

mpirun -np 16 pw.x -nk 8 -nd 1 < silicon.scf > out_files_silicon/4/2/silicon_bench_poolsize_2_n_procs_16_4.log

mpirun -np 24 pw.x -nk 12 -nd 1 < silicon.scf > out_files_silicon/4/2/silicon_bench_poolsize_2_n_procs_24_4.log

mpirun -np 32 pw.x -nk 16 -nd 1 < silicon.scf > out_files_silicon/4/2/silicon_bench_poolsize_2_n_procs_32_4.log

mpirun -np 40 pw.x -nk 20 -nd 1 < silicon.scf > out_files_silicon/4/2/silicon_bench_poolsize_2_n_procs_40_4.log

mpirun -np 48 pw.x -nk 24 -nd 1 < silicon.scf > out_files_silicon/4/2/silicon_bench_poolsize_2_n_procs_48_4.log

mpirun -np 56 pw.x -nk 28 -nd 1 < silicon.scf > out_files_silicon/4/2/silicon_bench_poolsize_2_n_procs_56_4.log

mpirun -np 64 pw.x -nk 32 -nd 1 < silicon.scf > out_files_silicon/4/2/silicon_bench_poolsize_2_n_procs_64_4.log

mpirun -np 72 pw.x -nk 36 -nd 1 < silicon.scf > out_files_silicon/4/2/silicon_bench_poolsize_2_n_procs_72_4.log

mpirun -np 80 pw.x -nk 40 -nd 1 < silicon.scf > out_files_silicon/4/2/silicon_bench_poolsize_2_n_procs_80_4.log

mpirun -np 8 pw.x -nk 1 -nd 1 < silicon.scf > out_files_silicon/4/8/silicon_bench_poolsize_8_n_procs_8_4.log

mpirun -np 16 pw.x -nk 2 -nd 1 < silicon.scf > out_files_silicon/4/8/silicon_bench_poolsize_8_n_procs_16_4.log

mpirun -np 24 pw.x -nk 3 -nd 1 < silicon.scf > out_files_silicon/4/8/silicon_bench_poolsize_8_n_procs_24_4.log

mpirun -np 32 pw.x -nk 4 -nd 1 < silicon.scf > out_files_silicon/4/8/silicon_bench_poolsize_8_n_procs_32_4.log

mpirun -np 40 pw.x -nk 5 -nd 1 < silicon.scf > out_files_silicon/4/8/silicon_bench_poolsize_8_n_procs_40_4.log

mpirun -np 48 pw.x -nk 6 -nd 1 < silicon.scf > out_files_silicon/4/8/silicon_bench_poolsize_8_n_procs_48_4.log

mpirun -np 56 pw.x -nk 7 -nd 1 < silicon.scf > out_files_silicon/4/8/silicon_bench_poolsize_8_n_procs_56_4.log

mpirun -np 64 pw.x -nk 8 -nd 1 < silicon.scf > out_files_silicon/4/8/silicon_bench_poolsize_8_n_procs_64_4.log

mpirun -np 72 pw.x -nk 9 -nd 1 < silicon.scf > out_files_silicon/4/8/silicon_bench_poolsize_8_n_procs_72_4.log

mpirun -np 80 pw.x -nk 10 -nd 1 < silicon.scf > out_files_silicon/4/8/silicon_bench_poolsize_8_n_procs_80_4.log

mpirun -np 16 pw.x -nk 1 -nd 1 < silicon.scf > out_files_silicon/4/16/silicon_bench_poolsize_16_n_procs_16_4.log

mpirun -np 32 pw.x -nk 2 -nd 1 < silicon.scf > out_files_silicon/4/16/silicon_bench_poolsize_16_n_procs_32_4.log

mpirun -np 48 pw.x -nk 3 -nd 1 < silicon.scf > out_files_silicon/4/16/silicon_bench_poolsize_16_n_procs_48_4.log

mpirun -np 64 pw.x -nk 4 -nd 1 < silicon.scf > out_files_silicon/4/16/silicon_bench_poolsize_16_n_procs_64_4.log

mpirun -np 80 pw.x -nk 5 -nd 1 < silicon.scf > out_files_silicon/4/16/silicon_bench_poolsize_16_n_procs_80_4.log

mpirun -np 1 pw.x -nk 1 < silicon.scf > out_file_silicon/singlecore/5/silicon_bench_singlecore_5.log

mpirun -np 4 pw.x -nk 2 -nd 1 < silicon.scf > out_files_silicon/5/2/silicon_bench_poolsize_2_n_procs_4_5.log

mpirun -np 8 pw.x -nk 4 -nd 1 < silicon.scf > out_files_silicon/5/2/silicon_bench_poolsize_2_n_procs_8_5.log

mpirun -np 16 pw.x -nk 8 -nd 1 < silicon.scf > out_files_silicon/5/2/silicon_bench_poolsize_2_n_procs_16_5.log

mpirun -np 24 pw.x -nk 12 -nd 1 < silicon.scf > out_files_silicon/5/2/silicon_bench_poolsize_2_n_procs_24_5.log

mpirun -np 32 pw.x -nk 16 -nd 1 < silicon.scf > out_files_silicon/5/2/silicon_bench_poolsize_2_n_procs_32_5.log

mpirun -np 40 pw.x -nk 20 -nd 1 < silicon.scf > out_files_silicon/5/2/silicon_bench_poolsize_2_n_procs_40_5.log

mpirun -np 48 pw.x -nk 24 -nd 1 < silicon.scf > out_files_silicon/5/2/silicon_bench_poolsize_2_n_procs_48_5.log

mpirun -np 56 pw.x -nk 28 -nd 1 < silicon.scf > out_files_silicon/5/2/silicon_bench_poolsize_2_n_procs_56_5.log

mpirun -np 64 pw.x -nk 32 -nd 1 < silicon.scf > out_files_silicon/5/2/silicon_bench_poolsize_2_n_procs_64_5.log

mpirun -np 72 pw.x -nk 36 -nd 1 < silicon.scf > out_files_silicon/5/2/silicon_bench_poolsize_2_n_procs_72_5.log

mpirun -np 80 pw.x -nk 40 -nd 1 < silicon.scf > out_files_silicon/5/2/silicon_bench_poolsize_2_n_procs_80_5.log

mpirun -np 8 pw.x -nk 1 -nd 1 < silicon.scf > out_files_silicon/5/8/silicon_bench_poolsize_8_n_procs_8_5.log

mpirun -np 16 pw.x -nk 2 -nd 1 < silicon.scf > out_files_silicon/5/8/silicon_bench_poolsize_8_n_procs_16_5.log

mpirun -np 24 pw.x -nk 3 -nd 1 < silicon.scf > out_files_silicon/5/8/silicon_bench_poolsize_8_n_procs_24_5.log

mpirun -np 32 pw.x -nk 4 -nd 1 < silicon.scf > out_files_silicon/5/8/silicon_bench_poolsize_8_n_procs_32_5.log

mpirun -np 40 pw.x -nk 5 -nd 1 < silicon.scf > out_files_silicon/5/8/silicon_bench_poolsize_8_n_procs_40_5.log

mpirun -np 48 pw.x -nk 6 -nd 1 < silicon.scf > out_files_silicon/5/8/silicon_bench_poolsize_8_n_procs_48_5.log

mpirun -np 56 pw.x -nk 7 -nd 1 < silicon.scf > out_files_silicon/5/8/silicon_bench_poolsize_8_n_procs_56_5.log

mpirun -np 64 pw.x -nk 8 -nd 1 < silicon.scf > out_files_silicon/5/8/silicon_bench_poolsize_8_n_procs_64_5.log

mpirun -np 72 pw.x -nk 9 -nd 1 < silicon.scf > out_files_silicon/5/8/silicon_bench_poolsize_8_n_procs_72_5.log

mpirun -np 80 pw.x -nk 10 -nd 1 < silicon.scf > out_files_silicon/5/8/silicon_bench_poolsize_8_n_procs_80_5.log

mpirun -np 16 pw.x -nk 1 -nd 1 < silicon.scf > out_files_silicon/5/16/silicon_bench_poolsize_16_n_procs_16_5.log

mpirun -np 32 pw.x -nk 2 -nd 1 < silicon.scf > out_files_silicon/5/16/silicon_bench_poolsize_16_n_procs_32_5.log

mpirun -np 48 pw.x -nk 3 -nd 1 < silicon.scf > out_files_silicon/5/16/silicon_bench_poolsize_16_n_procs_48_5.log

mpirun -np 64 pw.x -nk 4 -nd 1 < silicon.scf > out_files_silicon/5/16/silicon_bench_poolsize_16_n_procs_64_5.log

mpirun -np 80 pw.x -nk 5 -nd 1 < silicon.scf > out_files_silicon/5/16/silicon_bench_poolsize_16_n_procs_80_5.log

mpirun -np 1 pw.x -nk 1 < silicon.scf > out_file_silicon/singlecore/6/silicon_bench_singlecore_6.log

mpirun -np 4 pw.x -nk 2 -nd 1 < silicon.scf > out_files_silicon/6/2/silicon_bench_poolsize_2_n_procs_4_6.log

mpirun -np 8 pw.x -nk 4 -nd 1 < silicon.scf > out_files_silicon/6/2/silicon_bench_poolsize_2_n_procs_8_6.log

mpirun -np 16 pw.x -nk 8 -nd 1 < silicon.scf > out_files_silicon/6/2/silicon_bench_poolsize_2_n_procs_16_6.log

mpirun -np 24 pw.x -nk 12 -nd 1 < silicon.scf > out_files_silicon/6/2/silicon_bench_poolsize_2_n_procs_24_6.log

mpirun -np 32 pw.x -nk 16 -nd 1 < silicon.scf > out_files_silicon/6/2/silicon_bench_poolsize_2_n_procs_32_6.log

mpirun -np 40 pw.x -nk 20 -nd 1 < silicon.scf > out_files_silicon/6/2/silicon_bench_poolsize_2_n_procs_40_6.log

mpirun -np 48 pw.x -nk 24 -nd 1 < silicon.scf > out_files_silicon/6/2/silicon_bench_poolsize_2_n_procs_48_6.log

mpirun -np 56 pw.x -nk 28 -nd 1 < silicon.scf > out_files_silicon/6/2/silicon_bench_poolsize_2_n_procs_56_6.log

mpirun -np 64 pw.x -nk 32 -nd 1 < silicon.scf > out_files_silicon/6/2/silicon_bench_poolsize_2_n_procs_64_6.log

mpirun -np 72 pw.x -nk 36 -nd 1 < silicon.scf > out_files_silicon/6/2/silicon_bench_poolsize_2_n_procs_72_6.log

mpirun -np 80 pw.x -nk 40 -nd 1 < silicon.scf > out_files_silicon/6/2/silicon_bench_poolsize_2_n_procs_80_6.log

mpirun -np 8 pw.x -nk 1 -nd 1 < silicon.scf > out_files_silicon/6/8/silicon_bench_poolsize_8_n_procs_8_6.log

mpirun -np 16 pw.x -nk 2 -nd 1 < silicon.scf > out_files_silicon/6/8/silicon_bench_poolsize_8_n_procs_16_6.log

mpirun -np 24 pw.x -nk 3 -nd 1 < silicon.scf > out_files_silicon/6/8/silicon_bench_poolsize_8_n_procs_24_6.log

mpirun -np 32 pw.x -nk 4 -nd 1 < silicon.scf > out_files_silicon/6/8/silicon_bench_poolsize_8_n_procs_32_6.log

mpirun -np 40 pw.x -nk 5 -nd 1 < silicon.scf > out_files_silicon/6/8/silicon_bench_poolsize_8_n_procs_40_6.log

mpirun -np 48 pw.x -nk 6 -nd 1 < silicon.scf > out_files_silicon/6/8/silicon_bench_poolsize_8_n_procs_48_6.log

mpirun -np 56 pw.x -nk 7 -nd 1 < silicon.scf > out_files_silicon/6/8/silicon_bench_poolsize_8_n_procs_56_6.log

mpirun -np 64 pw.x -nk 8 -nd 1 < silicon.scf > out_files_silicon/6/8/silicon_bench_poolsize_8_n_procs_64_6.log

mpirun -np 72 pw.x -nk 9 -nd 1 < silicon.scf > out_files_silicon/6/8/silicon_bench_poolsize_8_n_procs_72_6.log

mpirun -np 80 pw.x -nk 10 -nd 1 < silicon.scf > out_files_silicon/6/8/silicon_bench_poolsize_8_n_procs_80_6.log

mpirun -np 16 pw.x -nk 1 -nd 1 < silicon.scf > out_files_silicon/6/16/silicon_bench_poolsize_16_n_procs_16_6.log

mpirun -np 32 pw.x -nk 2 -nd 1 < silicon.scf > out_files_silicon/6/16/silicon_bench_poolsize_16_n_procs_32_6.log

mpirun -np 48 pw.x -nk 3 -nd 1 < silicon.scf > out_files_silicon/6/16/silicon_bench_poolsize_16_n_procs_48_6.log

mpirun -np 64 pw.x -nk 4 -nd 1 < silicon.scf > out_files_silicon/6/16/silicon_bench_poolsize_16_n_procs_64_6.log

mpirun -np 80 pw.x -nk 5 -nd 1 < silicon.scf > out_files_silicon/6/16/silicon_bench_poolsize_16_n_procs_80_6.log

mpirun -np 1 pw.x -nk 1 < silicon.scf > out_file_silicon/singlecore/7/silicon_bench_singlecore_7.log

mpirun -np 4 pw.x -nk 2 -nd 1 < silicon.scf > out_files_silicon/7/2/silicon_bench_poolsize_2_n_procs_4_7.log

mpirun -np 8 pw.x -nk 4 -nd 1 < silicon.scf > out_files_silicon/7/2/silicon_bench_poolsize_2_n_procs_8_7.log

mpirun -np 16 pw.x -nk 8 -nd 1 < silicon.scf > out_files_silicon/7/2/silicon_bench_poolsize_2_n_procs_16_7.log

mpirun -np 24 pw.x -nk 12 -nd 1 < silicon.scf > out_files_silicon/7/2/silicon_bench_poolsize_2_n_procs_24_7.log

mpirun -np 32 pw.x -nk 16 -nd 1 < silicon.scf > out_files_silicon/7/2/silicon_bench_poolsize_2_n_procs_32_7.log

mpirun -np 40 pw.x -nk 20 -nd 1 < silicon.scf > out_files_silicon/7/2/silicon_bench_poolsize_2_n_procs_40_7.log

mpirun -np 48 pw.x -nk 24 -nd 1 < silicon.scf > out_files_silicon/7/2/silicon_bench_poolsize_2_n_procs_48_7.log

mpirun -np 56 pw.x -nk 28 -nd 1 < silicon.scf > out_files_silicon/7/2/silicon_bench_poolsize_2_n_procs_56_7.log

mpirun -np 64 pw.x -nk 32 -nd 1 < silicon.scf > out_files_silicon/7/2/silicon_bench_poolsize_2_n_procs_64_7.log

mpirun -np 72 pw.x -nk 36 -nd 1 < silicon.scf > out_files_silicon/7/2/silicon_bench_poolsize_2_n_procs_72_7.log

mpirun -np 80 pw.x -nk 40 -nd 1 < silicon.scf > out_files_silicon/7/2/silicon_bench_poolsize_2_n_procs_80_7.log

mpirun -np 8 pw.x -nk 1 -nd 1 < silicon.scf > out_files_silicon/7/8/silicon_bench_poolsize_8_n_procs_8_7.log

mpirun -np 16 pw.x -nk 2 -nd 1 < silicon.scf > out_files_silicon/7/8/silicon_bench_poolsize_8_n_procs_16_7.log

mpirun -np 24 pw.x -nk 3 -nd 1 < silicon.scf > out_files_silicon/7/8/silicon_bench_poolsize_8_n_procs_24_7.log

mpirun -np 32 pw.x -nk 4 -nd 1 < silicon.scf > out_files_silicon/7/8/silicon_bench_poolsize_8_n_procs_32_7.log

mpirun -np 40 pw.x -nk 5 -nd 1 < silicon.scf > out_files_silicon/7/8/silicon_bench_poolsize_8_n_procs_40_7.log

mpirun -np 48 pw.x -nk 6 -nd 1 < silicon.scf > out_files_silicon/7/8/silicon_bench_poolsize_8_n_procs_48_7.log

mpirun -np 56 pw.x -nk 7 -nd 1 < silicon.scf > out_files_silicon/7/8/silicon_bench_poolsize_8_n_procs_56_7.log

mpirun -np 64 pw.x -nk 8 -nd 1 < silicon.scf > out_files_silicon/7/8/silicon_bench_poolsize_8_n_procs_64_7.log

mpirun -np 72 pw.x -nk 9 -nd 1 < silicon.scf > out_files_silicon/7/8/silicon_bench_poolsize_8_n_procs_72_7.log

mpirun -np 80 pw.x -nk 10 -nd 1 < silicon.scf > out_files_silicon/7/8/silicon_bench_poolsize_8_n_procs_80_7.log

mpirun -np 16 pw.x -nk 1 -nd 1 < silicon.scf > out_files_silicon/7/16/silicon_bench_poolsize_16_n_procs_16_7.log

mpirun -np 32 pw.x -nk 2 -nd 1 < silicon.scf > out_files_silicon/7/16/silicon_bench_poolsize_16_n_procs_32_7.log

mpirun -np 48 pw.x -nk 3 -nd 1 < silicon.scf > out_files_silicon/7/16/silicon_bench_poolsize_16_n_procs_48_7.log

mpirun -np 64 pw.x -nk 4 -nd 1 < silicon.scf > out_files_silicon/7/16/silicon_bench_poolsize_16_n_procs_64_7.log

mpirun -np 80 pw.x -nk 5 -nd 1 < silicon.scf > out_files_silicon/7/16/silicon_bench_poolsize_16_n_procs_80_7.log

mpirun -np 1 pw.x -nk 1 < silicon.scf > out_file_silicon/singlecore/8/silicon_bench_singlecore_8.log

mpirun -np 4 pw.x -nk 2 -nd 1 < silicon.scf > out_files_silicon/8/2/silicon_bench_poolsize_2_n_procs_4_8.log

mpirun -np 8 pw.x -nk 4 -nd 1 < silicon.scf > out_files_silicon/8/2/silicon_bench_poolsize_2_n_procs_8_8.log

mpirun -np 16 pw.x -nk 8 -nd 1 < silicon.scf > out_files_silicon/8/2/silicon_bench_poolsize_2_n_procs_16_8.log

mpirun -np 24 pw.x -nk 12 -nd 1 < silicon.scf > out_files_silicon/8/2/silicon_bench_poolsize_2_n_procs_24_8.log

mpirun -np 32 pw.x -nk 16 -nd 1 < silicon.scf > out_files_silicon/8/2/silicon_bench_poolsize_2_n_procs_32_8.log

mpirun -np 40 pw.x -nk 20 -nd 1 < silicon.scf > out_files_silicon/8/2/silicon_bench_poolsize_2_n_procs_40_8.log

mpirun -np 48 pw.x -nk 24 -nd 1 < silicon.scf > out_files_silicon/8/2/silicon_bench_poolsize_2_n_procs_48_8.log

mpirun -np 56 pw.x -nk 28 -nd 1 < silicon.scf > out_files_silicon/8/2/silicon_bench_poolsize_2_n_procs_56_8.log

mpirun -np 64 pw.x -nk 32 -nd 1 < silicon.scf > out_files_silicon/8/2/silicon_bench_poolsize_2_n_procs_64_8.log

mpirun -np 72 pw.x -nk 36 -nd 1 < silicon.scf > out_files_silicon/8/2/silicon_bench_poolsize_2_n_procs_72_8.log

mpirun -np 80 pw.x -nk 40 -nd 1 < silicon.scf > out_files_silicon/8/2/silicon_bench_poolsize_2_n_procs_80_8.log

mpirun -np 8 pw.x -nk 1 -nd 1 < silicon.scf > out_files_silicon/8/8/silicon_bench_poolsize_8_n_procs_8_8.log

mpirun -np 16 pw.x -nk 2 -nd 1 < silicon.scf > out_files_silicon/8/8/silicon_bench_poolsize_8_n_procs_16_8.log

mpirun -np 24 pw.x -nk 3 -nd 1 < silicon.scf > out_files_silicon/8/8/silicon_bench_poolsize_8_n_procs_24_8.log

mpirun -np 32 pw.x -nk 4 -nd 1 < silicon.scf > out_files_silicon/8/8/silicon_bench_poolsize_8_n_procs_32_8.log

mpirun -np 40 pw.x -nk 5 -nd 1 < silicon.scf > out_files_silicon/8/8/silicon_bench_poolsize_8_n_procs_40_8.log

mpirun -np 48 pw.x -nk 6 -nd 1 < silicon.scf > out_files_silicon/8/8/silicon_bench_poolsize_8_n_procs_48_8.log

mpirun -np 56 pw.x -nk 7 -nd 1 < silicon.scf > out_files_silicon/8/8/silicon_bench_poolsize_8_n_procs_56_8.log

mpirun -np 64 pw.x -nk 8 -nd 1 < silicon.scf > out_files_silicon/8/8/silicon_bench_poolsize_8_n_procs_64_8.log

mpirun -np 72 pw.x -nk 9 -nd 1 < silicon.scf > out_files_silicon/8/8/silicon_bench_poolsize_8_n_procs_72_8.log

mpirun -np 80 pw.x -nk 10 -nd 1 < silicon.scf > out_files_silicon/8/8/silicon_bench_poolsize_8_n_procs_80_8.log

mpirun -np 16 pw.x -nk 1 -nd 1 < silicon.scf > out_files_silicon/8/16/silicon_bench_poolsize_16_n_procs_16_8.log

mpirun -np 32 pw.x -nk 2 -nd 1 < silicon.scf > out_files_silicon/8/16/silicon_bench_poolsize_16_n_procs_32_8.log

mpirun -np 48 pw.x -nk 3 -nd 1 < silicon.scf > out_files_silicon/8/16/silicon_bench_poolsize_16_n_procs_48_8.log

mpirun -np 64 pw.x -nk 4 -nd 1 < silicon.scf > out_files_silicon/8/16/silicon_bench_poolsize_16_n_procs_64_8.log

mpirun -np 80 pw.x -nk 5 -nd 1 < silicon.scf > out_files_silicon/8/16/silicon_bench_poolsize_16_n_procs_80_8.log

mpirun -np 1 pw.x -nk 1 < silicon.scf > out_file_silicon/singlecore/9/silicon_bench_singlecore_9.log

mpirun -np 4 pw.x -nk 2 -nd 1 < silicon.scf > out_files_silicon/9/2/silicon_bench_poolsize_2_n_procs_4_9.log

mpirun -np 8 pw.x -nk 4 -nd 1 < silicon.scf > out_files_silicon/9/2/silicon_bench_poolsize_2_n_procs_8_9.log

mpirun -np 16 pw.x -nk 8 -nd 1 < silicon.scf > out_files_silicon/9/2/silicon_bench_poolsize_2_n_procs_16_9.log

mpirun -np 24 pw.x -nk 12 -nd 1 < silicon.scf > out_files_silicon/9/2/silicon_bench_poolsize_2_n_procs_24_9.log

mpirun -np 32 pw.x -nk 16 -nd 1 < silicon.scf > out_files_silicon/9/2/silicon_bench_poolsize_2_n_procs_32_9.log

mpirun -np 40 pw.x -nk 20 -nd 1 < silicon.scf > out_files_silicon/9/2/silicon_bench_poolsize_2_n_procs_40_9.log

mpirun -np 48 pw.x -nk 24 -nd 1 < silicon.scf > out_files_silicon/9/2/silicon_bench_poolsize_2_n_procs_48_9.log

mpirun -np 56 pw.x -nk 28 -nd 1 < silicon.scf > out_files_silicon/9/2/silicon_bench_poolsize_2_n_procs_56_9.log

mpirun -np 64 pw.x -nk 32 -nd 1 < silicon.scf > out_files_silicon/9/2/silicon_bench_poolsize_2_n_procs_64_9.log

mpirun -np 72 pw.x -nk 36 -nd 1 < silicon.scf > out_files_silicon/9/2/silicon_bench_poolsize_2_n_procs_72_9.log

mpirun -np 80 pw.x -nk 40 -nd 1 < silicon.scf > out_files_silicon/9/2/silicon_bench_poolsize_2_n_procs_80_9.log

mpirun -np 8 pw.x -nk 1 -nd 1 < silicon.scf > out_files_silicon/9/8/silicon_bench_poolsize_8_n_procs_8_9.log

mpirun -np 16 pw.x -nk 2 -nd 1 < silicon.scf > out_files_silicon/9/8/silicon_bench_poolsize_8_n_procs_16_9.log

mpirun -np 24 pw.x -nk 3 -nd 1 < silicon.scf > out_files_silicon/9/8/silicon_bench_poolsize_8_n_procs_24_9.log

mpirun -np 32 pw.x -nk 4 -nd 1 < silicon.scf > out_files_silicon/9/8/silicon_bench_poolsize_8_n_procs_32_9.log

mpirun -np 40 pw.x -nk 5 -nd 1 < silicon.scf > out_files_silicon/9/8/silicon_bench_poolsize_8_n_procs_40_9.log

mpirun -np 48 pw.x -nk 6 -nd 1 < silicon.scf > out_files_silicon/9/8/silicon_bench_poolsize_8_n_procs_48_9.log

mpirun -np 56 pw.x -nk 7 -nd 1 < silicon.scf > out_files_silicon/9/8/silicon_bench_poolsize_8_n_procs_56_9.log

mpirun -np 64 pw.x -nk 8 -nd 1 < silicon.scf > out_files_silicon/9/8/silicon_bench_poolsize_8_n_procs_64_9.log

mpirun -np 72 pw.x -nk 9 -nd 1 < silicon.scf > out_files_silicon/9/8/silicon_bench_poolsize_8_n_procs_72_9.log

mpirun -np 80 pw.x -nk 10 -nd 1 < silicon.scf > out_files_silicon/9/8/silicon_bench_poolsize_8_n_procs_80_9.log

mpirun -np 16 pw.x -nk 1 -nd 1 < silicon.scf > out_files_silicon/9/16/silicon_bench_poolsize_16_n_procs_16_9.log

mpirun -np 32 pw.x -nk 2 -nd 1 < silicon.scf > out_files_silicon/9/16/silicon_bench_poolsize_16_n_procs_32_9.log

mpirun -np 48 pw.x -nk 3 -nd 1 < silicon.scf > out_files_silicon/9/16/silicon_bench_poolsize_16_n_procs_48_9.log

mpirun -np 64 pw.x -nk 4 -nd 1 < silicon.scf > out_files_silicon/9/16/silicon_bench_poolsize_16_n_procs_64_9.log

mpirun -np 80 pw.x -nk 5 -nd 1 < silicon.scf > out_files_silicon/9/16/silicon_bench_poolsize_16_n_procs_80_9.log
