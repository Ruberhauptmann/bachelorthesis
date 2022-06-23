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


mpirun -np 24 pw.x -nk 1 -nd 1 < TaS2_cdw.scf > out_files_TaS2/0/24/TaS2_bench_poolsize_24_n_procs_24_0.log

mpirun -np 48 pw.x -nk 2 -nd 1 < TaS2_cdw.scf > out_files_TaS2/0/24/TaS2_bench_poolsize_24_n_procs_48_0.log

mpirun -np 72 pw.x -nk 3 -nd 1 < TaS2_cdw.scf > out_files_TaS2/0/24/TaS2_bench_poolsize_24_n_procs_72_0.log

mpirun -np 96 pw.x -nk 4 -nd 1 < TaS2_cdw.scf > out_files_TaS2/0/24/TaS2_bench_poolsize_24_n_procs_96_0.log

mpirun -np 36 pw.x -nk 1 -nd 1 < TaS2_cdw.scf > out_files_TaS2/0/36/TaS2_bench_poolsize_36_n_procs_36_0.log

mpirun -np 72 pw.x -nk 2 -nd 1 < TaS2_cdw.scf > out_files_TaS2/0/36/TaS2_bench_poolsize_36_n_procs_72_0.log

mpirun -np 48 pw.x -nk 1 -nd 1 < TaS2_cdw.scf > out_files_TaS2/0/48/TaS2_bench_poolsize_48_n_procs_48_0.log

mpirun -np 96 pw.x -nk 2 -nd 1 < TaS2_cdw.scf > out_files_TaS2/0/48/TaS2_bench_poolsize_48_n_procs_96_0.log

mpirun -np 72 pw.x -nk 1 -nd 1 < TaS2_cdw.scf > out_files_TaS2/0/72/TaS2_bench_poolsize_72_n_procs_72_0.log

mpirun -np 24 pw.x -nk 1 -nd 1 < TaS2_cdw.scf > out_files_TaS2/1/24/TaS2_bench_poolsize_24_n_procs_24_1.log

mpirun -np 48 pw.x -nk 2 -nd 1 < TaS2_cdw.scf > out_files_TaS2/1/24/TaS2_bench_poolsize_24_n_procs_48_1.log

mpirun -np 72 pw.x -nk 3 -nd 1 < TaS2_cdw.scf > out_files_TaS2/1/24/TaS2_bench_poolsize_24_n_procs_72_1.log

mpirun -np 96 pw.x -nk 4 -nd 1 < TaS2_cdw.scf > out_files_TaS2/1/24/TaS2_bench_poolsize_24_n_procs_96_1.log

mpirun -np 36 pw.x -nk 1 -nd 1 < TaS2_cdw.scf > out_files_TaS2/1/36/TaS2_bench_poolsize_36_n_procs_36_1.log

mpirun -np 72 pw.x -nk 2 -nd 1 < TaS2_cdw.scf > out_files_TaS2/1/36/TaS2_bench_poolsize_36_n_procs_72_1.log

mpirun -np 48 pw.x -nk 1 -nd 1 < TaS2_cdw.scf > out_files_TaS2/1/48/TaS2_bench_poolsize_48_n_procs_48_1.log

mpirun -np 96 pw.x -nk 2 -nd 1 < TaS2_cdw.scf > out_files_TaS2/1/48/TaS2_bench_poolsize_48_n_procs_96_1.log

mpirun -np 72 pw.x -nk 1 -nd 1 < TaS2_cdw.scf > out_files_TaS2/1/72/TaS2_bench_poolsize_72_n_procs_72_1.log

mpirun -np 24 pw.x -nk 1 -nd 1 < TaS2_cdw.scf > out_files_TaS2/2/24/TaS2_bench_poolsize_24_n_procs_24_2.log

mpirun -np 48 pw.x -nk 2 -nd 1 < TaS2_cdw.scf > out_files_TaS2/2/24/TaS2_bench_poolsize_24_n_procs_48_2.log

mpirun -np 72 pw.x -nk 3 -nd 1 < TaS2_cdw.scf > out_files_TaS2/2/24/TaS2_bench_poolsize_24_n_procs_72_2.log

mpirun -np 96 pw.x -nk 4 -nd 1 < TaS2_cdw.scf > out_files_TaS2/2/24/TaS2_bench_poolsize_24_n_procs_96_2.log

mpirun -np 36 pw.x -nk 1 -nd 1 < TaS2_cdw.scf > out_files_TaS2/2/36/TaS2_bench_poolsize_36_n_procs_36_2.log

mpirun -np 72 pw.x -nk 2 -nd 1 < TaS2_cdw.scf > out_files_TaS2/2/36/TaS2_bench_poolsize_36_n_procs_72_2.log

mpirun -np 48 pw.x -nk 1 -nd 1 < TaS2_cdw.scf > out_files_TaS2/2/48/TaS2_bench_poolsize_48_n_procs_48_2.log

mpirun -np 96 pw.x -nk 2 -nd 1 < TaS2_cdw.scf > out_files_TaS2/2/48/TaS2_bench_poolsize_48_n_procs_96_2.log

mpirun -np 72 pw.x -nk 1 -nd 1 < TaS2_cdw.scf > out_files_TaS2/2/72/TaS2_bench_poolsize_72_n_procs_72_2.log

mpirun -np 24 pw.x -nk 1 -nd 1 < TaS2_cdw.scf > out_files_TaS2/3/24/TaS2_bench_poolsize_24_n_procs_24_3.log

mpirun -np 48 pw.x -nk 2 -nd 1 < TaS2_cdw.scf > out_files_TaS2/3/24/TaS2_bench_poolsize_24_n_procs_48_3.log

mpirun -np 72 pw.x -nk 3 -nd 1 < TaS2_cdw.scf > out_files_TaS2/3/24/TaS2_bench_poolsize_24_n_procs_72_3.log

mpirun -np 96 pw.x -nk 4 -nd 1 < TaS2_cdw.scf > out_files_TaS2/3/24/TaS2_bench_poolsize_24_n_procs_96_3.log

mpirun -np 36 pw.x -nk 1 -nd 1 < TaS2_cdw.scf > out_files_TaS2/3/36/TaS2_bench_poolsize_36_n_procs_36_3.log

mpirun -np 72 pw.x -nk 2 -nd 1 < TaS2_cdw.scf > out_files_TaS2/3/36/TaS2_bench_poolsize_36_n_procs_72_3.log

mpirun -np 48 pw.x -nk 1 -nd 1 < TaS2_cdw.scf > out_files_TaS2/3/48/TaS2_bench_poolsize_48_n_procs_48_3.log

mpirun -np 96 pw.x -nk 2 -nd 1 < TaS2_cdw.scf > out_files_TaS2/3/48/TaS2_bench_poolsize_48_n_procs_96_3.log

mpirun -np 72 pw.x -nk 1 -nd 1 < TaS2_cdw.scf > out_files_TaS2/3/72/TaS2_bench_poolsize_72_n_procs_72_3.log

mpirun -np 24 pw.x -nk 1 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/24/TaS2_bench_poolsize_24_n_procs_24_4.log

mpirun -np 48 pw.x -nk 2 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/24/TaS2_bench_poolsize_24_n_procs_48_4.log

mpirun -np 72 pw.x -nk 3 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/24/TaS2_bench_poolsize_24_n_procs_72_4.log

mpirun -np 96 pw.x -nk 4 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/24/TaS2_bench_poolsize_24_n_procs_96_4.log

mpirun -np 36 pw.x -nk 1 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/36/TaS2_bench_poolsize_36_n_procs_36_4.log

mpirun -np 72 pw.x -nk 2 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/36/TaS2_bench_poolsize_36_n_procs_72_4.log

mpirun -np 48 pw.x -nk 1 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/48/TaS2_bench_poolsize_48_n_procs_48_4.log

mpirun -np 96 pw.x -nk 2 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/48/TaS2_bench_poolsize_48_n_procs_96_4.log

mpirun -np 72 pw.x -nk 1 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/72/TaS2_bench_poolsize_72_n_procs_72_4.log
