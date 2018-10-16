funcion <- function(x){
  return (x^2);
}


derivada <- function(x, h){
  return((funcion(x+h)-funcion(x))/h);
}

print(derivada(6, 0.1));

#para X^2
x <- c(0, 1/4, 3/4, 1)
y <- c(exp(0^2), exp((1/4)^2), exp((3/4)^2), exp(1^2))

trapecio <- function(x1, y1, x2, y2){
   h = x2-x1
   area = (h/2)*((y1+y2))
   return(area)
}


integral <- function(x, y){
  i1 = trapecio(x[1], y[1], x[4], y[4])
  i2 = trapecio(x[1], y[1], x[2], y[2]) + trapecio(x[2], y[2], x[4], y[4])
  i3 = trapecio(x[1], y[1], x[2], y[2]) + trapecio(x[2], y[2], x[3], y[3]) + trapecio(x[3], y[3], x[4], y[4])

  i21 = ((4/3*i2)-(1/3*i1))
  i22 = ((4/3*i3)-(1/3*i2))

  final = ((16/15*i22)-(1/15*i21))
  
  return (final)
}



print(integral(x, y))

print(y[3])
print(trapecio(x[1], y[1], x[4], y[4]))
print(trapecio(x[1], y[1], x[2], y[2]) + trapecio(x[2], y[2], x[4], y[4]))
print(trapecio(x[1], y[1], x[2], y[2]) + trapecio(x[2], y[2], x[3], y[3]) + trapecio(x[3], y[3], x[4], y[4]))
