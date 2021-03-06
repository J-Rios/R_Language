#-----------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------
#Asignatura de Ciudades Inteligentes. M�ster en Sistemas Electr�nicos para Entornos Inteligentes.
#-----------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------

#Cargamos los datos del fichero csv HDI, tiendo en cuenta que:
# Tenemos cabecera en los datos -> head=TRUE
# El separador entre valores es -> ;
# El separador de decimales es -> ,
# Las cadenas vac�as se representan por ""

misDatos1 <- read.csv("HDI.csv",head=TRUE,sep = ";",dec=",",na.strings = "") 

#Quitamos las cuatro ultimas columnas
misDatos2 <- misDatos1
misDatos2$X   <- NULL
misDatos2$X.1 <- NULL
misDatos2$X.2 <- NULL
misDatos2$X.3 <- NULL

#Imprimimos por pantalla informaci�n sobre la estructura misDatos
str(misDatos1)
str(misDatos2)
