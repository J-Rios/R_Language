#-----------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------
#Asignatura de Ciudades Inteligentes. M�ster en Sistemas Electr�nicos para Entornos Inteligentes.
#-----------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------

#Primero incluimos la librer�a
require(XML)

#Cargamos el fichero xml
data <- xmlParse("HDI.xml")

#Se procesa el fichero y se transforma en una variable R
xml_data <- xmlToList(data)

#Calculamos de cuantos pa�ses tenemos informaci�n
sizeData = length(xml_data);

#Generamos la estructura de datos dataFrame para alamcenar los datos

misDatos <- data.frame(Pa�s = character(sizeData), 
                       Esperanza.de.Vida = numeric(sizeData),
                       Promedio.de.a�os.de.Escolaridad = numeric(sizeData),
                       A�os.esperados.de.Escolaridad = numeric(sizeData),
                       Producto.interior.bruto.per.c�pita = numeric(sizeData),stringsAsFactors = FALSE)

#Imprimimos por pantalla informaci�n sobre la estructura misDatos
str(misDatos)

#Iteramos sobre la estructura generada del XML para almacenar los datos en la estructura que hemos definido.
for(i in seq(1,sizeData))
{
  misDatos$Pa�s[i] <- xml_data[[i]][1];
  misDatos$Esperanza.de.Vida[i] <- xml_data[[i]][2];
  misDatos$Promedio.de.a�os.de.Escolaridad[i] <- xml_data[[i]][3];
  misDatos$A�os.esperados.de.Escolaridad[i] <- xml_data[[i]][4];
  misDatos$Producto.interior.bruto.per.c�pita[i] <- xml_data[[i]][5];
}