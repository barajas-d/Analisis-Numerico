def TDMASolve(a, b, c, d):
	nmax = len(d)#n in the numbers is rows

	# Modify the first-row coefficients
	c[0] /= b[0] #Division by zero risk.
	d[0] /= b[0]

	for i in range(1, nmax):
		ptemp = b[i] - (a[i] * c[i-1])
		c[i] /= ptemp
		d[i] = (d[i] - a[i] * d[i-1])/ptemp

	#Back Substitution
	x = [0 for i in range(nmax)]
	x[-1] = round(d[-1], 8)
	for i in range(-2,-nmax-1,-1):
		x[i] = round(d[i] - c[i] * x[i+1], 8)
	return x

def converge(x, a, b, c, d):
	for i in range(len(d)):
		if ( (a[i] * x[i - 1]) + (b[i] * x[i]) + (c[i] * x[i - 2]) != d[i]):
			return -1
	return 0



#Main

a = [0, 2, 6, 9]
b = [7, -8, 4, 8]
c = [5, 1, 3, 0]
d = [6, 5, 7, 8]
thomas = TDMASolve(a, b, c, d)
print("Al aplicar el algoritmo de solucion el sistema de ecuaciones:")
print("7a\t5b\t0c\t0d\t=\t6")
print("2a\t-8b\t1c\t0d\t=\t5")
print("0a\t6b\t4c\t3d\t=\t7")
print("0a\t0b\t9c\t8d\t=\t8")
print("Que se puede representa como una matriz tridiagonal")
print("Obtenemos como resultados:")

print("a =",thomas[0])
print("b =",thomas[1])
print("c =",thomas[2])
print("d =",thomas[3])
