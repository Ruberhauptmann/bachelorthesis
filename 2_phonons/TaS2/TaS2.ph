TaS2
&INPUTPH
    prefix = 'TaS2_phonons'
    outdir   = '/fastscratch/tsievers/QE_TMP_DIR/'

    fildyn   = '/fastscratch/tsievers/QE_TMP_DIR/TaS2_ph.dyn'
    fildyn   = '/fastscratch/tsievers/QE_TMP_DIR/TaS2_ph.dvscf'

    ldisp = .true.
    nq1 = 12
    nq2 = 12
    nq3 = 1

    tr2_ph = 1e-21
/
