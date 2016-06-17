
# Limpiamos el entorno de datos
rm(list = ls());

# Cargamos las librerias a utilizar
library(XLConnect)
library(jpeg)
source("libreriaPintar.R")

MAX_RADIUS <- 10

# Cargamos los datos
wk = loadWorkbook("Paises.xlsx")
paisesC= readWorksheet(wk, sheet="hoja1")

# Definiciones de metrica
metrica <- function(Eco,Peo,Gov,Mob,Env,Liv)
{
  #return(mean(c(Eco,Peo,Gov,Mob,Env,Liv)));
  return(sd(c(Eco,Peo,Gov,Mob,Env,Liv)));
}

# Determinamos el numero de paises y creamos la estructura de datos
sizeData = dim(paisesC)[1]
valorZonaUrbana <- data.frame(Pais = character(sizeData), Metrica = numeric(sizeData), lat = numeric(sizeData),long = numeric(sizeData),Rojo = numeric(sizeData),Verde = numeric(sizeData),Azul = numeric(sizeData),stringsAsFactors = FALSE)

# Iteramos sobre todos las ciudades para evaluar la metrica
for (i in seq(1,dim(paisesC)[1]))
{
  valorZonaUrbana[i,1] <- paisesC[i,1];
  valorZonaUrbana[i,"long"] <- paisesC[i,8];
  valorZonaUrbana[i,"lat"] <- paisesC[i,9];
  valorZonaUrbana[i,"Metrica"] <- metrica(paisesC[i,2],paisesC[i,3],paisesC[i,4],paisesC[i,5],paisesC[i,6],paisesC[i,7]);
}

# Ordenamos por valor del ranking
valorZonaUrbana <- valorZonaUrbana[order(valorZonaUrbana[,2],decreasing = TRUE),]

# Determinamos el valor máximo de la métrica para normalizar entre 0 y 1
valorMaximo <- max(valorZonaUrbana[,"Metrica"]);
for (i in seq(1,dim(paisesC)[1]))
{
  valorZonaUrbana[i,"Metrica"] <- as.numeric(valorZonaUrbana[i,"Metrica"] / valorMaximo);
  valorZonaUrbana[i,"Rojo"] <- 255*valorZonaUrbana[i,"Metrica"]
  valorZonaUrbana[i,"Verde"] <- 0
  valorZonaUrbana[i,"Azul"] <- 0
  
  addCity(valorZonaUrbana[i,"lat"],valorZonaUrbana[i,"long"],MAX_RADIUS*valorZonaUrbana[i,"Metrica"],valorZonaUrbana[i,"Rojo"],valorZonaUrbana[i,"Verde"],valorZonaUrbana[i,"Azul"]);
}
drawImage()