#!/bin/bash

for num in $(seq 4 2 40)
do
    echo "$num"
    sed "s/prefix = 'TaS2'/prefix='TaS2_bench_nprocs_$num'/" in_files/template.scf > in_files/TaS2_bench_$num.scf
    qsub -pe mpi $num -N TaS2_bench_nprocs_12x12_$num TaS2_bench_nprocs_12x12.sh $num
done
