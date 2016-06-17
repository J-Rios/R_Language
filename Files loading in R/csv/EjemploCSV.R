#-----------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------
#Asignatura de Ciudades Inteligentes. Máster en Sistemas Electrónicos para Entornos Inteligentes.
#-----------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------

#Cargamos los datos del fichero csv HDI, tiendo en cuenta que:
# Tenemos cabecera en los datos -> head=TRUE
# El separador entre valores es -> ;
# El separador de decimales es -> ,
# Las cadenas vacías se representan por ""

misDatos1 <- read.csv("HDI.csv",head=TRUE,sep = ";",dec=",",na.strings = "") 

#Quitamos las cuatro ultimas columnas
misDatos2 <- misDatos1
misDatos2$X   <- NULL
misDatos2$X.1 <- NULL
misDatos2$X.2 <- NULL
misDatos2$X.3 <- NULL

#Imprimimos por pantalla información sobre la estructura misDatos
str(misDatos1)
str(misDatos2)
