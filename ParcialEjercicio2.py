import math

#Retorna la solucion de la funcion e^sen(x)-x-2 obtenida de la igualacion de las funciones f(x) y g(x)
def funcion(x):
	return (math.exp(math.sin(x))-x-2)


def metodoItera(puntoAprox, error):
	x_actual = puntoAprox
	x_anterior = 0
	cantiItera = 0
	while(abs(x_anterior - x_actual) >= error):
		print(x_actual)
		x_siguiente = x_actual - (funcion(x_actual)*((x_actual-x_anterior)/(funcion(x_actual)-funcion(x_anterior))))#Puede tener diviciones por 0		
		x_anterior = x_actual
		x_actual = x_siguiente
		cantiItera = cantiItera + 1
	return [round(x_actual, 7), cantiItera]


# main
print()
print("Despliege de operaciones")
solucion = metodoItera(-1, 0.0000001)
print()
error = 7
print("Solucion aproximada")
print("con un error de", error)
print(solucion)
print("Se nesesitaron")
print(solucion[1], "Operaciones")
