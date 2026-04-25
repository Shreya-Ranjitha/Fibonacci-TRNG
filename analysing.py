import numpy as np
import math

data = []

with open("random_bits.txt") as f:
    for line in f:
        val = line.strip()
        if val in ['0', '1']:   # ignore x, z
            data.append(int(val))

data = np.array(data)

print("Total valid bits:", len(data))

# mean
mean = np.mean(data)
print("Mean:", mean)

# counts
zeros = np.sum(data == 0)
ones = np.sum(data == 1)

print("Zeros:", zeros)
print("Ones:", ones)

# entropy
p0 = zeros / len(data)
p1 = ones / len(data)

entropy = 0
for p in [p0, p1]:
    if p > 0:
        entropy -= p * math.log2(p)

print("Entropy:", entropy)

import matplotlib.pyplot as plt

plt.hist(data, bins=2)
plt.title("Bit Distribution")
plt.xlabel("Bit Value")
plt.ylabel("Frequency")
plt.show()