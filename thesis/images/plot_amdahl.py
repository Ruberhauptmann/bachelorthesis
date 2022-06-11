from cProfile import label
import numpy as np
import matplotlib.pyplot as plt
plt.style.use('seaborn-colorblind')

def amdahl(s, N):
    return 1 / (s + (1-s) / N)

N = np.linspace(1, 20)

for s in [0.01, 0.1, 0.2]:
    plt.plot(N, amdahl(s, N), label="s = " + str(s))

plt.xticks(np.arange(2, 21, 2))
plt.yticks(np.arange(1, 17, 2))

plt.xlabel("number of processors")
plt.ylabel("speedup")

plt.legend()

plt.savefig("amdahl.pdf", bbox_inches="tight")
