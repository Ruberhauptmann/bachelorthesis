from cProfile import label
from turtle import color
import numpy as np
import matplotlib.pyplot as plt
from pyparsing import col
plt.style.use('seaborn-colorblind')

dos_cdw = np.genfromtxt('dos_3x3.txt').T
dos_sym = np.genfromtxt('dos.txt').T

fig, ax = plt.subplots()
ax.plot(dos_sym[1], dos_sym[0], label='SYM')
ax.fill_betweenx(dos_cdw[0], 0, dos_cdw[1], color='darkorange', label='CDW')

ax.set_xlim(0)
ax.set_ylim([None, 1])
ax.set_xticks([], [])

ax.set_xlabel('DOS (arb. units)')
ax.set_ylabel('Energy (eV)')

ax.legend()

plt.savefig('tas2_dos.pdf')

