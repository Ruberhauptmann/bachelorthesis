#!/bin/bash

for num in $(seq 4 2 40)
do
    echo "$num"
    qsub -pe mpi $num -N TaS2_bench_nprocs_12x12_$num TaS2_bench_nprocs_12x12.sh $num
done
