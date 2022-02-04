#!/bin/bash

input_file=in_files/template.scf
old="ecutwfc = 50.0,"
new="ecutwfc = "

rm in_files/ec_*.scf

for num in $(seq 14 3 59)
do
    echo "$num"
    sed "s/$old/$new$num,/" $input_file > "in_files/ec_$num.scf"
    qsub -N si_bench_singlecore_ec_$num  ec_convergence.sh $num
done
