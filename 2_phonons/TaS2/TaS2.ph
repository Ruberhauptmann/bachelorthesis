TaS2
&INPUTPH
    prefix = 'TaS2_phonons'
    outdir   = '/fastscratch/tsievers/TaS2_phonons/'
    max_seconds = 170000

    fildyn   = '/fastscratch/tsievers/TaS2_phonons/TaS2_ph.dyn'
    fildyn   = '/fastscratch/tsievers/TaS2_phonons/TaS2_ph.dvscf'

    ldisp = .true.
    nq1 = 12
    nq2 = 12
    nq3 = 1

    tr2_ph = 1e-21
/
