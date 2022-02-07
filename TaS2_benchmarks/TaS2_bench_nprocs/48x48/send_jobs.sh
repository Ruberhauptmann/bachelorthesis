#!/bin/bash

for num in $(seq 4 2 40)
do
    echo "$num"
    qsub -pe mpi $num -N TaS2_bench_nprocs_48x48_$num TaS2_bench_nprocs_48x48.sh $num
done
