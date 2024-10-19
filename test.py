import numpy as np
import matplotlib.pyplot as plt

list_x = np.linspace(0,10,100)
list_y = []

for x in list_x:
    list_y.append(10-x)

plt.plot(list_x, list_y)
plt.show()