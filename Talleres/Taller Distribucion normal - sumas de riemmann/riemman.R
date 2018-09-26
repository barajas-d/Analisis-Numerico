calcular = function(x,a,b){
  v = (1/(a*sqrt(2*pi)))*(exp((-1/2)*(((x-b)/a)^2)))
  return(v)
} 

derecha = function(valor, precision){
  final = 0
  inicio = (-3*precision)+1
  valor = valor * precision
  for (i in inicio:valor) {
    dato = i/precision
    calculo = calcular(dato, 1, 0)*(1/precision)
    final = final + calculo
  }
  return (final)
}

izquierda = function(valor, precision){
  final = 0
  inicio = (-3*precision)
  valor = (valor*precision)-1
  for (i in inicio:valor) {
    dato = i/precision
    calculo = calcular(dato, 1, 0)*(1/precision)
    final = final + calculo
  }
  return (final)
}


centro = function(valor, precision){
  final = 0
  inicio = (-3*precision)
  valor = (valor*precision)-1
  for (i in inicio:valor) {
    dato = i/precision
    calculo = calcular(dato+(1/(2*precision)), 1, 0)*(1/precision)
    final = final + calculo
  }
  return (final)
}


print(derecha(0, 100))
print(izquierda(0, 100))
print(centro(0, 100))

a = derecha(0, 100)
b = izquierda(0, 100)
c = centro(0, 100)

print((a+b+c)/3)
