TaS2
&INPUTPH
    prefix   = 'TaS2_ph_bench_poolsize_2_n_procs_32_0',
    outdir   = '/fastscratch/tsievers/QE_TMP_DIR/'

    fildyn   = '/fastscratch/tsievers/QE_TMP_DIR/TaS2_ph_bench_poolsize_2_n_procs_32_0.dyn'
    fildvscf   = 'TaS2_ph_bench_poolsize_2_n_procs_32_0.dvscf'

    ldisp = .true.
    nq1 = 12
    nq2 = 12
    nq3 = 1

    tr2_ph = 1e-21
/