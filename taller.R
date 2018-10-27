
#install.packages("pracma")
#library(pracma)


metodoEuler <- function(f, h, xi, yi, xf){
  N = (xf - xi) / h
  x = y = numeric(N+1)
  x[1] = xi; 
  y[1] = yi;
  i = 1
  while (i <= N)
  {
    x[i+1] = x[i]+h
    y[i+1] = y[i]+(h*f(x[i],y[i]))
    i = i+1
  }
  return (data.frame(X = x, Y = y))
}

#TALLER
###PUNTO 1
h = 0.5; xi = 0; yi = 180; xf = 200;
Te = 200; m = 1; c = 100;

f <- function(x, y) {(-(5.6*10^(-8)*(1)*(6)*(y^4-Te^4)))/(m*c)}

e1 = metodoEuler(f,h,xi,yi,xf)

e1[nrow(e1),]

xx <- c(0, 200); yy <- c(0, 200)
vectorfield(f, xx, yy, scale = 1)
for (xs in seq(0, 180, by = 10)) 
{
  sol <- pracma::rk4(f, 0, 200, xs, 10)
  lines(sol$x, sol$y, col="purple")
}


###PUNTO 3 Falta Error comparada con solucion exacta

funcionSolucion <- function(x){
  return (exp(x)*(x^2*exp(-x)+x*exp(-x)+1))#((exp(x))*(((x^2)*(exp^(-1*x)))+((x)*(exp^(-1*x)))+(1)))
}


f <- function(x, y) {1-(x^2)+x+y}
e1 = metodoEuler(f, 0.1, 0, 1, 10)
par(mfrow=c(1,2))
xx <- c(-3, 3); yy <- c(-1, 1)
vectorfield(f, xx, yy, scale = 0.01)
for (xs in seq(-1, 1, by = 0.25)){
  sol <- pracma::rk4(f, -1, 1, xs, 100)
  lines(sol$x, sol$y, col="purple")
}


x <- seq(1, 20, by=1)
y <- seq(1, 20, by=1)
cat("\tx\ty\n")
for (i in 1:20){
  cat("x = ", e1[i, 1], "   \tEuler = ", e1[i, 2], "   \tSolucion Exacta = ",funcionSolucion(e1[i, 1]), "   \tError Truncamiento = ",funcionSolucion(e1[i, 1])-e1[i, 2],"\n")
  #cat("", e1[i, 1], "|||", e1[i, 2], "|||",funcionSolucion(e1[i, 1]), "|||",funcionSolucion(e1[i, 1])-e1[i, 2],"||--")
  x[i] = e1[i, 1]
  y[i] = e1[i, 2]
}
plot(x, y, type="l",asp=1,col="purple", main = "Punto 3")





###PUNTO 4 

funcionSolucion <- function(x){
  return (exp(x)*(x^2*exp(-x)+x*exp(-x)+1))#((exp(x))*(((x^2)*(exp^(-1*x)))+((x)*(exp^(-1*x)))+(1)))
}


f <- function(x, y) {1-(x^2)+x+y}
e1 = metodoEuler(f, 0.1, 0, 1, 10)
par(mfrow=c(1,2))
xx <- c(-3, 3); yy <- c(-1, 1)
vectorfield(f, xx, yy, scale = 0.01)
for (xs in seq(-1, 1, by = 0.25)){
  sol <- pracma::rk4(f, -1, 1, xs, 100)
  lines(sol$x, sol$y, col="purple")
}


f <- function(x, y) {1-(x^2)+x+y}
m <- 20
h <- 0.1
#defino el primer punto en X y Y, ademas asigno memoria a las listas
x <- seq(0, 0+m, by = 1)
y <- seq(1, 1+m, by = 1)

for (i in 1:m){
  k1 = h*f(x[i], y[i])
  k2 = h*f(x[i] + h, y[i]+k1)
  y[i+1] = y[i]+((1/2)*(k1+k2))
  x[i+1] = x[i] + h
}

for (i in 1:m){
  cat("\tx = ", x[i], "\ty = ", y[i], "\n")
}

par(mfrow=c(1,1))
plot(x, y, type="l",asp=1,col="purple",main= "Punto 4")
for (i in 1:20){
  cat("x = ", x[i], "   \tEuler = ", y[i], "   \tSolucion Exacta = ",funcionSolucion(x[i]), "   \tError Truncamiento = ",funcionSolucion(x[i])-y[i],"\n")
  #cat("||||", x[i], "||||", y[i], "||||",funcionSolucion(x[i]), "||||",funcionSolucion(x[i])-y[i],"\n")
}





###PUNTO 7 (Tener encuenta recargar la libreria PhaseR para evitar errores de sobreescritura de funciones con pracma)


funcionSolucion <- function(x){
  return (exp(x)*(x^2*exp(-x)+x*exp(-x)+1))#((exp(x))*(((x^2)*(exp^(-1*x)))+((x)*(exp^(-1*x)))+(1)))
}


par(mfrow=c(1,3))

r2<- rk3(expression(x+y+1-x^2), 0, 0.9, 1, 0.1)
r<- rk4(expression(x+y+1-x^2), 0, 0.9, 1, 0.1)

f <- function(x, y) {1-(x^2)+x+y}
e1 = metodoEuler(f, 0.1, 0, 1, 0.9)
xx <- c(-3, 3); yy <- c(-1, 1)
vectorfield(f, xx, yy, scale = 0.01)
for (xs in seq(-1, 1, by = 0.25)){
  sol <- pracma::rk4(f, -1, 1, xs, 100)
  lines(sol$x, sol$y, col="purple")
}


print("comparacion de resulados Euler, Rk3 ,Rk4 y exacta(obtenida al solucionar la ecuacion)")
for(i in 1:10){
  k3 = r2[[1]]
  k4 = r[[1]] 
  cat("x =  ", e1[i,1], "\tEuler = ", e1[i,2],"     \tRk3 = ", k3[i], "       \tRk4 = ", k4[i],"       \tExacta = ",funcionSolucion(e1[i,1]), "\n")
  #cat(e1[i,1], "|||", e1[i,2],"|||", k3[i], "|||", k4[i],"|||",funcionSolucion(e1[i,1]), "||--")
}



