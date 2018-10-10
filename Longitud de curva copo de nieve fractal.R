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



x = c(-2, 0, 2, 3, 4, 6, 7, 5, 8, 9, 10, 13, 11, 12, 14, 15, 16, 18, 20)
y = c(1, 1, 1, 3, 1, 1, 3, 4.5, 5, 7, 5, 4.5, 3, 1, 1, 3, 1, 1, 1)
plot(x,y,type="l",bty="L",xlab="X",ylab="Y")
points(x,y,type="o",col="Red")









