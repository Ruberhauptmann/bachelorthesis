#!/bin/bash

input_file=in_files/template.scf
old="8 8 8 0 0 0"

rm in_files/kp_*.scf

for num in $(seq 4 2 50)
do
    echo "$num"
    sed "s/8 8 8 0 0 0/$num $num $num 0 0 0/" $input_file > "in_files/kp_$num.scf"
    sed -i "s/prefix='silicon',/prefix='silicon_bench_singlecore_kpoints_maxecut_$num',/" "in_files/kp_$num.scf"
    qsub -N si_bench_singlecore_kp__max_ecut_$num kp_convergence.sh $num
done
