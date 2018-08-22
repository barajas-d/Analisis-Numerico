def calcularCuadrado(x):
	return x*x

def sumas(n):
	total = 0
	cantiOperaciones = 0
	for i in range(0, n+1):
		cuadrado = calcularCuadrado(i)
		cantiOperaciones = cantiOperaciones + 2
		print(i,"^ 2", "=", cuadrado)
		print("Cantidad de operaciones actuales:", cantiOperaciones)
		total = total + cuadrado
	return total

#Main


print("Pruebas con numeros del 10 al 10 y pasos de 10")
for i in range(10, 100, 10):
	print("para n =", i)
	print("El total de la suma es:", sumas(i))
