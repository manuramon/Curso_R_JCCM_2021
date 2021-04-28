
# Importar/Exportar datos en R --------------------------------------------


# Curso de Introducción a R
# Manuel Ramon, 26 a 29 de abril de 2021



# 1.  Importar datos ------------------------------------------------------

?read.table

# Para importar datos, tenemos que saber que formato tiene nuestros datos:
# si tiene encabezado, cómo están separadas las columnas, etc

# La función más util es read.table()

d1 <- read.table("datos/heightANDweight.txt")
head(d1) # vemos las 6 primeras filas
head(d1, 3) # vemos las 3 primeras filas
tail(d1) # vemos las 6 ultimas filas
tail(d1, 3) # vemos las 3 últimas filas

str(d1) # estructura de la base de datos. ¿Qué está mal?

d1[1, ] # primera fila de la base de datos
d1[2, ] # segunda fila

# Por defecto, data.table() no lee encabezados.
?data.table

# tenemos que indicarle a la función que tiene encabezado con el argumento header

d1 <- read.table("datos/heightANDweight.txt",
                 header = TRUE)
head(d1)
str(d1) # ahora la ha leido bien


# Vamos a leer otra base de datos
d2 <- read.table("datos/heightANDweight.csv",
                 header = TRUE)
head(d2,4)
dim(d2)
ncol(d2)
str(d2)

# No hemos indicado que el separador de campos/columnas es un ";"
d2 <- read.table("datos/heightANDweight.csv",
                 header = TRUE, sep = ";")
head(d2,4)
dim(d2)
ncol(d2)
str(d2)


# Para leer datos de Excel usamos la función read_excel() del paquete readxl
# tenemos que verificar que tenemos instalado el paquete, y a continuación
# lo caragamos
library(readxl)
?read_excel

d3 <- read_excel("datos/heightANDweight.xlsx")
head(d3)
str(d3)


# Abre el archivo excel, crea una nueva hoja. En esa hoja, introduce valores
# en las dos primeras columnas: la primera 5 celdas con nombres, y la segunda
# 5 celdas con valores numéricos. No vamos a poner nombres a las variables.
# cierra excel y lee esa nueva hoja excel.




# 2.  Exportar datos ------------------------------------------------------

d4 <- data.frame(id = rep(c("A","B","C"), each=4),
                 x1 = round(rnorm(n = 3*4, mean = 10, sd = 5), 2))
d4

# Para exportar datos usamos la función write.table()
write.table(d4, file = "datos/d4_default.txt")
# Vamos a abrir d4 y ver qué formato tiene

write.table(d4, file = "datos/d4.txt",
            row.names = FALSE,  # no queremos que escriba el nombre de las filas
            quote = FALSE)  # no queremos que ponga los caracteres entre comillas

write.table(d4, file = "datos/d4_noInfo.txt",
            row.names = FALSE,
            col.names = FALSE, # no queremos que escriba el nombre de las variables
            quote = FALSE)

write.table(d4, file = "datos/d4.csv",
            sep = ";",
            row.names = FALSE,
            quote = FALSE)

write.table(d4, file = "datos/d4_tab.txt",
            sep = "\t",
            row.names = FALSE,
            quote = FALSE)

write.table(d4, file = "datos/d4_dec.txt",
            dec = ",", # decimales con comas
            row.names = FALSE,
            quote = FALSE)

d4[5,2] <- NA
d4$x2 <- 1:nrow(d4)
write.table(d4, file = "datos/d4_NA.txt",
            row.names = FALSE,
            quote = FALSE,
            na=" ")
# abre el archivo d4_NA.txt en excel


# Vamos a exportar a formato excel. Para ello, vamos a usar la función writexlsx()
# del paquete writexl
library(writexl)
write_xlsx(d4, path = "datos/d4.xlsx")



# 3.  Objetos RData -------------------------------------------------------

save.image(file = "datos/mi_espacio.RData")
# mira que aparece en la carpeta

# ahora vamos a borrar todo lo que tenemos cargado en R
rm(list=ls())

# y a continuación cargamos el archivo que guardamos
load("datos/mi_espacio.RData")

# mira si han aparecido todos los objetos

# si queremos seleccionar alguno objeto concreto
save(d1, d3, file = "datos/mi_sub_espacio.RData")

# borramos de nuevo el espacio de trabajo y cargamos el subespacio
rm(list=ls())
load("datos/mi_sub_espacio.RData")
# qué ha cargado?


# 4.  Ejercicios ----------------------------------------------------------

# Lee los archivos de datos nested.csv y fiebre.txt. Explora las primeras 3
# filas y columnas de cada base de datos. Guarda las bases de datos usando un
# formato diferente al original (una de ellas que sea una hoja excel)


