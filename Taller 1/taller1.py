from Ejercicio_1a import *
from Ejercicio_5 import *


#----------------------------------------------------------------------------------------------------
#EJERCICIO_1a
print("\nEJERCICIO 1-a\n")
redondeo = 8
x = -2
#horner
polinomio = [2, 0, -3, 3, -4]
resultado = horner(x, polinomio, redondeo)
derivada_horner = horner_derivada(x, polinomio, redondeo)
print("Evaluacion con horner al polinomio", redondeo, "cifras significativas")
print("\tResultado:", resultado[0])
print("\tcantidad operaciones:", resultado[1])
print("\nEvaluacion con horner a la derivada", redondeo, "cifras significativas")
print("\tResultado", derivada_horner[0])
print("\tcantidad operaciones:", derivada_horner[1])


#--------------------------------------------------------------------------------------------------
print("\nEJERCICIO 5\n")
#Main Ejercicio_5
velocidad = 4 #metros/segundos
error_velocidad = 0.1
tiempo = 5 #segundos
error_tiempo = 0.1

distancia_maxima = distancia(velocidad + error_velocidad, tiempo + error_tiempo)
distancia_minima = distancia(velocidad - error_velocidad, tiempo - error_tiempo)
distancia_promedio = round((distancia_maxima + distancia_minima) / 2, 8)
print("Para una velocidad de ", velocidad, "+-", error_velocidad, "m/s y un tiempo de", tiempo, "+-:", error_tiempo, "s")
print("\tDistancia promedio:", distancia_promedio, "m")
print("\tError absoluto:", error_absoluto(distancia_promedio, distancia_maxima))
print("\tError relativo:", error_relativo(velocidad*tiempo, error_absoluto(distancia_promedio, distancia_maxima))*100, "%")



#--------------------------------------------------------------------------------------------------
