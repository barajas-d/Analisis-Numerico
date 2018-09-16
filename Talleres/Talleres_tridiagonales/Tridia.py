import numpy.diagonal as np


def tridiagonales(a, b, c, d, cifras):
    c[0] = c[0]/b[0]
    d[0] = d[0]/b[0]
    for i in range(1, len(c)):
        c[i] = (c[i])/(b[i]-(c[i-1]*a[i-1]))
    for i in range(1, len(d)):
        d[i] = (d[i]-(d[i-1]*a[i-1]))/(b[i]-(c[i-1]*a[i-1]))


    #end for
    x = []
    for i in range(0, len(d)):
        x.append(0)
    #end for

    x[len(d)-1] = d[len(d)-1]
    print(len(d)-1)
    for i in range(len(d)-2, -1, -1):
        x[i] = (d[i] - (c[i]*x[i+1]))
        x[i] = round(x[i], cifras)
    #end for
    return x

def tridiag(a, b, c, k1=-1, k2=0, k3=1):
    return np.diag(a, k1) + np.diag(b, k2) + np.diag(c, k3)

a = [-4, 5]
b = [2, -5, 2]
c = [3, 4]
d = [1, -11, 9]


a = [1, 1]; b = [2, 2, 2]; c = [3, 3]
A = tridiag(a, b, c)

#cifras = 8
#x = tridiagonales(a, b, c, d, cifras)
#for i in range(0, len(x)):
#    print("X", i, "=", x[i])
