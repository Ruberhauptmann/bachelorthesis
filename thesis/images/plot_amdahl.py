from cProfile import label
import numpy as np
import matplotlib.pyplot as plt
plt.style.use('seaborn-colorblind')


def amdahl(s, N):
    return 1 / (s + (1-s) / N)

TEXTWIDTH = 5.62315

width = 0.75 * TEXTWIDTH
height = 0.75 * width

fig, ax1 = plt.subplots(figsize=(width, height))

N = np.linspace(1, 20)

for s in [0.01, 0.1, 0.2]:
    ax1.plot(N, amdahl(s, N), label="s = " + str(s))

ax1.set_xticks(np.arange(2, 21, 2))
ax1.set_yticks(np.arange(1, 17, 2))

ax1.set_xlabel("number of processors $N$")
ax1.set_ylabel("speedup $S$")

ax1.legend()
ax1.grid(0.3)

fig.savefig("amdahl.pdf", bbox_inches="tight")
