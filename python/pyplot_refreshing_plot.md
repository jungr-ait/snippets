# Refreshing plot in Pyplot


The following snipped allows to see the progress of data evolution live. 

```python
import matplotlib.pyplot as plt
import time

fig = plt.figure(4)
xs = []
ys = []

for i in range(40):
    fig.clear()
    xs.append(i*0.5)
    ys.append(i)
    plt.plot(xs,ys)
    fig.canvas.draw()
    plt.show(block=False)
    time.sleep(0.1)

plt.show()
    
 ```
