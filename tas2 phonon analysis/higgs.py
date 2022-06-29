#!/usr/bin/env python3

import elphmod
import numpy as np
import storylines

pw = elphmod.bravais.read_pwi('TaS2_sym.scf')
Pw = elphmod.bravais.read_pwi('TaS2_cdw.scf')

header, qpoints, dynmats, footer, amass = elphmod.ph.read_fildyn('TaS2_cdw.dyn')

#dynmats0 = elphmod.ph.read_fildyn('../ph/dyn5')[2]

#w2 = np.linalg.eigvalsh(dynmats0[0] * (elphmod.misc.Ry * 1e3) ** 2)

W2, U = np.linalg.eigh(dynmats[0] * (elphmod.misc.Ry * 1e3) ** 2)

for i in range(U.shape[1]):
    U[i] /= np.sqrt(amass[i // 3])

for nu in range(U.shape[1]):
    U[:, nu] /= np.linalg.norm(U[:, nu])

U = U.reshape((-1, 3, U.shape[-1])).real

a = elphmod.bravais.primitives(**Pw)

r = np.dot(pw['r'], a)
R = np.dot(Pw['r'], a)

print('Maximum displacement: %.2g%%'
    % (100 * np.linalg.norm(R - r, axis=1).max() / (np.linalg.norm(a[0]) / 3)))

nu_Higgs = np.argmax([abs(((R - r) * U[..., nu]).sum())
    for nu in range(U.shape[-1]) if nu != 79])

print('Higgs mode: %s, %g meV' % (nu_Higgs, np.sqrt(W2[nu_Higgs])))

#print('Ratio: (%g / %g)^2 = %g' % (elphmod.ph.sgnsqrt(W2[nu_Higgs]), elphmod.ph.sgnsqrt(w2[0]), W2[nu_Higgs] / w2[0]))

n = np.empty_like(R)

R1 = (r.T + (R - r).T * (5.0 + 0.3 / np.linalg.norm(R - r, axis=1))).T
R2 = R1 + 2 * U[..., nu_Higgs]

R = r + (R - r) * 5.0

#R1 = R
#R2 = R1 + 5 * U[..., 0]

Ta = np.array([X == 'Ta' for X in Pw['at']])

RTa = R[Ta]
RS = R[~Ta]

R1 = R1[Ta]
R2 = R2[Ta]

SC = [-1, 0, 1]

r = np.concatenate(tuple(r + n1 * a[0] + n2 * a[1]
    for n1 in SC for n2 in SC))

R1 = np.concatenate(tuple(R1 + n1 * a[0] + n2 * a[1]
    for n1 in SC for n2 in SC))

R2 = np.concatenate(tuple(R2 + n1 * a[0] + n2 * a[1]
    for n1 in SC for n2 in SC))

RTa = np.concatenate(tuple(RTa + n1 * a[0] + n2 * a[1]
    for n1 in SC for n2 in SC))

RS = np.concatenate(tuple(RS + n1 * a[0] + n2 * a[1]
    for n1 in SC for n2 in SC))

margin = 3.0

plot = storylines.Plot(
    style = 'NatCommun',

    xyaxes = False,

    height = 0,

    xmax = a[0, 0] + margin,
    xmin = a[1, 0] - margin,
    ymin = -margin,
    ymax = a[1, 1] + margin,
    )

plot.line(*list(zip(0 * a[0], a[0], a[0] + a[1], a[1], 0 * a[1]))[:2])

atom = dict(mark='ball', mark_size='1mm', only_marks=True, omit=False, cut=True)

plot.line(*list(zip(*r))[:2], ball_color='gray', **atom)
plot.line(*list(zip(*RTa))[:2], ball_color='black', **atom)
plot.line(*list(zip(*RS))[:2], ball_color='yellow', **atom)

for i in range(len(RTa)):
    if plot.xmin < RTa[i, 0] < plot.xmax and plot.ymin < RTa[i, 1] < plot.ymax:
        plot.code(r'\draw[draw=orange, ->, line width=0.3mm] (<x=%g>, <y=%g>) -- (<x=%g>, <y=%g>);' % (R1[i, 0], R1[i, 1], R2[i, 0], R2[i, 1]))

plot.save('higgs', pdf=True)

plot = storylines.Plot(
    style = 'NatCommun',

    xyaxes = False,

    height = 0,

    xmax = a[0, 0] + margin,
    xmin = a[1, 0] - margin,
    ymin = -margin,
    ymax = a[1, 1] + margin,
    )

plot.line(*list(zip(0 * a[0], a[0], a[0] + a[1], a[1], 0 * a[1]))[:2])

atom = dict(mark='ball', mark_size='1mm', only_marks=True, omit=False, cut=True)

plot.line(*list(zip(*r))[:2], ball_color='gray', **atom)
plot.line(*list(zip(*RTa))[:2], ball_color='black', **atom)
plot.line(*list(zip(*RS))[:2], ball_color='yellow', **atom)

#for i in range(len(RTa)):
#    if plot.xmin < RTa[i, 0] < plot.xmax and plot.ymin < RTa[i, 1] < plot.ymax:
#        plot.code(r'\draw[draw=red, ->] (<x=%g>, <y=%g>) -- (<x=%g>, <y=%g>);' % (R1[i, 0], R1[i, 1], R2[i, 0], R2[i, 1]))

plot.save('symmetric', pdf=True)