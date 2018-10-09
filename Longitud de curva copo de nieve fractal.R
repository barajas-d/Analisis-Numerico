LongiFractal = function(perimetro, iteraciones){
  iteraciones = iteraciones + 1
  valores = c(1:iteraciones)
  for (i in valores) {
    if(i == 1){
      valores[i] = perimetro
    }
    else{
      valores[i] = (4/3)*valores[i-1]
    }
  }
    return (valores)
}

iteraciones = 2460
perimetro = 9
valores = LongiFractal(perimetro, iteraciones)
print(valores[iteraciones])
