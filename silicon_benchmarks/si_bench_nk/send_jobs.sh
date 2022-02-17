#!/bin/bash

for num in $(seq 8 8 40)
do
    echo "$num"
    sed "s/prefix='silicon',/prefix='silicon_bench_nk_$num',/" in_files/template.scf > in_files/si_bench_$num.scf
    qsub -pe mpi $num -N si_bench_nk_$num silicon_bench_nk.sh $num
done
