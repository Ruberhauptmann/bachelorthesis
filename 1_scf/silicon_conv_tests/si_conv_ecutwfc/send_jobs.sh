#!/bin/bash

input_file=in_files/template.scf
old="ecutwfc = 50.0,"
new="ecutwfc = "

for num in $(seq 14 3 59)
do
    echo "$num"
    sed "s/$old/$new$num,/" $input_file > "in_files/si_conv_ecutwfc_$num.scf"
    sed -i "s/prefix='silicon',/prefix='silicon_conv_ecut_$num',/" "in_files/si_conv_ecutwfc_$num.scf"
    qsub -N si_conv_ecutwfc_$num  ec_convergence.sh $num
done
