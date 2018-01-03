import numpy as np
from filterpy.kalman import predict
from filterpy.stats import plot_covariance_ellipse
import matplotlib.pyplot as plt
import time


def example():
    dt = 0.1
    x = np.array([10.0, 4.5])
    P = np.diag([500, 49])
    F = np.array([[1, dt], [0, 1]])

    # Q is the process noise

    fig = plt.figure()

    for _ in range(40): 
        # if the history should be deleted uncomment
        #fig.clear()
        plot_covariance_ellipse(x, P, edgecolor='r')
        x, P = predict(x=x, P=P, F=F, Q=0)
        print('x =', x)
        plot_covariance_ellipse(x, P, edgecolor='k', ls='dashed')

        fig.canvas.draw()
        plt.show(block=False)
        time.sleep(0.1)

    plt.show()
    
    
example()
