import numpy as np
import matplotlib.pyplot as plt
import math

list_x = np.linspace(0,10,100)
list_y = []
new_list_x = [] 

for x in list_x:
    list_y.append(10-x)

plt.plot(list_x, list_y)
plt.show()

for x in list_x:
    new_x = math.sqrt(x)
    new_list_x.append(new_x)    

plt.plot(new_list_x, list_y)
plt.show()