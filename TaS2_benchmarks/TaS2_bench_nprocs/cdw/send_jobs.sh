#!/bin/bash

for num in $(seq 40 2 41)
do
    echo "$num"
    sed "s/prefix = 'TaS2'/prefix='TaS2_cdw_bench_nprocs_$num'/" in_files/template.scf > in_files/TaS2_bench_$num.scf
    qsub -pe mpi $num -N TaS2_cdw_bench_nprocs_$num TaS2_cdw_bench_nprocs.sh $num
done
