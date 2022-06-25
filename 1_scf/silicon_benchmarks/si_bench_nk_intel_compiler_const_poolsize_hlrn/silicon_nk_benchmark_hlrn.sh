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


mpirun -np 88 pw.x -nk 44 -nd 1 < silicon.scf > out_files_silicon/0/2/silicon_bench_poolsize_2_n_procs_88_0.output

mpirun -np 96 pw.x -nk 48 -nd 1 < silicon.scf > out_files_silicon/0/2/silicon_bench_poolsize_2_n_procs_96_0.output

mpirun -np 104 pw.x -nk 52 -nd 1 < silicon.scf > out_files_silicon/0/2/silicon_bench_poolsize_2_n_procs_104_0.output

mpirun -np 112 pw.x -nk 56 -nd 1 < silicon.scf > out_files_silicon/0/2/silicon_bench_poolsize_2_n_procs_112_0.output

mpirun -np 120 pw.x -nk 60 -nd 1 < silicon.scf > out_files_silicon/0/2/silicon_bench_poolsize_2_n_procs_120_0.output

mpirun -np 128 pw.x -nk 64 -nd 1 < silicon.scf > out_files_silicon/0/2/silicon_bench_poolsize_2_n_procs_128_0.output

mpirun -np 136 pw.x -nk 68 -nd 1 < silicon.scf > out_files_silicon/0/2/silicon_bench_poolsize_2_n_procs_136_0.output

mpirun -np 144 pw.x -nk 72 -nd 1 < silicon.scf > out_files_silicon/0/2/silicon_bench_poolsize_2_n_procs_144_0.output

mpirun -np 152 pw.x -nk 76 -nd 1 < silicon.scf > out_files_silicon/0/2/silicon_bench_poolsize_2_n_procs_152_0.output

mpirun -np 160 pw.x -nk 80 -nd 1 < silicon.scf > out_files_silicon/0/2/silicon_bench_poolsize_2_n_procs_160_0.output

mpirun -np 168 pw.x -nk 84 -nd 1 < silicon.scf > out_files_silicon/0/2/silicon_bench_poolsize_2_n_procs_168_0.output

mpirun -np 176 pw.x -nk 88 -nd 1 < silicon.scf > out_files_silicon/0/2/silicon_bench_poolsize_2_n_procs_176_0.output

mpirun -np 184 pw.x -nk 92 -nd 1 < silicon.scf > out_files_silicon/0/2/silicon_bench_poolsize_2_n_procs_184_0.output

mpirun -np 192 pw.x -nk 96 -nd 1 < silicon.scf > out_files_silicon/0/2/silicon_bench_poolsize_2_n_procs_192_0.output

mpirun -np 88 pw.x -nk 11 -nd 1 < silicon.scf > out_files_silicon/0/8/silicon_bench_poolsize_8_n_procs_88_0.output

mpirun -np 96 pw.x -nk 12 -nd 1 < silicon.scf > out_files_silicon/0/8/silicon_bench_poolsize_8_n_procs_96_0.output

mpirun -np 104 pw.x -nk 13 -nd 1 < silicon.scf > out_files_silicon/0/8/silicon_bench_poolsize_8_n_procs_104_0.output

mpirun -np 112 pw.x -nk 14 -nd 1 < silicon.scf > out_files_silicon/0/8/silicon_bench_poolsize_8_n_procs_112_0.output

mpirun -np 120 pw.x -nk 15 -nd 1 < silicon.scf > out_files_silicon/0/8/silicon_bench_poolsize_8_n_procs_120_0.output

mpirun -np 128 pw.x -nk 16 -nd 1 < silicon.scf > out_files_silicon/0/8/silicon_bench_poolsize_8_n_procs_128_0.output

mpirun -np 136 pw.x -nk 17 -nd 1 < silicon.scf > out_files_silicon/0/8/silicon_bench_poolsize_8_n_procs_136_0.output

mpirun -np 144 pw.x -nk 18 -nd 1 < silicon.scf > out_files_silicon/0/8/silicon_bench_poolsize_8_n_procs_144_0.output

mpirun -np 152 pw.x -nk 19 -nd 1 < silicon.scf > out_files_silicon/0/8/silicon_bench_poolsize_8_n_procs_152_0.output

mpirun -np 160 pw.x -nk 20 -nd 1 < silicon.scf > out_files_silicon/0/8/silicon_bench_poolsize_8_n_procs_160_0.output

mpirun -np 168 pw.x -nk 21 -nd 1 < silicon.scf > out_files_silicon/0/8/silicon_bench_poolsize_8_n_procs_168_0.output

mpirun -np 176 pw.x -nk 22 -nd 1 < silicon.scf > out_files_silicon/0/8/silicon_bench_poolsize_8_n_procs_176_0.output

mpirun -np 184 pw.x -nk 23 -nd 1 < silicon.scf > out_files_silicon/0/8/silicon_bench_poolsize_8_n_procs_184_0.output

mpirun -np 192 pw.x -nk 24 -nd 1 < silicon.scf > out_files_silicon/0/8/silicon_bench_poolsize_8_n_procs_192_0.output

mpirun -np 96 pw.x -nk 6 -nd 1 < silicon.scf > out_files_silicon/0/16/silicon_bench_poolsize_16_n_procs_96_0.output

mpirun -np 112 pw.x -nk 7 -nd 1 < silicon.scf > out_files_silicon/0/16/silicon_bench_poolsize_16_n_procs_112_0.output

mpirun -np 128 pw.x -nk 8 -nd 1 < silicon.scf > out_files_silicon/0/16/silicon_bench_poolsize_16_n_procs_128_0.output

mpirun -np 144 pw.x -nk 9 -nd 1 < silicon.scf > out_files_silicon/0/16/silicon_bench_poolsize_16_n_procs_144_0.output

mpirun -np 160 pw.x -nk 10 -nd 1 < silicon.scf > out_files_silicon/0/16/silicon_bench_poolsize_16_n_procs_160_0.output

mpirun -np 176 pw.x -nk 11 -nd 1 < silicon.scf > out_files_silicon/0/16/silicon_bench_poolsize_16_n_procs_176_0.output

mpirun -np 192 pw.x -nk 12 -nd 1 < silicon.scf > out_files_silicon/0/16/silicon_bench_poolsize_16_n_procs_192_0.output

mpirun -np 88 pw.x -nk 44 -nd 1 < silicon.scf > out_files_silicon/1/2/silicon_bench_poolsize_2_n_procs_88_1.output

mpirun -np 96 pw.x -nk 48 -nd 1 < silicon.scf > out_files_silicon/1/2/silicon_bench_poolsize_2_n_procs_96_1.output

mpirun -np 104 pw.x -nk 52 -nd 1 < silicon.scf > out_files_silicon/1/2/silicon_bench_poolsize_2_n_procs_104_1.output

mpirun -np 112 pw.x -nk 56 -nd 1 < silicon.scf > out_files_silicon/1/2/silicon_bench_poolsize_2_n_procs_112_1.output

mpirun -np 120 pw.x -nk 60 -nd 1 < silicon.scf > out_files_silicon/1/2/silicon_bench_poolsize_2_n_procs_120_1.output

mpirun -np 128 pw.x -nk 64 -nd 1 < silicon.scf > out_files_silicon/1/2/silicon_bench_poolsize_2_n_procs_128_1.output

mpirun -np 136 pw.x -nk 68 -nd 1 < silicon.scf > out_files_silicon/1/2/silicon_bench_poolsize_2_n_procs_136_1.output

mpirun -np 144 pw.x -nk 72 -nd 1 < silicon.scf > out_files_silicon/1/2/silicon_bench_poolsize_2_n_procs_144_1.output

mpirun -np 152 pw.x -nk 76 -nd 1 < silicon.scf > out_files_silicon/1/2/silicon_bench_poolsize_2_n_procs_152_1.output

mpirun -np 160 pw.x -nk 80 -nd 1 < silicon.scf > out_files_silicon/1/2/silicon_bench_poolsize_2_n_procs_160_1.output

mpirun -np 168 pw.x -nk 84 -nd 1 < silicon.scf > out_files_silicon/1/2/silicon_bench_poolsize_2_n_procs_168_1.output

mpirun -np 176 pw.x -nk 88 -nd 1 < silicon.scf > out_files_silicon/1/2/silicon_bench_poolsize_2_n_procs_176_1.output

mpirun -np 184 pw.x -nk 92 -nd 1 < silicon.scf > out_files_silicon/1/2/silicon_bench_poolsize_2_n_procs_184_1.output

mpirun -np 192 pw.x -nk 96 -nd 1 < silicon.scf > out_files_silicon/1/2/silicon_bench_poolsize_2_n_procs_192_1.output

mpirun -np 88 pw.x -nk 11 -nd 1 < silicon.scf > out_files_silicon/1/8/silicon_bench_poolsize_8_n_procs_88_1.output

mpirun -np 96 pw.x -nk 12 -nd 1 < silicon.scf > out_files_silicon/1/8/silicon_bench_poolsize_8_n_procs_96_1.output

mpirun -np 104 pw.x -nk 13 -nd 1 < silicon.scf > out_files_silicon/1/8/silicon_bench_poolsize_8_n_procs_104_1.output

mpirun -np 112 pw.x -nk 14 -nd 1 < silicon.scf > out_files_silicon/1/8/silicon_bench_poolsize_8_n_procs_112_1.output

mpirun -np 120 pw.x -nk 15 -nd 1 < silicon.scf > out_files_silicon/1/8/silicon_bench_poolsize_8_n_procs_120_1.output

mpirun -np 128 pw.x -nk 16 -nd 1 < silicon.scf > out_files_silicon/1/8/silicon_bench_poolsize_8_n_procs_128_1.output

mpirun -np 136 pw.x -nk 17 -nd 1 < silicon.scf > out_files_silicon/1/8/silicon_bench_poolsize_8_n_procs_136_1.output

mpirun -np 144 pw.x -nk 18 -nd 1 < silicon.scf > out_files_silicon/1/8/silicon_bench_poolsize_8_n_procs_144_1.output

mpirun -np 152 pw.x -nk 19 -nd 1 < silicon.scf > out_files_silicon/1/8/silicon_bench_poolsize_8_n_procs_152_1.output

mpirun -np 160 pw.x -nk 20 -nd 1 < silicon.scf > out_files_silicon/1/8/silicon_bench_poolsize_8_n_procs_160_1.output

mpirun -np 168 pw.x -nk 21 -nd 1 < silicon.scf > out_files_silicon/1/8/silicon_bench_poolsize_8_n_procs_168_1.output

mpirun -np 176 pw.x -nk 22 -nd 1 < silicon.scf > out_files_silicon/1/8/silicon_bench_poolsize_8_n_procs_176_1.output

mpirun -np 184 pw.x -nk 23 -nd 1 < silicon.scf > out_files_silicon/1/8/silicon_bench_poolsize_8_n_procs_184_1.output

mpirun -np 192 pw.x -nk 24 -nd 1 < silicon.scf > out_files_silicon/1/8/silicon_bench_poolsize_8_n_procs_192_1.output

mpirun -np 96 pw.x -nk 6 -nd 1 < silicon.scf > out_files_silicon/1/16/silicon_bench_poolsize_16_n_procs_96_1.output

mpirun -np 112 pw.x -nk 7 -nd 1 < silicon.scf > out_files_silicon/1/16/silicon_bench_poolsize_16_n_procs_112_1.output

mpirun -np 128 pw.x -nk 8 -nd 1 < silicon.scf > out_files_silicon/1/16/silicon_bench_poolsize_16_n_procs_128_1.output

mpirun -np 144 pw.x -nk 9 -nd 1 < silicon.scf > out_files_silicon/1/16/silicon_bench_poolsize_16_n_procs_144_1.output

mpirun -np 160 pw.x -nk 10 -nd 1 < silicon.scf > out_files_silicon/1/16/silicon_bench_poolsize_16_n_procs_160_1.output

mpirun -np 176 pw.x -nk 11 -nd 1 < silicon.scf > out_files_silicon/1/16/silicon_bench_poolsize_16_n_procs_176_1.output

mpirun -np 192 pw.x -nk 12 -nd 1 < silicon.scf > out_files_silicon/1/16/silicon_bench_poolsize_16_n_procs_192_1.output

mpirun -np 88 pw.x -nk 44 -nd 1 < silicon.scf > out_files_silicon/2/2/silicon_bench_poolsize_2_n_procs_88_2.output

mpirun -np 96 pw.x -nk 48 -nd 1 < silicon.scf > out_files_silicon/2/2/silicon_bench_poolsize_2_n_procs_96_2.output

mpirun -np 104 pw.x -nk 52 -nd 1 < silicon.scf > out_files_silicon/2/2/silicon_bench_poolsize_2_n_procs_104_2.output

mpirun -np 112 pw.x -nk 56 -nd 1 < silicon.scf > out_files_silicon/2/2/silicon_bench_poolsize_2_n_procs_112_2.output

mpirun -np 120 pw.x -nk 60 -nd 1 < silicon.scf > out_files_silicon/2/2/silicon_bench_poolsize_2_n_procs_120_2.output

mpirun -np 128 pw.x -nk 64 -nd 1 < silicon.scf > out_files_silicon/2/2/silicon_bench_poolsize_2_n_procs_128_2.output

mpirun -np 136 pw.x -nk 68 -nd 1 < silicon.scf > out_files_silicon/2/2/silicon_bench_poolsize_2_n_procs_136_2.output

mpirun -np 144 pw.x -nk 72 -nd 1 < silicon.scf > out_files_silicon/2/2/silicon_bench_poolsize_2_n_procs_144_2.output

mpirun -np 152 pw.x -nk 76 -nd 1 < silicon.scf > out_files_silicon/2/2/silicon_bench_poolsize_2_n_procs_152_2.output

mpirun -np 160 pw.x -nk 80 -nd 1 < silicon.scf > out_files_silicon/2/2/silicon_bench_poolsize_2_n_procs_160_2.output

mpirun -np 168 pw.x -nk 84 -nd 1 < silicon.scf > out_files_silicon/2/2/silicon_bench_poolsize_2_n_procs_168_2.output

mpirun -np 176 pw.x -nk 88 -nd 1 < silicon.scf > out_files_silicon/2/2/silicon_bench_poolsize_2_n_procs_176_2.output

mpirun -np 184 pw.x -nk 92 -nd 1 < silicon.scf > out_files_silicon/2/2/silicon_bench_poolsize_2_n_procs_184_2.output

mpirun -np 192 pw.x -nk 96 -nd 1 < silicon.scf > out_files_silicon/2/2/silicon_bench_poolsize_2_n_procs_192_2.output

mpirun -np 88 pw.x -nk 11 -nd 1 < silicon.scf > out_files_silicon/2/8/silicon_bench_poolsize_8_n_procs_88_2.output

mpirun -np 96 pw.x -nk 12 -nd 1 < silicon.scf > out_files_silicon/2/8/silicon_bench_poolsize_8_n_procs_96_2.output

mpirun -np 104 pw.x -nk 13 -nd 1 < silicon.scf > out_files_silicon/2/8/silicon_bench_poolsize_8_n_procs_104_2.output

mpirun -np 112 pw.x -nk 14 -nd 1 < silicon.scf > out_files_silicon/2/8/silicon_bench_poolsize_8_n_procs_112_2.output

mpirun -np 120 pw.x -nk 15 -nd 1 < silicon.scf > out_files_silicon/2/8/silicon_bench_poolsize_8_n_procs_120_2.output

mpirun -np 128 pw.x -nk 16 -nd 1 < silicon.scf > out_files_silicon/2/8/silicon_bench_poolsize_8_n_procs_128_2.output

mpirun -np 136 pw.x -nk 17 -nd 1 < silicon.scf > out_files_silicon/2/8/silicon_bench_poolsize_8_n_procs_136_2.output

mpirun -np 144 pw.x -nk 18 -nd 1 < silicon.scf > out_files_silicon/2/8/silicon_bench_poolsize_8_n_procs_144_2.output

mpirun -np 152 pw.x -nk 19 -nd 1 < silicon.scf > out_files_silicon/2/8/silicon_bench_poolsize_8_n_procs_152_2.output

mpirun -np 160 pw.x -nk 20 -nd 1 < silicon.scf > out_files_silicon/2/8/silicon_bench_poolsize_8_n_procs_160_2.output

mpirun -np 168 pw.x -nk 21 -nd 1 < silicon.scf > out_files_silicon/2/8/silicon_bench_poolsize_8_n_procs_168_2.output

mpirun -np 176 pw.x -nk 22 -nd 1 < silicon.scf > out_files_silicon/2/8/silicon_bench_poolsize_8_n_procs_176_2.output

mpirun -np 184 pw.x -nk 23 -nd 1 < silicon.scf > out_files_silicon/2/8/silicon_bench_poolsize_8_n_procs_184_2.output

mpirun -np 192 pw.x -nk 24 -nd 1 < silicon.scf > out_files_silicon/2/8/silicon_bench_poolsize_8_n_procs_192_2.output

mpirun -np 96 pw.x -nk 6 -nd 1 < silicon.scf > out_files_silicon/2/16/silicon_bench_poolsize_16_n_procs_96_2.output

mpirun -np 112 pw.x -nk 7 -nd 1 < silicon.scf > out_files_silicon/2/16/silicon_bench_poolsize_16_n_procs_112_2.output

mpirun -np 128 pw.x -nk 8 -nd 1 < silicon.scf > out_files_silicon/2/16/silicon_bench_poolsize_16_n_procs_128_2.output

mpirun -np 144 pw.x -nk 9 -nd 1 < silicon.scf > out_files_silicon/2/16/silicon_bench_poolsize_16_n_procs_144_2.output

mpirun -np 160 pw.x -nk 10 -nd 1 < silicon.scf > out_files_silicon/2/16/silicon_bench_poolsize_16_n_procs_160_2.output

mpirun -np 176 pw.x -nk 11 -nd 1 < silicon.scf > out_files_silicon/2/16/silicon_bench_poolsize_16_n_procs_176_2.output

mpirun -np 192 pw.x -nk 12 -nd 1 < silicon.scf > out_files_silicon/2/16/silicon_bench_poolsize_16_n_procs_192_2.output

mpirun -np 88 pw.x -nk 44 -nd 1 < silicon.scf > out_files_silicon/3/2/silicon_bench_poolsize_2_n_procs_88_3.output

mpirun -np 96 pw.x -nk 48 -nd 1 < silicon.scf > out_files_silicon/3/2/silicon_bench_poolsize_2_n_procs_96_3.output

mpirun -np 104 pw.x -nk 52 -nd 1 < silicon.scf > out_files_silicon/3/2/silicon_bench_poolsize_2_n_procs_104_3.output

mpirun -np 112 pw.x -nk 56 -nd 1 < silicon.scf > out_files_silicon/3/2/silicon_bench_poolsize_2_n_procs_112_3.output

mpirun -np 120 pw.x -nk 60 -nd 1 < silicon.scf > out_files_silicon/3/2/silicon_bench_poolsize_2_n_procs_120_3.output

mpirun -np 128 pw.x -nk 64 -nd 1 < silicon.scf > out_files_silicon/3/2/silicon_bench_poolsize_2_n_procs_128_3.output

mpirun -np 136 pw.x -nk 68 -nd 1 < silicon.scf > out_files_silicon/3/2/silicon_bench_poolsize_2_n_procs_136_3.output

mpirun -np 144 pw.x -nk 72 -nd 1 < silicon.scf > out_files_silicon/3/2/silicon_bench_poolsize_2_n_procs_144_3.output

mpirun -np 152 pw.x -nk 76 -nd 1 < silicon.scf > out_files_silicon/3/2/silicon_bench_poolsize_2_n_procs_152_3.output

mpirun -np 160 pw.x -nk 80 -nd 1 < silicon.scf > out_files_silicon/3/2/silicon_bench_poolsize_2_n_procs_160_3.output

mpirun -np 168 pw.x -nk 84 -nd 1 < silicon.scf > out_files_silicon/3/2/silicon_bench_poolsize_2_n_procs_168_3.output

mpirun -np 176 pw.x -nk 88 -nd 1 < silicon.scf > out_files_silicon/3/2/silicon_bench_poolsize_2_n_procs_176_3.output

mpirun -np 184 pw.x -nk 92 -nd 1 < silicon.scf > out_files_silicon/3/2/silicon_bench_poolsize_2_n_procs_184_3.output

mpirun -np 192 pw.x -nk 96 -nd 1 < silicon.scf > out_files_silicon/3/2/silicon_bench_poolsize_2_n_procs_192_3.output

mpirun -np 88 pw.x -nk 11 -nd 1 < silicon.scf > out_files_silicon/3/8/silicon_bench_poolsize_8_n_procs_88_3.output

mpirun -np 96 pw.x -nk 12 -nd 1 < silicon.scf > out_files_silicon/3/8/silicon_bench_poolsize_8_n_procs_96_3.output

mpirun -np 104 pw.x -nk 13 -nd 1 < silicon.scf > out_files_silicon/3/8/silicon_bench_poolsize_8_n_procs_104_3.output

mpirun -np 112 pw.x -nk 14 -nd 1 < silicon.scf > out_files_silicon/3/8/silicon_bench_poolsize_8_n_procs_112_3.output

mpirun -np 120 pw.x -nk 15 -nd 1 < silicon.scf > out_files_silicon/3/8/silicon_bench_poolsize_8_n_procs_120_3.output

mpirun -np 128 pw.x -nk 16 -nd 1 < silicon.scf > out_files_silicon/3/8/silicon_bench_poolsize_8_n_procs_128_3.output

mpirun -np 136 pw.x -nk 17 -nd 1 < silicon.scf > out_files_silicon/3/8/silicon_bench_poolsize_8_n_procs_136_3.output

mpirun -np 144 pw.x -nk 18 -nd 1 < silicon.scf > out_files_silicon/3/8/silicon_bench_poolsize_8_n_procs_144_3.output

mpirun -np 152 pw.x -nk 19 -nd 1 < silicon.scf > out_files_silicon/3/8/silicon_bench_poolsize_8_n_procs_152_3.output

mpirun -np 160 pw.x -nk 20 -nd 1 < silicon.scf > out_files_silicon/3/8/silicon_bench_poolsize_8_n_procs_160_3.output

mpirun -np 168 pw.x -nk 21 -nd 1 < silicon.scf > out_files_silicon/3/8/silicon_bench_poolsize_8_n_procs_168_3.output

mpirun -np 176 pw.x -nk 22 -nd 1 < silicon.scf > out_files_silicon/3/8/silicon_bench_poolsize_8_n_procs_176_3.output

mpirun -np 184 pw.x -nk 23 -nd 1 < silicon.scf > out_files_silicon/3/8/silicon_bench_poolsize_8_n_procs_184_3.output

mpirun -np 192 pw.x -nk 24 -nd 1 < silicon.scf > out_files_silicon/3/8/silicon_bench_poolsize_8_n_procs_192_3.output

mpirun -np 96 pw.x -nk 6 -nd 1 < silicon.scf > out_files_silicon/3/16/silicon_bench_poolsize_16_n_procs_96_3.output

mpirun -np 112 pw.x -nk 7 -nd 1 < silicon.scf > out_files_silicon/3/16/silicon_bench_poolsize_16_n_procs_112_3.output

mpirun -np 128 pw.x -nk 8 -nd 1 < silicon.scf > out_files_silicon/3/16/silicon_bench_poolsize_16_n_procs_128_3.output

mpirun -np 144 pw.x -nk 9 -nd 1 < silicon.scf > out_files_silicon/3/16/silicon_bench_poolsize_16_n_procs_144_3.output

mpirun -np 160 pw.x -nk 10 -nd 1 < silicon.scf > out_files_silicon/3/16/silicon_bench_poolsize_16_n_procs_160_3.output

mpirun -np 176 pw.x -nk 11 -nd 1 < silicon.scf > out_files_silicon/3/16/silicon_bench_poolsize_16_n_procs_176_3.output

mpirun -np 192 pw.x -nk 12 -nd 1 < silicon.scf > out_files_silicon/3/16/silicon_bench_poolsize_16_n_procs_192_3.output

mpirun -np 88 pw.x -nk 44 -nd 1 < silicon.scf > out_files_silicon/4/2/silicon_bench_poolsize_2_n_procs_88_4.output

mpirun -np 96 pw.x -nk 48 -nd 1 < silicon.scf > out_files_silicon/4/2/silicon_bench_poolsize_2_n_procs_96_4.output

mpirun -np 104 pw.x -nk 52 -nd 1 < silicon.scf > out_files_silicon/4/2/silicon_bench_poolsize_2_n_procs_104_4.output

mpirun -np 112 pw.x -nk 56 -nd 1 < silicon.scf > out_files_silicon/4/2/silicon_bench_poolsize_2_n_procs_112_4.output

mpirun -np 120 pw.x -nk 60 -nd 1 < silicon.scf > out_files_silicon/4/2/silicon_bench_poolsize_2_n_procs_120_4.output

mpirun -np 128 pw.x -nk 64 -nd 1 < silicon.scf > out_files_silicon/4/2/silicon_bench_poolsize_2_n_procs_128_4.output

mpirun -np 136 pw.x -nk 68 -nd 1 < silicon.scf > out_files_silicon/4/2/silicon_bench_poolsize_2_n_procs_136_4.output

mpirun -np 144 pw.x -nk 72 -nd 1 < silicon.scf > out_files_silicon/4/2/silicon_bench_poolsize_2_n_procs_144_4.output

mpirun -np 152 pw.x -nk 76 -nd 1 < silicon.scf > out_files_silicon/4/2/silicon_bench_poolsize_2_n_procs_152_4.output

mpirun -np 160 pw.x -nk 80 -nd 1 < silicon.scf > out_files_silicon/4/2/silicon_bench_poolsize_2_n_procs_160_4.output

mpirun -np 168 pw.x -nk 84 -nd 1 < silicon.scf > out_files_silicon/4/2/silicon_bench_poolsize_2_n_procs_168_4.output

mpirun -np 176 pw.x -nk 88 -nd 1 < silicon.scf > out_files_silicon/4/2/silicon_bench_poolsize_2_n_procs_176_4.output

mpirun -np 184 pw.x -nk 92 -nd 1 < silicon.scf > out_files_silicon/4/2/silicon_bench_poolsize_2_n_procs_184_4.output

mpirun -np 192 pw.x -nk 96 -nd 1 < silicon.scf > out_files_silicon/4/2/silicon_bench_poolsize_2_n_procs_192_4.output

mpirun -np 88 pw.x -nk 11 -nd 1 < silicon.scf > out_files_silicon/4/8/silicon_bench_poolsize_8_n_procs_88_4.output

mpirun -np 96 pw.x -nk 12 -nd 1 < silicon.scf > out_files_silicon/4/8/silicon_bench_poolsize_8_n_procs_96_4.output

mpirun -np 104 pw.x -nk 13 -nd 1 < silicon.scf > out_files_silicon/4/8/silicon_bench_poolsize_8_n_procs_104_4.output

mpirun -np 112 pw.x -nk 14 -nd 1 < silicon.scf > out_files_silicon/4/8/silicon_bench_poolsize_8_n_procs_112_4.output

mpirun -np 120 pw.x -nk 15 -nd 1 < silicon.scf > out_files_silicon/4/8/silicon_bench_poolsize_8_n_procs_120_4.output

mpirun -np 128 pw.x -nk 16 -nd 1 < silicon.scf > out_files_silicon/4/8/silicon_bench_poolsize_8_n_procs_128_4.output

mpirun -np 136 pw.x -nk 17 -nd 1 < silicon.scf > out_files_silicon/4/8/silicon_bench_poolsize_8_n_procs_136_4.output

mpirun -np 144 pw.x -nk 18 -nd 1 < silicon.scf > out_files_silicon/4/8/silicon_bench_poolsize_8_n_procs_144_4.output

mpirun -np 152 pw.x -nk 19 -nd 1 < silicon.scf > out_files_silicon/4/8/silicon_bench_poolsize_8_n_procs_152_4.output

mpirun -np 160 pw.x -nk 20 -nd 1 < silicon.scf > out_files_silicon/4/8/silicon_bench_poolsize_8_n_procs_160_4.output

mpirun -np 168 pw.x -nk 21 -nd 1 < silicon.scf > out_files_silicon/4/8/silicon_bench_poolsize_8_n_procs_168_4.output

mpirun -np 176 pw.x -nk 22 -nd 1 < silicon.scf > out_files_silicon/4/8/silicon_bench_poolsize_8_n_procs_176_4.output

mpirun -np 184 pw.x -nk 23 -nd 1 < silicon.scf > out_files_silicon/4/8/silicon_bench_poolsize_8_n_procs_184_4.output

mpirun -np 192 pw.x -nk 24 -nd 1 < silicon.scf > out_files_silicon/4/8/silicon_bench_poolsize_8_n_procs_192_4.output

mpirun -np 96 pw.x -nk 6 -nd 1 < silicon.scf > out_files_silicon/4/16/silicon_bench_poolsize_16_n_procs_96_4.output

mpirun -np 112 pw.x -nk 7 -nd 1 < silicon.scf > out_files_silicon/4/16/silicon_bench_poolsize_16_n_procs_112_4.output

mpirun -np 128 pw.x -nk 8 -nd 1 < silicon.scf > out_files_silicon/4/16/silicon_bench_poolsize_16_n_procs_128_4.output

mpirun -np 144 pw.x -nk 9 -nd 1 < silicon.scf > out_files_silicon/4/16/silicon_bench_poolsize_16_n_procs_144_4.output

mpirun -np 160 pw.x -nk 10 -nd 1 < silicon.scf > out_files_silicon/4/16/silicon_bench_poolsize_16_n_procs_160_4.output

mpirun -np 176 pw.x -nk 11 -nd 1 < silicon.scf > out_files_silicon/4/16/silicon_bench_poolsize_16_n_procs_176_4.output

mpirun -np 192 pw.x -nk 12 -nd 1 < silicon.scf > out_files_silicon/4/16/silicon_bench_poolsize_16_n_procs_192_4.output

mpirun -np 88 pw.x -nk 44 -nd 1 < silicon.scf > out_files_silicon/5/2/silicon_bench_poolsize_2_n_procs_88_5.output

mpirun -np 96 pw.x -nk 48 -nd 1 < silicon.scf > out_files_silicon/5/2/silicon_bench_poolsize_2_n_procs_96_5.output

mpirun -np 104 pw.x -nk 52 -nd 1 < silicon.scf > out_files_silicon/5/2/silicon_bench_poolsize_2_n_procs_104_5.output

mpirun -np 112 pw.x -nk 56 -nd 1 < silicon.scf > out_files_silicon/5/2/silicon_bench_poolsize_2_n_procs_112_5.output

mpirun -np 120 pw.x -nk 60 -nd 1 < silicon.scf > out_files_silicon/5/2/silicon_bench_poolsize_2_n_procs_120_5.output

mpirun -np 128 pw.x -nk 64 -nd 1 < silicon.scf > out_files_silicon/5/2/silicon_bench_poolsize_2_n_procs_128_5.output

mpirun -np 136 pw.x -nk 68 -nd 1 < silicon.scf > out_files_silicon/5/2/silicon_bench_poolsize_2_n_procs_136_5.output

mpirun -np 144 pw.x -nk 72 -nd 1 < silicon.scf > out_files_silicon/5/2/silicon_bench_poolsize_2_n_procs_144_5.output

mpirun -np 152 pw.x -nk 76 -nd 1 < silicon.scf > out_files_silicon/5/2/silicon_bench_poolsize_2_n_procs_152_5.output

mpirun -np 160 pw.x -nk 80 -nd 1 < silicon.scf > out_files_silicon/5/2/silicon_bench_poolsize_2_n_procs_160_5.output

mpirun -np 168 pw.x -nk 84 -nd 1 < silicon.scf > out_files_silicon/5/2/silicon_bench_poolsize_2_n_procs_168_5.output

mpirun -np 176 pw.x -nk 88 -nd 1 < silicon.scf > out_files_silicon/5/2/silicon_bench_poolsize_2_n_procs_176_5.output

mpirun -np 184 pw.x -nk 92 -nd 1 < silicon.scf > out_files_silicon/5/2/silicon_bench_poolsize_2_n_procs_184_5.output

mpirun -np 192 pw.x -nk 96 -nd 1 < silicon.scf > out_files_silicon/5/2/silicon_bench_poolsize_2_n_procs_192_5.output

mpirun -np 88 pw.x -nk 11 -nd 1 < silicon.scf > out_files_silicon/5/8/silicon_bench_poolsize_8_n_procs_88_5.output

mpirun -np 96 pw.x -nk 12 -nd 1 < silicon.scf > out_files_silicon/5/8/silicon_bench_poolsize_8_n_procs_96_5.output

mpirun -np 104 pw.x -nk 13 -nd 1 < silicon.scf > out_files_silicon/5/8/silicon_bench_poolsize_8_n_procs_104_5.output

mpirun -np 112 pw.x -nk 14 -nd 1 < silicon.scf > out_files_silicon/5/8/silicon_bench_poolsize_8_n_procs_112_5.output

mpirun -np 120 pw.x -nk 15 -nd 1 < silicon.scf > out_files_silicon/5/8/silicon_bench_poolsize_8_n_procs_120_5.output

mpirun -np 128 pw.x -nk 16 -nd 1 < silicon.scf > out_files_silicon/5/8/silicon_bench_poolsize_8_n_procs_128_5.output

mpirun -np 136 pw.x -nk 17 -nd 1 < silicon.scf > out_files_silicon/5/8/silicon_bench_poolsize_8_n_procs_136_5.output

mpirun -np 144 pw.x -nk 18 -nd 1 < silicon.scf > out_files_silicon/5/8/silicon_bench_poolsize_8_n_procs_144_5.output

mpirun -np 152 pw.x -nk 19 -nd 1 < silicon.scf > out_files_silicon/5/8/silicon_bench_poolsize_8_n_procs_152_5.output

mpirun -np 160 pw.x -nk 20 -nd 1 < silicon.scf > out_files_silicon/5/8/silicon_bench_poolsize_8_n_procs_160_5.output

mpirun -np 168 pw.x -nk 21 -nd 1 < silicon.scf > out_files_silicon/5/8/silicon_bench_poolsize_8_n_procs_168_5.output

mpirun -np 176 pw.x -nk 22 -nd 1 < silicon.scf > out_files_silicon/5/8/silicon_bench_poolsize_8_n_procs_176_5.output

mpirun -np 184 pw.x -nk 23 -nd 1 < silicon.scf > out_files_silicon/5/8/silicon_bench_poolsize_8_n_procs_184_5.output

mpirun -np 192 pw.x -nk 24 -nd 1 < silicon.scf > out_files_silicon/5/8/silicon_bench_poolsize_8_n_procs_192_5.output

mpirun -np 96 pw.x -nk 6 -nd 1 < silicon.scf > out_files_silicon/5/16/silicon_bench_poolsize_16_n_procs_96_5.output

mpirun -np 112 pw.x -nk 7 -nd 1 < silicon.scf > out_files_silicon/5/16/silicon_bench_poolsize_16_n_procs_112_5.output

mpirun -np 128 pw.x -nk 8 -nd 1 < silicon.scf > out_files_silicon/5/16/silicon_bench_poolsize_16_n_procs_128_5.output

mpirun -np 144 pw.x -nk 9 -nd 1 < silicon.scf > out_files_silicon/5/16/silicon_bench_poolsize_16_n_procs_144_5.output

mpirun -np 160 pw.x -nk 10 -nd 1 < silicon.scf > out_files_silicon/5/16/silicon_bench_poolsize_16_n_procs_160_5.output

mpirun -np 176 pw.x -nk 11 -nd 1 < silicon.scf > out_files_silicon/5/16/silicon_bench_poolsize_16_n_procs_176_5.output

mpirun -np 192 pw.x -nk 12 -nd 1 < silicon.scf > out_files_silicon/5/16/silicon_bench_poolsize_16_n_procs_192_5.output

mpirun -np 88 pw.x -nk 44 -nd 1 < silicon.scf > out_files_silicon/6/2/silicon_bench_poolsize_2_n_procs_88_6.output

mpirun -np 96 pw.x -nk 48 -nd 1 < silicon.scf > out_files_silicon/6/2/silicon_bench_poolsize_2_n_procs_96_6.output

mpirun -np 104 pw.x -nk 52 -nd 1 < silicon.scf > out_files_silicon/6/2/silicon_bench_poolsize_2_n_procs_104_6.output

mpirun -np 112 pw.x -nk 56 -nd 1 < silicon.scf > out_files_silicon/6/2/silicon_bench_poolsize_2_n_procs_112_6.output

mpirun -np 120 pw.x -nk 60 -nd 1 < silicon.scf > out_files_silicon/6/2/silicon_bench_poolsize_2_n_procs_120_6.output

mpirun -np 128 pw.x -nk 64 -nd 1 < silicon.scf > out_files_silicon/6/2/silicon_bench_poolsize_2_n_procs_128_6.output

mpirun -np 136 pw.x -nk 68 -nd 1 < silicon.scf > out_files_silicon/6/2/silicon_bench_poolsize_2_n_procs_136_6.output

mpirun -np 144 pw.x -nk 72 -nd 1 < silicon.scf > out_files_silicon/6/2/silicon_bench_poolsize_2_n_procs_144_6.output

mpirun -np 152 pw.x -nk 76 -nd 1 < silicon.scf > out_files_silicon/6/2/silicon_bench_poolsize_2_n_procs_152_6.output

mpirun -np 160 pw.x -nk 80 -nd 1 < silicon.scf > out_files_silicon/6/2/silicon_bench_poolsize_2_n_procs_160_6.output

mpirun -np 168 pw.x -nk 84 -nd 1 < silicon.scf > out_files_silicon/6/2/silicon_bench_poolsize_2_n_procs_168_6.output

mpirun -np 176 pw.x -nk 88 -nd 1 < silicon.scf > out_files_silicon/6/2/silicon_bench_poolsize_2_n_procs_176_6.output

mpirun -np 184 pw.x -nk 92 -nd 1 < silicon.scf > out_files_silicon/6/2/silicon_bench_poolsize_2_n_procs_184_6.output

mpirun -np 192 pw.x -nk 96 -nd 1 < silicon.scf > out_files_silicon/6/2/silicon_bench_poolsize_2_n_procs_192_6.output

mpirun -np 88 pw.x -nk 11 -nd 1 < silicon.scf > out_files_silicon/6/8/silicon_bench_poolsize_8_n_procs_88_6.output

mpirun -np 96 pw.x -nk 12 -nd 1 < silicon.scf > out_files_silicon/6/8/silicon_bench_poolsize_8_n_procs_96_6.output

mpirun -np 104 pw.x -nk 13 -nd 1 < silicon.scf > out_files_silicon/6/8/silicon_bench_poolsize_8_n_procs_104_6.output

mpirun -np 112 pw.x -nk 14 -nd 1 < silicon.scf > out_files_silicon/6/8/silicon_bench_poolsize_8_n_procs_112_6.output

mpirun -np 120 pw.x -nk 15 -nd 1 < silicon.scf > out_files_silicon/6/8/silicon_bench_poolsize_8_n_procs_120_6.output

mpirun -np 128 pw.x -nk 16 -nd 1 < silicon.scf > out_files_silicon/6/8/silicon_bench_poolsize_8_n_procs_128_6.output

mpirun -np 136 pw.x -nk 17 -nd 1 < silicon.scf > out_files_silicon/6/8/silicon_bench_poolsize_8_n_procs_136_6.output

mpirun -np 144 pw.x -nk 18 -nd 1 < silicon.scf > out_files_silicon/6/8/silicon_bench_poolsize_8_n_procs_144_6.output

mpirun -np 152 pw.x -nk 19 -nd 1 < silicon.scf > out_files_silicon/6/8/silicon_bench_poolsize_8_n_procs_152_6.output

mpirun -np 160 pw.x -nk 20 -nd 1 < silicon.scf > out_files_silicon/6/8/silicon_bench_poolsize_8_n_procs_160_6.output

mpirun -np 168 pw.x -nk 21 -nd 1 < silicon.scf > out_files_silicon/6/8/silicon_bench_poolsize_8_n_procs_168_6.output

mpirun -np 176 pw.x -nk 22 -nd 1 < silicon.scf > out_files_silicon/6/8/silicon_bench_poolsize_8_n_procs_176_6.output

mpirun -np 184 pw.x -nk 23 -nd 1 < silicon.scf > out_files_silicon/6/8/silicon_bench_poolsize_8_n_procs_184_6.output

mpirun -np 192 pw.x -nk 24 -nd 1 < silicon.scf > out_files_silicon/6/8/silicon_bench_poolsize_8_n_procs_192_6.output

mpirun -np 96 pw.x -nk 6 -nd 1 < silicon.scf > out_files_silicon/6/16/silicon_bench_poolsize_16_n_procs_96_6.output

mpirun -np 112 pw.x -nk 7 -nd 1 < silicon.scf > out_files_silicon/6/16/silicon_bench_poolsize_16_n_procs_112_6.output

mpirun -np 128 pw.x -nk 8 -nd 1 < silicon.scf > out_files_silicon/6/16/silicon_bench_poolsize_16_n_procs_128_6.output

mpirun -np 144 pw.x -nk 9 -nd 1 < silicon.scf > out_files_silicon/6/16/silicon_bench_poolsize_16_n_procs_144_6.output

mpirun -np 160 pw.x -nk 10 -nd 1 < silicon.scf > out_files_silicon/6/16/silicon_bench_poolsize_16_n_procs_160_6.output

mpirun -np 176 pw.x -nk 11 -nd 1 < silicon.scf > out_files_silicon/6/16/silicon_bench_poolsize_16_n_procs_176_6.output

mpirun -np 192 pw.x -nk 12 -nd 1 < silicon.scf > out_files_silicon/6/16/silicon_bench_poolsize_16_n_procs_192_6.output

mpirun -np 88 pw.x -nk 44 -nd 1 < silicon.scf > out_files_silicon/7/2/silicon_bench_poolsize_2_n_procs_88_7.output

mpirun -np 96 pw.x -nk 48 -nd 1 < silicon.scf > out_files_silicon/7/2/silicon_bench_poolsize_2_n_procs_96_7.output

mpirun -np 104 pw.x -nk 52 -nd 1 < silicon.scf > out_files_silicon/7/2/silicon_bench_poolsize_2_n_procs_104_7.output

mpirun -np 112 pw.x -nk 56 -nd 1 < silicon.scf > out_files_silicon/7/2/silicon_bench_poolsize_2_n_procs_112_7.output

mpirun -np 120 pw.x -nk 60 -nd 1 < silicon.scf > out_files_silicon/7/2/silicon_bench_poolsize_2_n_procs_120_7.output

mpirun -np 128 pw.x -nk 64 -nd 1 < silicon.scf > out_files_silicon/7/2/silicon_bench_poolsize_2_n_procs_128_7.output

mpirun -np 136 pw.x -nk 68 -nd 1 < silicon.scf > out_files_silicon/7/2/silicon_bench_poolsize_2_n_procs_136_7.output

mpirun -np 144 pw.x -nk 72 -nd 1 < silicon.scf > out_files_silicon/7/2/silicon_bench_poolsize_2_n_procs_144_7.output

mpirun -np 152 pw.x -nk 76 -nd 1 < silicon.scf > out_files_silicon/7/2/silicon_bench_poolsize_2_n_procs_152_7.output

mpirun -np 160 pw.x -nk 80 -nd 1 < silicon.scf > out_files_silicon/7/2/silicon_bench_poolsize_2_n_procs_160_7.output

mpirun -np 168 pw.x -nk 84 -nd 1 < silicon.scf > out_files_silicon/7/2/silicon_bench_poolsize_2_n_procs_168_7.output

mpirun -np 176 pw.x -nk 88 -nd 1 < silicon.scf > out_files_silicon/7/2/silicon_bench_poolsize_2_n_procs_176_7.output

mpirun -np 184 pw.x -nk 92 -nd 1 < silicon.scf > out_files_silicon/7/2/silicon_bench_poolsize_2_n_procs_184_7.output

mpirun -np 192 pw.x -nk 96 -nd 1 < silicon.scf > out_files_silicon/7/2/silicon_bench_poolsize_2_n_procs_192_7.output

mpirun -np 88 pw.x -nk 11 -nd 1 < silicon.scf > out_files_silicon/7/8/silicon_bench_poolsize_8_n_procs_88_7.output

mpirun -np 96 pw.x -nk 12 -nd 1 < silicon.scf > out_files_silicon/7/8/silicon_bench_poolsize_8_n_procs_96_7.output

mpirun -np 104 pw.x -nk 13 -nd 1 < silicon.scf > out_files_silicon/7/8/silicon_bench_poolsize_8_n_procs_104_7.output

mpirun -np 112 pw.x -nk 14 -nd 1 < silicon.scf > out_files_silicon/7/8/silicon_bench_poolsize_8_n_procs_112_7.output

mpirun -np 120 pw.x -nk 15 -nd 1 < silicon.scf > out_files_silicon/7/8/silicon_bench_poolsize_8_n_procs_120_7.output

mpirun -np 128 pw.x -nk 16 -nd 1 < silicon.scf > out_files_silicon/7/8/silicon_bench_poolsize_8_n_procs_128_7.output

mpirun -np 136 pw.x -nk 17 -nd 1 < silicon.scf > out_files_silicon/7/8/silicon_bench_poolsize_8_n_procs_136_7.output

mpirun -np 144 pw.x -nk 18 -nd 1 < silicon.scf > out_files_silicon/7/8/silicon_bench_poolsize_8_n_procs_144_7.output

mpirun -np 152 pw.x -nk 19 -nd 1 < silicon.scf > out_files_silicon/7/8/silicon_bench_poolsize_8_n_procs_152_7.output

mpirun -np 160 pw.x -nk 20 -nd 1 < silicon.scf > out_files_silicon/7/8/silicon_bench_poolsize_8_n_procs_160_7.output

mpirun -np 168 pw.x -nk 21 -nd 1 < silicon.scf > out_files_silicon/7/8/silicon_bench_poolsize_8_n_procs_168_7.output

mpirun -np 176 pw.x -nk 22 -nd 1 < silicon.scf > out_files_silicon/7/8/silicon_bench_poolsize_8_n_procs_176_7.output

mpirun -np 184 pw.x -nk 23 -nd 1 < silicon.scf > out_files_silicon/7/8/silicon_bench_poolsize_8_n_procs_184_7.output

mpirun -np 192 pw.x -nk 24 -nd 1 < silicon.scf > out_files_silicon/7/8/silicon_bench_poolsize_8_n_procs_192_7.output

mpirun -np 96 pw.x -nk 6 -nd 1 < silicon.scf > out_files_silicon/7/16/silicon_bench_poolsize_16_n_procs_96_7.output

mpirun -np 112 pw.x -nk 7 -nd 1 < silicon.scf > out_files_silicon/7/16/silicon_bench_poolsize_16_n_procs_112_7.output

mpirun -np 128 pw.x -nk 8 -nd 1 < silicon.scf > out_files_silicon/7/16/silicon_bench_poolsize_16_n_procs_128_7.output

mpirun -np 144 pw.x -nk 9 -nd 1 < silicon.scf > out_files_silicon/7/16/silicon_bench_poolsize_16_n_procs_144_7.output

mpirun -np 160 pw.x -nk 10 -nd 1 < silicon.scf > out_files_silicon/7/16/silicon_bench_poolsize_16_n_procs_160_7.output

mpirun -np 176 pw.x -nk 11 -nd 1 < silicon.scf > out_files_silicon/7/16/silicon_bench_poolsize_16_n_procs_176_7.output

mpirun -np 192 pw.x -nk 12 -nd 1 < silicon.scf > out_files_silicon/7/16/silicon_bench_poolsize_16_n_procs_192_7.output

mpirun -np 88 pw.x -nk 44 -nd 1 < silicon.scf > out_files_silicon/8/2/silicon_bench_poolsize_2_n_procs_88_8.output

mpirun -np 96 pw.x -nk 48 -nd 1 < silicon.scf > out_files_silicon/8/2/silicon_bench_poolsize_2_n_procs_96_8.output

mpirun -np 104 pw.x -nk 52 -nd 1 < silicon.scf > out_files_silicon/8/2/silicon_bench_poolsize_2_n_procs_104_8.output

mpirun -np 112 pw.x -nk 56 -nd 1 < silicon.scf > out_files_silicon/8/2/silicon_bench_poolsize_2_n_procs_112_8.output

mpirun -np 120 pw.x -nk 60 -nd 1 < silicon.scf > out_files_silicon/8/2/silicon_bench_poolsize_2_n_procs_120_8.output

mpirun -np 128 pw.x -nk 64 -nd 1 < silicon.scf > out_files_silicon/8/2/silicon_bench_poolsize_2_n_procs_128_8.output

mpirun -np 136 pw.x -nk 68 -nd 1 < silicon.scf > out_files_silicon/8/2/silicon_bench_poolsize_2_n_procs_136_8.output

mpirun -np 144 pw.x -nk 72 -nd 1 < silicon.scf > out_files_silicon/8/2/silicon_bench_poolsize_2_n_procs_144_8.output

mpirun -np 152 pw.x -nk 76 -nd 1 < silicon.scf > out_files_silicon/8/2/silicon_bench_poolsize_2_n_procs_152_8.output

mpirun -np 160 pw.x -nk 80 -nd 1 < silicon.scf > out_files_silicon/8/2/silicon_bench_poolsize_2_n_procs_160_8.output

mpirun -np 168 pw.x -nk 84 -nd 1 < silicon.scf > out_files_silicon/8/2/silicon_bench_poolsize_2_n_procs_168_8.output

mpirun -np 176 pw.x -nk 88 -nd 1 < silicon.scf > out_files_silicon/8/2/silicon_bench_poolsize_2_n_procs_176_8.output

mpirun -np 184 pw.x -nk 92 -nd 1 < silicon.scf > out_files_silicon/8/2/silicon_bench_poolsize_2_n_procs_184_8.output

mpirun -np 192 pw.x -nk 96 -nd 1 < silicon.scf > out_files_silicon/8/2/silicon_bench_poolsize_2_n_procs_192_8.output

mpirun -np 88 pw.x -nk 11 -nd 1 < silicon.scf > out_files_silicon/8/8/silicon_bench_poolsize_8_n_procs_88_8.output

mpirun -np 96 pw.x -nk 12 -nd 1 < silicon.scf > out_files_silicon/8/8/silicon_bench_poolsize_8_n_procs_96_8.output

mpirun -np 104 pw.x -nk 13 -nd 1 < silicon.scf > out_files_silicon/8/8/silicon_bench_poolsize_8_n_procs_104_8.output

mpirun -np 112 pw.x -nk 14 -nd 1 < silicon.scf > out_files_silicon/8/8/silicon_bench_poolsize_8_n_procs_112_8.output

mpirun -np 120 pw.x -nk 15 -nd 1 < silicon.scf > out_files_silicon/8/8/silicon_bench_poolsize_8_n_procs_120_8.output

mpirun -np 128 pw.x -nk 16 -nd 1 < silicon.scf > out_files_silicon/8/8/silicon_bench_poolsize_8_n_procs_128_8.output

mpirun -np 136 pw.x -nk 17 -nd 1 < silicon.scf > out_files_silicon/8/8/silicon_bench_poolsize_8_n_procs_136_8.output

mpirun -np 144 pw.x -nk 18 -nd 1 < silicon.scf > out_files_silicon/8/8/silicon_bench_poolsize_8_n_procs_144_8.output

mpirun -np 152 pw.x -nk 19 -nd 1 < silicon.scf > out_files_silicon/8/8/silicon_bench_poolsize_8_n_procs_152_8.output

mpirun -np 160 pw.x -nk 20 -nd 1 < silicon.scf > out_files_silicon/8/8/silicon_bench_poolsize_8_n_procs_160_8.output

mpirun -np 168 pw.x -nk 21 -nd 1 < silicon.scf > out_files_silicon/8/8/silicon_bench_poolsize_8_n_procs_168_8.output

mpirun -np 176 pw.x -nk 22 -nd 1 < silicon.scf > out_files_silicon/8/8/silicon_bench_poolsize_8_n_procs_176_8.output

mpirun -np 184 pw.x -nk 23 -nd 1 < silicon.scf > out_files_silicon/8/8/silicon_bench_poolsize_8_n_procs_184_8.output

mpirun -np 192 pw.x -nk 24 -nd 1 < silicon.scf > out_files_silicon/8/8/silicon_bench_poolsize_8_n_procs_192_8.output

mpirun -np 96 pw.x -nk 6 -nd 1 < silicon.scf > out_files_silicon/8/16/silicon_bench_poolsize_16_n_procs_96_8.output

mpirun -np 112 pw.x -nk 7 -nd 1 < silicon.scf > out_files_silicon/8/16/silicon_bench_poolsize_16_n_procs_112_8.output

mpirun -np 128 pw.x -nk 8 -nd 1 < silicon.scf > out_files_silicon/8/16/silicon_bench_poolsize_16_n_procs_128_8.output

mpirun -np 144 pw.x -nk 9 -nd 1 < silicon.scf > out_files_silicon/8/16/silicon_bench_poolsize_16_n_procs_144_8.output

mpirun -np 160 pw.x -nk 10 -nd 1 < silicon.scf > out_files_silicon/8/16/silicon_bench_poolsize_16_n_procs_160_8.output

mpirun -np 176 pw.x -nk 11 -nd 1 < silicon.scf > out_files_silicon/8/16/silicon_bench_poolsize_16_n_procs_176_8.output

mpirun -np 192 pw.x -nk 12 -nd 1 < silicon.scf > out_files_silicon/8/16/silicon_bench_poolsize_16_n_procs_192_8.output

mpirun -np 88 pw.x -nk 44 -nd 1 < silicon.scf > out_files_silicon/9/2/silicon_bench_poolsize_2_n_procs_88_9.output

mpirun -np 96 pw.x -nk 48 -nd 1 < silicon.scf > out_files_silicon/9/2/silicon_bench_poolsize_2_n_procs_96_9.output

mpirun -np 104 pw.x -nk 52 -nd 1 < silicon.scf > out_files_silicon/9/2/silicon_bench_poolsize_2_n_procs_104_9.output

mpirun -np 112 pw.x -nk 56 -nd 1 < silicon.scf > out_files_silicon/9/2/silicon_bench_poolsize_2_n_procs_112_9.output

mpirun -np 120 pw.x -nk 60 -nd 1 < silicon.scf > out_files_silicon/9/2/silicon_bench_poolsize_2_n_procs_120_9.output

mpirun -np 128 pw.x -nk 64 -nd 1 < silicon.scf > out_files_silicon/9/2/silicon_bench_poolsize_2_n_procs_128_9.output

mpirun -np 136 pw.x -nk 68 -nd 1 < silicon.scf > out_files_silicon/9/2/silicon_bench_poolsize_2_n_procs_136_9.output

mpirun -np 144 pw.x -nk 72 -nd 1 < silicon.scf > out_files_silicon/9/2/silicon_bench_poolsize_2_n_procs_144_9.output

mpirun -np 152 pw.x -nk 76 -nd 1 < silicon.scf > out_files_silicon/9/2/silicon_bench_poolsize_2_n_procs_152_9.output

mpirun -np 160 pw.x -nk 80 -nd 1 < silicon.scf > out_files_silicon/9/2/silicon_bench_poolsize_2_n_procs_160_9.output

mpirun -np 168 pw.x -nk 84 -nd 1 < silicon.scf > out_files_silicon/9/2/silicon_bench_poolsize_2_n_procs_168_9.output

mpirun -np 176 pw.x -nk 88 -nd 1 < silicon.scf > out_files_silicon/9/2/silicon_bench_poolsize_2_n_procs_176_9.output

mpirun -np 184 pw.x -nk 92 -nd 1 < silicon.scf > out_files_silicon/9/2/silicon_bench_poolsize_2_n_procs_184_9.output

mpirun -np 192 pw.x -nk 96 -nd 1 < silicon.scf > out_files_silicon/9/2/silicon_bench_poolsize_2_n_procs_192_9.output

mpirun -np 88 pw.x -nk 11 -nd 1 < silicon.scf > out_files_silicon/9/8/silicon_bench_poolsize_8_n_procs_88_9.output

mpirun -np 96 pw.x -nk 12 -nd 1 < silicon.scf > out_files_silicon/9/8/silicon_bench_poolsize_8_n_procs_96_9.output

mpirun -np 104 pw.x -nk 13 -nd 1 < silicon.scf > out_files_silicon/9/8/silicon_bench_poolsize_8_n_procs_104_9.output

mpirun -np 112 pw.x -nk 14 -nd 1 < silicon.scf > out_files_silicon/9/8/silicon_bench_poolsize_8_n_procs_112_9.output

mpirun -np 120 pw.x -nk 15 -nd 1 < silicon.scf > out_files_silicon/9/8/silicon_bench_poolsize_8_n_procs_120_9.output

mpirun -np 128 pw.x -nk 16 -nd 1 < silicon.scf > out_files_silicon/9/8/silicon_bench_poolsize_8_n_procs_128_9.output

mpirun -np 136 pw.x -nk 17 -nd 1 < silicon.scf > out_files_silicon/9/8/silicon_bench_poolsize_8_n_procs_136_9.output

mpirun -np 144 pw.x -nk 18 -nd 1 < silicon.scf > out_files_silicon/9/8/silicon_bench_poolsize_8_n_procs_144_9.output

mpirun -np 152 pw.x -nk 19 -nd 1 < silicon.scf > out_files_silicon/9/8/silicon_bench_poolsize_8_n_procs_152_9.output

mpirun -np 160 pw.x -nk 20 -nd 1 < silicon.scf > out_files_silicon/9/8/silicon_bench_poolsize_8_n_procs_160_9.output

mpirun -np 168 pw.x -nk 21 -nd 1 < silicon.scf > out_files_silicon/9/8/silicon_bench_poolsize_8_n_procs_168_9.output

mpirun -np 176 pw.x -nk 22 -nd 1 < silicon.scf > out_files_silicon/9/8/silicon_bench_poolsize_8_n_procs_176_9.output

mpirun -np 184 pw.x -nk 23 -nd 1 < silicon.scf > out_files_silicon/9/8/silicon_bench_poolsize_8_n_procs_184_9.output

mpirun -np 192 pw.x -nk 24 -nd 1 < silicon.scf > out_files_silicon/9/8/silicon_bench_poolsize_8_n_procs_192_9.output

mpirun -np 96 pw.x -nk 6 -nd 1 < silicon.scf > out_files_silicon/9/16/silicon_bench_poolsize_16_n_procs_96_9.output

mpirun -np 112 pw.x -nk 7 -nd 1 < silicon.scf > out_files_silicon/9/16/silicon_bench_poolsize_16_n_procs_112_9.output

mpirun -np 128 pw.x -nk 8 -nd 1 < silicon.scf > out_files_silicon/9/16/silicon_bench_poolsize_16_n_procs_128_9.output

mpirun -np 144 pw.x -nk 9 -nd 1 < silicon.scf > out_files_silicon/9/16/silicon_bench_poolsize_16_n_procs_144_9.output

mpirun -np 160 pw.x -nk 10 -nd 1 < silicon.scf > out_files_silicon/9/16/silicon_bench_poolsize_16_n_procs_160_9.output

mpirun -np 176 pw.x -nk 11 -nd 1 < silicon.scf > out_files_silicon/9/16/silicon_bench_poolsize_16_n_procs_176_9.output

mpirun -np 192 pw.x -nk 12 -nd 1 < silicon.scf > out_files_silicon/9/16/silicon_bench_poolsize_16_n_procs_192_9.output
