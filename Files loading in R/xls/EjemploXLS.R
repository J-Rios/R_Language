#-----------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------
#Asignatura de Ciudades Inteligentes. M�ster en Sistemas Electr�nicos para Entornos Inteligentes.
#-----------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------


#Primero incluimos la librer�a necesaria para leer los datos
library(XLConnect)

#Cargamos el fichero excel
wk = loadWorkbook("HDI.xlsx")

#Leemos la primera p�gina del excel
misDatos= readWorksheet(wk, sheet="Hoja1")

