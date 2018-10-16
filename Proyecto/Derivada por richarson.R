funcion <- function(x){
  return (x^2);
}


derivada <- function(x, h){
  return((funcion(x+h)-funcion(x))/h);
}

print(derivada(6, 0.1));
