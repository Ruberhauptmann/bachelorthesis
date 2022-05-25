TaS2
&INPUTPH
    prefix = 'TaS2_phonons'
    outdir   = '/fastscratch/tsievers/TaS2_phonons/'
    max_seconds = 170000

    fildyn   = 'TaS2_ph.dyn'
    fildvscf  = 'TaS2_ph.dvscf'

    !ldisp = .true.

    tr2_ph = 1e-21
/
0.000   0.000   0.000 !Gamma
