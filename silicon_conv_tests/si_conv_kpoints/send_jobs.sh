#!/bin/bash

input_file=in_files/template.scf
old="8 8 8 0 0 0"

for num in $(seq 4 2 50)
do
    echo "$num"
    sed "s/$old/$num $num $num 0 0 0/" $input_file > "in_files/si_conv_kpoints_$num.scf"
    sed -i "s/prefix='silicon',/prefix='silicon_conv_kpoints_$num',/" in_files/si_conv_kpoints_$num.scf
    qsub -N si_conv_kpoints_$num kp_convergence.sh $num
done
