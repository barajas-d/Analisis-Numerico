import math

def funcionG(x):
	#return round(3 / (x - 4), 8)
	#return round(math.sqrt(10/(x + 4)), 8)
	return round(((1 - math.exp(x)) / 5), 8)
	#return round((5*x - math.exp(x) + 1), 8)

def puntoFijo(intervalo, x0, tolerancia):
	e = 1
	while(e >= tolerancia):
		x1 = funcionG(x0)
		e = abs(x1-x0)
		x0 = x1
		print(x1)
	return [x1, e]
	
