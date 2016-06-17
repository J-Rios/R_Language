#-----------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------
#Asignatura de Ciudades Inteligentes. Máster en Sistemas Electrónicos para Entornos Inteligentes.
#-----------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------

#Primero incluimos la librería
require(XML)

#Cargamos el fichero xml
data <- xmlParse("HDI.xml")

#Se procesa el fichero y se transforma en una variable R
xml_data <- xmlToList(data)

#Calculamos de cuantos países tenemos información
sizeData = length(xml_data);

#Generamos la estructura de datos dataFrame para alamcenar los datos

misDatos <- data.frame(País = character(sizeData), 
                       Esperanza.de.Vida = numeric(sizeData),
                       Promedio.de.años.de.Escolaridad = numeric(sizeData),
                       Años.esperados.de.Escolaridad = numeric(sizeData),
                       Producto.interior.bruto.per.cápita = numeric(sizeData),stringsAsFactors = FALSE)

#Imprimimos por pantalla información sobre la estructura misDatos
str(misDatos)

#Iteramos sobre la estructura generada del XML para almacenar los datos en la estructura que hemos definido.
for(i in seq(1,sizeData))
{
  misDatos$País[i] <- xml_data[[i]][1];
  misDatos$Esperanza.de.Vida[i] <- xml_data[[i]][2];
  misDatos$Promedio.de.años.de.Escolaridad[i] <- xml_data[[i]][3];
  misDatos$Años.esperados.de.Escolaridad[i] <- xml_data[[i]][4];
  misDatos$Producto.interior.bruto.per.cápita[i] <- xml_data[[i]][5];
}