graficar<-function(inicio, fin){
  x <- seq(inicio-3,fin+pi,0.01)
  plot(x,sin(x),type="l",bty="L",xlab="X",ylab="Y")
  x <- seq(inicio,fin,0.01)
  points(x,sin(x),type="o",col="skyblue")
  #l <- length(x.shade)
  
  #x.shade <- seq(intervalo[1],intervalo[2],0.01)
  #polygon(c(x.shade,rev(x.shade)),c(seno(x.shade),coseno(rev(x.shade))),col="blue")
}

funcion<-function(x){return(sin(x))}

obtenerDeltaX<-function(intervalo, particiones){
  return((intervalo[2]-intervalo[1])/particiones)#especificar cifras
}
obtenerDeltaY<-function(inicial, final){
  return(funcion(final)-funcion(inicial))
}
Xi<-function(intervalo, i, deltaX){
  return(intervalo[1]+i*deltaX)#especificar cifras
}
calcularLongitudSegmento<-function(deltaX,deltaY){
  return(sqrt((deltaX^2)+(deltaY^2)))
}
calcularLongitudDeCurva<-function(intervalo, particiones){
  contadorLongitud<-0.0000
  deltaX<-obtenerDeltaX(intervalo, particiones)
  i<-0.00000
  while(i<particiones){
    xi<-Xi(intervalo, i, deltaX)
    #cat("xi ",xi,"\n")
    
    xj<-xi+deltaX
    #cat("xj ",xj,"\n")
    
    deltaY<-obtenerDeltaY(xi,xj)
    contadorLongitud<-contadorLongitud+calcularLongitudSegmento(deltaX,deltaY)
    #print(contadorLongitud)
    i=i+1
  }
  return(contadorLongitud)
}

intervalo<-c(0,pi/4)
particiones<-999
resultado<-calcularLongitudDeCurva(intervalo, particiones)
graficar(0, pi/4)
print(resultado)


#valorReal<-(integrate(sin,upper = pi/4,lower = 0)$value)*2




