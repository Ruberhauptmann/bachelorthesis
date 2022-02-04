#!/bin/bash

for num in $(seq 4 2 40)
do
    echo "$num"
    qsub -pe mpi $num -N si_bench_nprocs_$num silicon_bench_nprocs.sh $num
done
