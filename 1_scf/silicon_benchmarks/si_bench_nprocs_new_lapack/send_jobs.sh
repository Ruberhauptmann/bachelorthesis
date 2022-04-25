#!/bin/bash

for num in $(seq 2 2 40)
do
    echo "$num"
    sed "s/prefix='silicon',/prefix='silicon_bench_nprocs_$num',/" in_files/template.scf > in_files/si_bench_$num.scf
    qsub -pe mpi $num -N si_bench_nprocs_$num silicon_bench_nprocs.sh $num
done
