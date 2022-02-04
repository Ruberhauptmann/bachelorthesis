#!/bin/bash

input_file=in_files/template.scf
old="8 8 8 0 0 0"

rm in_files/kp_*.scf

for num in $(seq 4 2 50)
do
    echo "$num"
    sed "s/$old/$num $num $num 0 0 0/" $input_file > "in_files/kp_$num.scf"
    qsub -N $num_si_kp_$num kp_convergence.sh $num
done
