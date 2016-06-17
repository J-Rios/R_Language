#Cargamos la imagen
imagen <<- readJPEG("mapa.jpg")

#Dibujamos un punto del color, radio y centro dados
drawPoint <- function(centerX, centerY, radius, colR, colG, colB) {
  
  for (x in seq(-radius,radius))
  {
    for (y in seq(-radius,radius))
    {
      xt <- x+centerX
      yt <- y+centerY
      if ((sqrt(x^2+y^2)<=radius) && (xt > 0) && (xt <= dim(imagen)[1]) && (yt > 0) && (yt <= dim(imagen)[2]))
      {
        imagen[xt, yt,1] <<- colR 
        imagen[xt, yt,2] <<- colG  
        imagen[xt, yt,3] <<- colB  
      }
    }
  }
}  

#Dibujamos una zona urbana del color y radio  dados
addCity<- function(lat,long, radius, colR, colG, colB) {
  
  drawPoint(lat,long, radius,colR/255, colG/255, colB/255);
}

#Pintamos el mapa
drawImage<- function()
{  
  plot.new()
  grid::grid.raster(imagen);  
}