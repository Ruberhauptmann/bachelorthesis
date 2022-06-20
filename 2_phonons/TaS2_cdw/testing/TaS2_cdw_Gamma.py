from matplotlib import markers
import numpy as np
import matplotlib.pyplot as plt

def hartree_to_mev(energy_cm):
    return (1 / 8065.54) * energy_cm * 1000

data = np.genfromtxt('TaS2_Gamma_modes.txt').T
print(data)

data[1] = hartree_to_mev(data[1])

x = np.zeros(len(data[0]))

number_of_points = 5

plt.plot(x[:number_of_points], data[1][:number_of_points], marker='x', linestyle='')
plt.savefig('TaS2_cdw_Gamma.pdf', bbox_inches='tight')
