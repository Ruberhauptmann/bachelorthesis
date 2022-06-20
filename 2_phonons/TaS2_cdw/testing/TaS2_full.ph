TaS2
&INPUTPH
    prefix = 'TaS2_phonons'
    outdir   = '/fastscratch/tsievers/TaS2_phonons/'
    max_seconds = 170000

    fildyn   = 'TaS2_ph.dyn'
    fildvscf  = 'TaS2_ph.dvscf'

    ldisp = .true.
    nq1 = 12
    nq2 = 12
    nq3 = 1

    tr2_ph = 1e-21
/
