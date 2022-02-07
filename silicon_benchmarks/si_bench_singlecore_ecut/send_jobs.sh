#!/bin/bash

input_file=in_files/template.scf

rm in_files/ec_*.scf

for num in $(seq 14 3 59)
do
    echo "$num"
    sed "s/ecutwfc = 50.0,/ecutwfc = $num,/" $input_file > "in_files/ec_$num.scf"
    sed -i "s/prefix='silicon',/prefix='silicon_bench_singlecore_ecut_$num',/" "in_files/ec_$num.scf"
    qsub -N si_bench_singlecore_ec_$num  ec_convergence.sh $num
done
