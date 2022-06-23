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


mpirun -np 4 pw.x -nk 1 < TaS2_cdw.scf > out_files_TaS2/4/singlecore/TaS2_bench_singlecore_4.log

mpirun -np 8 pw.x -nk 4 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/2/TaS2_bench_poolsize_2_n_procs_8_4.log

mpirun -np 24 pw.x -nk 12 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/2/TaS2_bench_poolsize_2_n_procs_24_4.log

mpirun -np 40 pw.x -nk 20 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/2/TaS2_bench_poolsize_2_n_procs_40_4.log

mpirun -np 56 pw.x -nk 28 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/2/TaS2_bench_poolsize_2_n_procs_56_4.log

mpirun -np 72 pw.x -nk 36 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/2/TaS2_bench_poolsize_2_n_procs_72_4.log

mpirun -np 88 pw.x -nk 44 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/2/TaS2_bench_poolsize_2_n_procs_88_4.log

mpirun -np 8 pw.x -nk 1 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/8/TaS2_bench_poolsize_8_n_procs_8_4.log

mpirun -np 24 pw.x -nk 3 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/8/TaS2_bench_poolsize_8_n_procs_24_4.log

mpirun -np 40 pw.x -nk 5 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/8/TaS2_bench_poolsize_8_n_procs_40_4.log

mpirun -np 56 pw.x -nk 7 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/8/TaS2_bench_poolsize_8_n_procs_56_4.log

mpirun -np 72 pw.x -nk 9 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/8/TaS2_bench_poolsize_8_n_procs_72_4.log

mpirun -np 88 pw.x -nk 11 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/8/TaS2_bench_poolsize_8_n_procs_88_4.log

mpirun -np 18 pw.x -nk 1 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/18/TaS2_bench_poolsize_18_n_procs_18_4.log

mpirun -np 36 pw.x -nk 2 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/18/TaS2_bench_poolsize_18_n_procs_36_4.log

mpirun -np 54 pw.x -nk 3 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/18/TaS2_bench_poolsize_18_n_procs_54_4.log

mpirun -np 72 pw.x -nk 4 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/18/TaS2_bench_poolsize_18_n_procs_72_4.log

mpirun -np 90 pw.x -nk 5 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/18/TaS2_bench_poolsize_18_n_procs_90_4.log
