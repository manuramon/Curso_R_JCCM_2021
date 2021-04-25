
# Bases de datos en R -----------------------------------------------------

# Curso de Introducción a R
# Manuel Ramon, 26 a 29 de abril de 2021


# En R podemos cargar datos que tenemos en nuestro disco duro o crear
# bases de datos desde 0. Además, existen datos precargados con fines
# didácticos y/o demostrativos que pueden ser usadas directamente


# Vamos a crear una base de datos desde 0. Para ello, usamos la función
# data.frame. EN este ejemplo, vamos a crear un base de datos con 4
# pesonas, su edad y género
?data.frame
db0 <- data.frame(nombre = c("Mario","Camila","Jose","Ana") ,
                  edad = c(35,31,44,39),
                  genero=c("male","female","male","female"))
db0

# podemos acceder a los elementos de la base de datos usando índices
dim(db0) # nos devuelve el número de filas y columnas de nuestra base
db0[1, ] # primera fila=muestra
db0[, 1] # primera columna=variable
db0[, -3] # toda la base de ddatos menos la segunda columna

# pero es más común usar el nombre de las variables. Para acceder a una
# variable de una base de datos, debemos indicar el nombre de la base
# de datos, a continuación el simbolo del dolar ($) y luego el nombre
# de la variable:
db0$nombre
db0$edad
db0$genero

# NOTA: en RStudio, tras poner el nombre de la base de datos y el simbolo
# del dolar, aparecerá un menú que nos permite seleccionar la variable.
# Además, se puede autocompletar con la tecla tabulado

# Por último, podemos usar índices pero en vez de indicar el número de
# las columnas que corresponden a las variables, podemos usar su nombre
db0[, "nombre"]
db0[, c("nombre","edad")] # recordar que c("nombre","edad") es un vector
db0["nombre"]   # devuelve un data.frame con la columna seleccionada
db0[["nombre"]] # devuelve un vector

names(db0) # que variables tiene nuestra base de datos

# para conocer la estructura de nuestra base de datos usamos la función
# str(). Se trata una de las funciones más interesantes de R
str(db0)

# para ver la información de las variables en nuestra base de datos
# usamos summary(). Fijajaros que la infromación que da varía según el
# tipo de variable
summary(db0)

# podemos conocer el número de niveles y cuatas observaciones hay para
# las variables de clase
unique(db0$genero) # nos dice los distintos niveles
table(db0$genero)  # nos da niveles y número de obs por nivel
table(db0$nombre, db0$genero) # tabla de obs para 2 variables
prop.table(table(db0$genero)) # nos da porcentajes


# podemos añadir nuevas variables a la base de datos o modificar las
# que ya existen
db0$provincia <- c("Toledo","Cuenca","Cuenca","Albacete")
db0
db0$provincia <- c("Toledo","Cuenca","Cuenca","Albacete", "Ciudad Real")

db0$altura <- c(1.83,1.74,1.77,1.69) # altura en metros
db0

db0$altura <- db0$altura*100 # altura en cm
db0

# para eliminar una variable, la asignamos el valor nulo (NULL)
db0$genero <- NULL
db0


# Ordenar vectores y bases de datos
# Existen 3 funciones principales para ordenar: sort, order y arrange
db0$nombre
sort(db0$nombre)
sort(db0$nombre, decreasing = TRUE) # ordena de mayor a mayor, o de Z a A

order(db0$nombre) # que diferencia hay con la función sort?
                  # devuelve la posición en la que están los elementos ordenados

# para ordenar una base de datos
db0[sort(db0$nombre), ]
db0[order(db0$nombre), ]
db0[order(db0$edad, decreasing = TRUE), ]

# Mi recomendación es usar la función arrange del paquete dplyr
# primero cargamos el paquete
library(dplyr)
arrange(db0, provincia)
arrange(db0, -edad)  # decreciente con el signo menos
arrange(db0, provincia, -edad) # ordenamos por 2 campos


# nunca ordenéis una sola columna
db1 <- db0 # hacemos una copia de nuestra base de datos
db0
db0$nombre <- sort(db0$nombre)
db0
db0 <- db1 # recuperamos la base original
rm(db1)    # eliminamos la copia

# también podemos alterar el orden de las variables en una base de datos
db0
db0[, c(1,3,2,4)]



# Combinar bases de datos -------------------------------------------------

# para concatenar datos por columnas usamos cbind()
db1 <- data.frame(peso = c(75,62,84,56),
                  hijos = c(0,0,3,1))
db0
db1
dim(db1)
cbind(db0, db1) # añado dos columnas
cbind(db1, db0) # altero el orden
db0 <- cbind(db0, db1) # añado dos columnas
db0

# para concatenar por filas usamos rbind()
db2 <- data.frame(nombre="Dario", edad=51, provincia="Ciudad Real",
                  altura=179, peso=77, hijos=2)
db2
rbind(db0, db2) # no coinciden los nombres
names(db0)
names(db2) # pusimos hijo en vez de hijos
names(db2)[6] <- "hijos"
rbind(db0, db2)
rbind(db2, db0)
db0 <- rbind(db0, db2)
db0

# Asimismo, podemos combinar 2 bases de datos uando un campo comun
db3 <- data.frame(nombre = db0$nombre,
                  coche = c("no","si","si","no","si"))
db3
db0 <- merge(db0, db3, by = "nombre")
db0 # fijaros que ha ordenado la base por el campo común

# Al unir dos bases de datos usando un campo común, si las bases de datos no
# coinciden, podemos decidir quedarnos con los campos comunes (por defecto)
# o todos los campos de una u otra base de datos
db4 <- data.frame(nombre = c(db0$nombre, "Paula"),
                  colorFav = c("naranja","azul","rosa","negro","verde","azul"))

merge(db0, db4, by = "nombre")
merge(db0, db4, by = "nombre", all.x = TRUE)
merge(db0, db4, by = "nombre", all.y = TRUE)


# Elegir un subconjunto de datos ------------------------------------------
subset(db0, hijos>0) # seleccionamos todos los que tengan hijos
subset(db0, provincia == "Cuenca") # seleccionamos los de Cuenca
subset(db0, hijos!=0 & coche=="si") # con hijos y coche
subset(db0, subset = altura>175, select = c("nombre","altura","peso"))

