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
 
 ## ploting the covariance of 
 
 
 ```python
import numpy as np
from filterpy.kalman import predict
from filterpy.stats import plot_covariance_ellipse
import matplotlib.pyplot as plt
import time

def test_1():
    dt = 0.1
    x = np.array([10.0, 4.5])
    P = np.diag([500, 49])
    F = np.array([[1, dt], [0, 1]])

    # Q is the process noise
    fig = plt.figure(3)

    #plt.ion()

    for _ in range(40):
        #fig.clear()
        plot_covariance_ellipse(x, P, edgecolor='r')
        x, P = predict(x=x, P=P, F=F, Q=0)
        print('x =', x)
        plot_covariance_ellipse(x, P, edgecolor='k', ls='dashed')

        fig.canvas.draw()
        plt.show(block=False)
        time.sleep(0.1)

    plt.show()
 ```
