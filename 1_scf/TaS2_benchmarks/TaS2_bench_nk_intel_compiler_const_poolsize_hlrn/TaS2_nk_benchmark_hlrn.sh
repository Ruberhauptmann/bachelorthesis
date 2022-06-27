#!/bin/bash
#SBATCH --nodes 2
#SBATCH --tasks-per-node 96
#SBATCH --partition standard96
#SBATCH --time 12:00:00

module load intel
module load impi

export PATH=$HOME/qe-7.0/bin:$PATH
export SLURM_CPU_BIND=none

cd $SLURM_SUBMIT_DIR


mpirun -np 104 pw.x -nk 52 -nd 1 < TaS2_cdw.scf > out_files_TaS2/0/2/TaS2_bench_poolsize_2_n_procs_104_0.log

mpirun -np 120 pw.x -nk 60 -nd 1 < TaS2_cdw.scf > out_files_TaS2/0/2/TaS2_bench_poolsize_2_n_procs_120_0.log

mpirun -np 136 pw.x -nk 68 -nd 1 < TaS2_cdw.scf > out_files_TaS2/0/2/TaS2_bench_poolsize_2_n_procs_136_0.log

mpirun -np 152 pw.x -nk 76 -nd 1 < TaS2_cdw.scf > out_files_TaS2/0/2/TaS2_bench_poolsize_2_n_procs_152_0.log

mpirun -np 168 pw.x -nk 84 -nd 1 < TaS2_cdw.scf > out_files_TaS2/0/2/TaS2_bench_poolsize_2_n_procs_168_0.log

mpirun -np 184 pw.x -nk 92 -nd 1 < TaS2_cdw.scf > out_files_TaS2/0/2/TaS2_bench_poolsize_2_n_procs_184_0.log

mpirun -np 104 pw.x -nk 13 -nd 1 < TaS2_cdw.scf > out_files_TaS2/0/8/TaS2_bench_poolsize_8_n_procs_104_0.log

mpirun -np 120 pw.x -nk 15 -nd 1 < TaS2_cdw.scf > out_files_TaS2/0/8/TaS2_bench_poolsize_8_n_procs_120_0.log

mpirun -np 136 pw.x -nk 17 -nd 1 < TaS2_cdw.scf > out_files_TaS2/0/8/TaS2_bench_poolsize_8_n_procs_136_0.log

mpirun -np 152 pw.x -nk 19 -nd 1 < TaS2_cdw.scf > out_files_TaS2/0/8/TaS2_bench_poolsize_8_n_procs_152_0.log

mpirun -np 168 pw.x -nk 21 -nd 1 < TaS2_cdw.scf > out_files_TaS2/0/8/TaS2_bench_poolsize_8_n_procs_168_0.log

mpirun -np 184 pw.x -nk 23 -nd 1 < TaS2_cdw.scf > out_files_TaS2/0/8/TaS2_bench_poolsize_8_n_procs_184_0.log

mpirun -np 96 pw.x -nk 4 -nd 1 < TaS2_cdw.scf > out_files_TaS2/0/24/TaS2_bench_poolsize_24_n_procs_96_0.log

mpirun -np 120 pw.x -nk 5 -nd 1 < TaS2_cdw.scf > out_files_TaS2/0/24/TaS2_bench_poolsize_24_n_procs_120_0.log

mpirun -np 144 pw.x -nk 6 -nd 1 < TaS2_cdw.scf > out_files_TaS2/0/24/TaS2_bench_poolsize_24_n_procs_144_0.log

mpirun -np 168 pw.x -nk 7 -nd 1 < TaS2_cdw.scf > out_files_TaS2/0/24/TaS2_bench_poolsize_24_n_procs_168_0.log

mpirun -np 192 pw.x -nk 8 -nd 1 < TaS2_cdw.scf > out_files_TaS2/0/24/TaS2_bench_poolsize_24_n_procs_192_0.log

mpirun -np 108 pw.x -nk 3 -nd 1 < TaS2_cdw.scf > out_files_TaS2/0/36/TaS2_bench_poolsize_36_n_procs_108_0.log

mpirun -np 144 pw.x -nk 4 -nd 1 < TaS2_cdw.scf > out_files_TaS2/0/36/TaS2_bench_poolsize_36_n_procs_144_0.log

mpirun -np 180 pw.x -nk 5 -nd 1 < TaS2_cdw.scf > out_files_TaS2/0/36/TaS2_bench_poolsize_36_n_procs_180_0.log

mpirun -np 96 pw.x -nk 2 -nd 1 < TaS2_cdw.scf > out_files_TaS2/0/48/TaS2_bench_poolsize_48_n_procs_96_0.log

mpirun -np 144 pw.x -nk 3 -nd 1 < TaS2_cdw.scf > out_files_TaS2/0/48/TaS2_bench_poolsize_48_n_procs_144_0.log

mpirun -np 192 pw.x -nk 4 -nd 1 < TaS2_cdw.scf > out_files_TaS2/0/48/TaS2_bench_poolsize_48_n_procs_192_0.log

mpirun -np 144 pw.x -nk 2 -nd 1 < TaS2_cdw.scf > out_files_TaS2/0/72/TaS2_bench_poolsize_72_n_procs_144_0.log

mpirun -np 108 pw.x -nk 6 -nd 1 < TaS2_cdw.scf > out_files_TaS2/0/18/TaS2_bench_poolsize_18_n_procs_108_0.log

mpirun -np 126 pw.x -nk 7 -nd 1 < TaS2_cdw.scf > out_files_TaS2/0/18/TaS2_bench_poolsize_18_n_procs_126_0.log

mpirun -np 144 pw.x -nk 8 -nd 1 < TaS2_cdw.scf > out_files_TaS2/0/18/TaS2_bench_poolsize_18_n_procs_144_0.log

mpirun -np 162 pw.x -nk 9 -nd 1 < TaS2_cdw.scf > out_files_TaS2/0/18/TaS2_bench_poolsize_18_n_procs_162_0.log

mpirun -np 180 pw.x -nk 10 -nd 1 < TaS2_cdw.scf > out_files_TaS2/0/18/TaS2_bench_poolsize_18_n_procs_180_0.log

mpirun -np 104 pw.x -nk 52 -nd 1 < TaS2_cdw.scf > out_files_TaS2/1/2/TaS2_bench_poolsize_2_n_procs_104_1.log

mpirun -np 120 pw.x -nk 60 -nd 1 < TaS2_cdw.scf > out_files_TaS2/1/2/TaS2_bench_poolsize_2_n_procs_120_1.log

mpirun -np 136 pw.x -nk 68 -nd 1 < TaS2_cdw.scf > out_files_TaS2/1/2/TaS2_bench_poolsize_2_n_procs_136_1.log

mpirun -np 152 pw.x -nk 76 -nd 1 < TaS2_cdw.scf > out_files_TaS2/1/2/TaS2_bench_poolsize_2_n_procs_152_1.log

mpirun -np 168 pw.x -nk 84 -nd 1 < TaS2_cdw.scf > out_files_TaS2/1/2/TaS2_bench_poolsize_2_n_procs_168_1.log

mpirun -np 184 pw.x -nk 92 -nd 1 < TaS2_cdw.scf > out_files_TaS2/1/2/TaS2_bench_poolsize_2_n_procs_184_1.log

mpirun -np 104 pw.x -nk 13 -nd 1 < TaS2_cdw.scf > out_files_TaS2/1/8/TaS2_bench_poolsize_8_n_procs_104_1.log

mpirun -np 120 pw.x -nk 15 -nd 1 < TaS2_cdw.scf > out_files_TaS2/1/8/TaS2_bench_poolsize_8_n_procs_120_1.log

mpirun -np 136 pw.x -nk 17 -nd 1 < TaS2_cdw.scf > out_files_TaS2/1/8/TaS2_bench_poolsize_8_n_procs_136_1.log

mpirun -np 152 pw.x -nk 19 -nd 1 < TaS2_cdw.scf > out_files_TaS2/1/8/TaS2_bench_poolsize_8_n_procs_152_1.log

mpirun -np 168 pw.x -nk 21 -nd 1 < TaS2_cdw.scf > out_files_TaS2/1/8/TaS2_bench_poolsize_8_n_procs_168_1.log

mpirun -np 184 pw.x -nk 23 -nd 1 < TaS2_cdw.scf > out_files_TaS2/1/8/TaS2_bench_poolsize_8_n_procs_184_1.log

mpirun -np 96 pw.x -nk 4 -nd 1 < TaS2_cdw.scf > out_files_TaS2/1/24/TaS2_bench_poolsize_24_n_procs_96_1.log

mpirun -np 120 pw.x -nk 5 -nd 1 < TaS2_cdw.scf > out_files_TaS2/1/24/TaS2_bench_poolsize_24_n_procs_120_1.log

mpirun -np 144 pw.x -nk 6 -nd 1 < TaS2_cdw.scf > out_files_TaS2/1/24/TaS2_bench_poolsize_24_n_procs_144_1.log

mpirun -np 168 pw.x -nk 7 -nd 1 < TaS2_cdw.scf > out_files_TaS2/1/24/TaS2_bench_poolsize_24_n_procs_168_1.log

mpirun -np 192 pw.x -nk 8 -nd 1 < TaS2_cdw.scf > out_files_TaS2/1/24/TaS2_bench_poolsize_24_n_procs_192_1.log

mpirun -np 108 pw.x -nk 3 -nd 1 < TaS2_cdw.scf > out_files_TaS2/1/36/TaS2_bench_poolsize_36_n_procs_108_1.log

mpirun -np 144 pw.x -nk 4 -nd 1 < TaS2_cdw.scf > out_files_TaS2/1/36/TaS2_bench_poolsize_36_n_procs_144_1.log

mpirun -np 180 pw.x -nk 5 -nd 1 < TaS2_cdw.scf > out_files_TaS2/1/36/TaS2_bench_poolsize_36_n_procs_180_1.log

mpirun -np 96 pw.x -nk 2 -nd 1 < TaS2_cdw.scf > out_files_TaS2/1/48/TaS2_bench_poolsize_48_n_procs_96_1.log

mpirun -np 144 pw.x -nk 3 -nd 1 < TaS2_cdw.scf > out_files_TaS2/1/48/TaS2_bench_poolsize_48_n_procs_144_1.log

mpirun -np 192 pw.x -nk 4 -nd 1 < TaS2_cdw.scf > out_files_TaS2/1/48/TaS2_bench_poolsize_48_n_procs_192_1.log

mpirun -np 144 pw.x -nk 2 -nd 1 < TaS2_cdw.scf > out_files_TaS2/1/72/TaS2_bench_poolsize_72_n_procs_144_1.log

mpirun -np 108 pw.x -nk 6 -nd 1 < TaS2_cdw.scf > out_files_TaS2/1/18/TaS2_bench_poolsize_18_n_procs_108_1.log

mpirun -np 126 pw.x -nk 7 -nd 1 < TaS2_cdw.scf > out_files_TaS2/1/18/TaS2_bench_poolsize_18_n_procs_126_1.log

mpirun -np 144 pw.x -nk 8 -nd 1 < TaS2_cdw.scf > out_files_TaS2/1/18/TaS2_bench_poolsize_18_n_procs_144_1.log

mpirun -np 162 pw.x -nk 9 -nd 1 < TaS2_cdw.scf > out_files_TaS2/1/18/TaS2_bench_poolsize_18_n_procs_162_1.log

mpirun -np 180 pw.x -nk 10 -nd 1 < TaS2_cdw.scf > out_files_TaS2/1/18/TaS2_bench_poolsize_18_n_procs_180_1.log

mpirun -np 104 pw.x -nk 52 -nd 1 < TaS2_cdw.scf > out_files_TaS2/2/2/TaS2_bench_poolsize_2_n_procs_104_2.log

mpirun -np 120 pw.x -nk 60 -nd 1 < TaS2_cdw.scf > out_files_TaS2/2/2/TaS2_bench_poolsize_2_n_procs_120_2.log

mpirun -np 136 pw.x -nk 68 -nd 1 < TaS2_cdw.scf > out_files_TaS2/2/2/TaS2_bench_poolsize_2_n_procs_136_2.log

mpirun -np 152 pw.x -nk 76 -nd 1 < TaS2_cdw.scf > out_files_TaS2/2/2/TaS2_bench_poolsize_2_n_procs_152_2.log

mpirun -np 168 pw.x -nk 84 -nd 1 < TaS2_cdw.scf > out_files_TaS2/2/2/TaS2_bench_poolsize_2_n_procs_168_2.log

mpirun -np 184 pw.x -nk 92 -nd 1 < TaS2_cdw.scf > out_files_TaS2/2/2/TaS2_bench_poolsize_2_n_procs_184_2.log

mpirun -np 104 pw.x -nk 13 -nd 1 < TaS2_cdw.scf > out_files_TaS2/2/8/TaS2_bench_poolsize_8_n_procs_104_2.log

mpirun -np 120 pw.x -nk 15 -nd 1 < TaS2_cdw.scf > out_files_TaS2/2/8/TaS2_bench_poolsize_8_n_procs_120_2.log

mpirun -np 136 pw.x -nk 17 -nd 1 < TaS2_cdw.scf > out_files_TaS2/2/8/TaS2_bench_poolsize_8_n_procs_136_2.log

mpirun -np 152 pw.x -nk 19 -nd 1 < TaS2_cdw.scf > out_files_TaS2/2/8/TaS2_bench_poolsize_8_n_procs_152_2.log

mpirun -np 168 pw.x -nk 21 -nd 1 < TaS2_cdw.scf > out_files_TaS2/2/8/TaS2_bench_poolsize_8_n_procs_168_2.log

mpirun -np 184 pw.x -nk 23 -nd 1 < TaS2_cdw.scf > out_files_TaS2/2/8/TaS2_bench_poolsize_8_n_procs_184_2.log

mpirun -np 96 pw.x -nk 4 -nd 1 < TaS2_cdw.scf > out_files_TaS2/2/24/TaS2_bench_poolsize_24_n_procs_96_2.log

mpirun -np 120 pw.x -nk 5 -nd 1 < TaS2_cdw.scf > out_files_TaS2/2/24/TaS2_bench_poolsize_24_n_procs_120_2.log

mpirun -np 144 pw.x -nk 6 -nd 1 < TaS2_cdw.scf > out_files_TaS2/2/24/TaS2_bench_poolsize_24_n_procs_144_2.log

mpirun -np 168 pw.x -nk 7 -nd 1 < TaS2_cdw.scf > out_files_TaS2/2/24/TaS2_bench_poolsize_24_n_procs_168_2.log

mpirun -np 192 pw.x -nk 8 -nd 1 < TaS2_cdw.scf > out_files_TaS2/2/24/TaS2_bench_poolsize_24_n_procs_192_2.log

mpirun -np 108 pw.x -nk 3 -nd 1 < TaS2_cdw.scf > out_files_TaS2/2/36/TaS2_bench_poolsize_36_n_procs_108_2.log

mpirun -np 144 pw.x -nk 4 -nd 1 < TaS2_cdw.scf > out_files_TaS2/2/36/TaS2_bench_poolsize_36_n_procs_144_2.log

mpirun -np 180 pw.x -nk 5 -nd 1 < TaS2_cdw.scf > out_files_TaS2/2/36/TaS2_bench_poolsize_36_n_procs_180_2.log

mpirun -np 96 pw.x -nk 2 -nd 1 < TaS2_cdw.scf > out_files_TaS2/2/48/TaS2_bench_poolsize_48_n_procs_96_2.log

mpirun -np 144 pw.x -nk 3 -nd 1 < TaS2_cdw.scf > out_files_TaS2/2/48/TaS2_bench_poolsize_48_n_procs_144_2.log

mpirun -np 192 pw.x -nk 4 -nd 1 < TaS2_cdw.scf > out_files_TaS2/2/48/TaS2_bench_poolsize_48_n_procs_192_2.log

mpirun -np 144 pw.x -nk 2 -nd 1 < TaS2_cdw.scf > out_files_TaS2/2/72/TaS2_bench_poolsize_72_n_procs_144_2.log

mpirun -np 108 pw.x -nk 6 -nd 1 < TaS2_cdw.scf > out_files_TaS2/2/18/TaS2_bench_poolsize_18_n_procs_108_2.log

mpirun -np 126 pw.x -nk 7 -nd 1 < TaS2_cdw.scf > out_files_TaS2/2/18/TaS2_bench_poolsize_18_n_procs_126_2.log

mpirun -np 144 pw.x -nk 8 -nd 1 < TaS2_cdw.scf > out_files_TaS2/2/18/TaS2_bench_poolsize_18_n_procs_144_2.log

mpirun -np 162 pw.x -nk 9 -nd 1 < TaS2_cdw.scf > out_files_TaS2/2/18/TaS2_bench_poolsize_18_n_procs_162_2.log

mpirun -np 180 pw.x -nk 10 -nd 1 < TaS2_cdw.scf > out_files_TaS2/2/18/TaS2_bench_poolsize_18_n_procs_180_2.log

mpirun -np 104 pw.x -nk 52 -nd 1 < TaS2_cdw.scf > out_files_TaS2/3/2/TaS2_bench_poolsize_2_n_procs_104_3.log

mpirun -np 120 pw.x -nk 60 -nd 1 < TaS2_cdw.scf > out_files_TaS2/3/2/TaS2_bench_poolsize_2_n_procs_120_3.log

mpirun -np 136 pw.x -nk 68 -nd 1 < TaS2_cdw.scf > out_files_TaS2/3/2/TaS2_bench_poolsize_2_n_procs_136_3.log

mpirun -np 152 pw.x -nk 76 -nd 1 < TaS2_cdw.scf > out_files_TaS2/3/2/TaS2_bench_poolsize_2_n_procs_152_3.log

mpirun -np 168 pw.x -nk 84 -nd 1 < TaS2_cdw.scf > out_files_TaS2/3/2/TaS2_bench_poolsize_2_n_procs_168_3.log

mpirun -np 184 pw.x -nk 92 -nd 1 < TaS2_cdw.scf > out_files_TaS2/3/2/TaS2_bench_poolsize_2_n_procs_184_3.log

mpirun -np 104 pw.x -nk 13 -nd 1 < TaS2_cdw.scf > out_files_TaS2/3/8/TaS2_bench_poolsize_8_n_procs_104_3.log

mpirun -np 120 pw.x -nk 15 -nd 1 < TaS2_cdw.scf > out_files_TaS2/3/8/TaS2_bench_poolsize_8_n_procs_120_3.log

mpirun -np 136 pw.x -nk 17 -nd 1 < TaS2_cdw.scf > out_files_TaS2/3/8/TaS2_bench_poolsize_8_n_procs_136_3.log

mpirun -np 152 pw.x -nk 19 -nd 1 < TaS2_cdw.scf > out_files_TaS2/3/8/TaS2_bench_poolsize_8_n_procs_152_3.log

mpirun -np 168 pw.x -nk 21 -nd 1 < TaS2_cdw.scf > out_files_TaS2/3/8/TaS2_bench_poolsize_8_n_procs_168_3.log

mpirun -np 184 pw.x -nk 23 -nd 1 < TaS2_cdw.scf > out_files_TaS2/3/8/TaS2_bench_poolsize_8_n_procs_184_3.log

mpirun -np 96 pw.x -nk 4 -nd 1 < TaS2_cdw.scf > out_files_TaS2/3/24/TaS2_bench_poolsize_24_n_procs_96_3.log

mpirun -np 120 pw.x -nk 5 -nd 1 < TaS2_cdw.scf > out_files_TaS2/3/24/TaS2_bench_poolsize_24_n_procs_120_3.log

mpirun -np 144 pw.x -nk 6 -nd 1 < TaS2_cdw.scf > out_files_TaS2/3/24/TaS2_bench_poolsize_24_n_procs_144_3.log

mpirun -np 168 pw.x -nk 7 -nd 1 < TaS2_cdw.scf > out_files_TaS2/3/24/TaS2_bench_poolsize_24_n_procs_168_3.log

mpirun -np 192 pw.x -nk 8 -nd 1 < TaS2_cdw.scf > out_files_TaS2/3/24/TaS2_bench_poolsize_24_n_procs_192_3.log

mpirun -np 108 pw.x -nk 3 -nd 1 < TaS2_cdw.scf > out_files_TaS2/3/36/TaS2_bench_poolsize_36_n_procs_108_3.log

mpirun -np 144 pw.x -nk 4 -nd 1 < TaS2_cdw.scf > out_files_TaS2/3/36/TaS2_bench_poolsize_36_n_procs_144_3.log

mpirun -np 180 pw.x -nk 5 -nd 1 < TaS2_cdw.scf > out_files_TaS2/3/36/TaS2_bench_poolsize_36_n_procs_180_3.log

mpirun -np 96 pw.x -nk 2 -nd 1 < TaS2_cdw.scf > out_files_TaS2/3/48/TaS2_bench_poolsize_48_n_procs_96_3.log

mpirun -np 144 pw.x -nk 3 -nd 1 < TaS2_cdw.scf > out_files_TaS2/3/48/TaS2_bench_poolsize_48_n_procs_144_3.log

mpirun -np 192 pw.x -nk 4 -nd 1 < TaS2_cdw.scf > out_files_TaS2/3/48/TaS2_bench_poolsize_48_n_procs_192_3.log

mpirun -np 144 pw.x -nk 2 -nd 1 < TaS2_cdw.scf > out_files_TaS2/3/72/TaS2_bench_poolsize_72_n_procs_144_3.log

mpirun -np 108 pw.x -nk 6 -nd 1 < TaS2_cdw.scf > out_files_TaS2/3/18/TaS2_bench_poolsize_18_n_procs_108_3.log

mpirun -np 126 pw.x -nk 7 -nd 1 < TaS2_cdw.scf > out_files_TaS2/3/18/TaS2_bench_poolsize_18_n_procs_126_3.log

mpirun -np 144 pw.x -nk 8 -nd 1 < TaS2_cdw.scf > out_files_TaS2/3/18/TaS2_bench_poolsize_18_n_procs_144_3.log

mpirun -np 162 pw.x -nk 9 -nd 1 < TaS2_cdw.scf > out_files_TaS2/3/18/TaS2_bench_poolsize_18_n_procs_162_3.log

mpirun -np 180 pw.x -nk 10 -nd 1 < TaS2_cdw.scf > out_files_TaS2/3/18/TaS2_bench_poolsize_18_n_procs_180_3.log

mpirun -np 104 pw.x -nk 52 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/2/TaS2_bench_poolsize_2_n_procs_104_4.log

mpirun -np 120 pw.x -nk 60 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/2/TaS2_bench_poolsize_2_n_procs_120_4.log

mpirun -np 136 pw.x -nk 68 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/2/TaS2_bench_poolsize_2_n_procs_136_4.log

mpirun -np 152 pw.x -nk 76 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/2/TaS2_bench_poolsize_2_n_procs_152_4.log

mpirun -np 168 pw.x -nk 84 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/2/TaS2_bench_poolsize_2_n_procs_168_4.log

mpirun -np 184 pw.x -nk 92 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/2/TaS2_bench_poolsize_2_n_procs_184_4.log

mpirun -np 104 pw.x -nk 13 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/8/TaS2_bench_poolsize_8_n_procs_104_4.log

mpirun -np 120 pw.x -nk 15 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/8/TaS2_bench_poolsize_8_n_procs_120_4.log

mpirun -np 136 pw.x -nk 17 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/8/TaS2_bench_poolsize_8_n_procs_136_4.log

mpirun -np 152 pw.x -nk 19 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/8/TaS2_bench_poolsize_8_n_procs_152_4.log

mpirun -np 168 pw.x -nk 21 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/8/TaS2_bench_poolsize_8_n_procs_168_4.log

mpirun -np 184 pw.x -nk 23 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/8/TaS2_bench_poolsize_8_n_procs_184_4.log

mpirun -np 96 pw.x -nk 4 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/24/TaS2_bench_poolsize_24_n_procs_96_4.log

mpirun -np 120 pw.x -nk 5 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/24/TaS2_bench_poolsize_24_n_procs_120_4.log

mpirun -np 144 pw.x -nk 6 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/24/TaS2_bench_poolsize_24_n_procs_144_4.log

mpirun -np 168 pw.x -nk 7 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/24/TaS2_bench_poolsize_24_n_procs_168_4.log

mpirun -np 192 pw.x -nk 8 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/24/TaS2_bench_poolsize_24_n_procs_192_4.log

mpirun -np 108 pw.x -nk 3 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/36/TaS2_bench_poolsize_36_n_procs_108_4.log

mpirun -np 144 pw.x -nk 4 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/36/TaS2_bench_poolsize_36_n_procs_144_4.log

mpirun -np 180 pw.x -nk 5 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/36/TaS2_bench_poolsize_36_n_procs_180_4.log

mpirun -np 96 pw.x -nk 2 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/48/TaS2_bench_poolsize_48_n_procs_96_4.log

mpirun -np 144 pw.x -nk 3 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/48/TaS2_bench_poolsize_48_n_procs_144_4.log

mpirun -np 192 pw.x -nk 4 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/48/TaS2_bench_poolsize_48_n_procs_192_4.log

mpirun -np 144 pw.x -nk 2 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/72/TaS2_bench_poolsize_72_n_procs_144_4.log

mpirun -np 108 pw.x -nk 6 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/18/TaS2_bench_poolsize_18_n_procs_108_4.log

mpirun -np 126 pw.x -nk 7 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/18/TaS2_bench_poolsize_18_n_procs_126_4.log

mpirun -np 144 pw.x -nk 8 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/18/TaS2_bench_poolsize_18_n_procs_144_4.log

mpirun -np 162 pw.x -nk 9 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/18/TaS2_bench_poolsize_18_n_procs_162_4.log

mpirun -np 180 pw.x -nk 10 -nd 1 < TaS2_cdw.scf > out_files_TaS2/4/18/TaS2_bench_poolsize_18_n_procs_180_4.log
