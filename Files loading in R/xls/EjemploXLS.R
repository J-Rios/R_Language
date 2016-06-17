#-----------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------
#Asignatura de Ciudades Inteligentes. Máster en Sistemas Electrónicos para Entornos Inteligentes.
#-----------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------


#Primero incluimos la librería necesaria para leer los datos
library(XLConnect)

#Cargamos el fichero excel
wk = loadWorkbook("HDI.xlsx")

#Leemos la primera página del excel
misDatos= readWorksheet(wk, sheet="Hoja1")

