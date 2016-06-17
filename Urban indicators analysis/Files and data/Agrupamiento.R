
# Limpiamos el entorno de datos
rm(list = ls());

# Cargamos las librerias a utilizar
library(XLConnect)
library(jpeg)
source("libreriaPintar.R")

# Cargamos los datos
wk = loadWorkbook("Paises.xlsx")
paisesC= readWorksheet(wk, sheet="hoja1")

# Normalizamos los datos
misDatos <-paisesC[,seq(2,7)]
misDatos <- scale(misDatos) 

# Ward Hierarchical Clustering
# Generamos la matriz de distancias
d <- dist(misDatos, method = "euclidean") 

# Realizamos el algoritmo de agrupamiento
fit <- hclust(d, method="ward") 

# Dibujamos el dendograma
k=10
plot(fit)
rect.hclust(fit, k, border="red")

# Tras ver el dendograma, decidimos cuantos grupos queremos
groups <- cutree(fit, k) # cut tree into 10 clusters

# Una paleta tiene 1024 colores, escalamos para que esten lo mas separados posible

for (i in seq(1,dim(paisesC)[1]))
{
  color <- col2rgb(1024/k*groups[i])
  
  addCity(paisesC[i,9],paisesC[i,8],5,color[1],color[2],color[3])
}

drawImage()
