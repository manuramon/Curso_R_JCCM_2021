
# Bases de datos en R.  Ejercicios ----------------------------------------

# Curso de Introducción a R
# Manuel Ramon, 26 a 29 de abril de 2021

# Vamos a usar una base de datos precargada y muy famosa. Se llama
# IRIS y trae información de la planta Iris. En concreto, consta de
# 150 observaciones correspondientes a 3 clases de la planta iris:
# setosa, vergínica y versicolor (50 observaciones por clase) y en el
# que se describen:
# - el largo y ancho del pétalo en cm
# - el largo y ancho del sépalo en cm

# Para cargar esta base de datos, tenemos que poner:
data("iris")

# Habrá aparecido la base de datos en el explorador de datos.
# Vamos a echarle un vistazo.


# 1. Estudio exploratorio -------------------------------------------------

# Vamos a empazar a explorar cuántas observaciones y variables tenemos
# y de qué tipo. Usa la función str() para explorar la base de datos. Usa
# también las funciones dim(), ncol(), nrow(), length() y names(). ¿Qué
# hace cada una de ellas?


# A continuación, mira como son las 4 primeras y 4 últimas filas. Usa las
# head() y tail() funciones.


# Mira también cuales son los valores de anchura
# de pétalo y sépato para las observaciones 95 a 105. A qué variedades
# corresponden estas observaciones? Guarda esas 10 observaciones en una
# base nueva a la que llamaremos iris_smpl.

# iris_smpl <- iris[95:105,]


# Vamos a usar la base iris_smpl para practicar cómo llamar a los elementos de
# una base de datos. Haz un print en la consola de R de las columnas de esta
# base de datos usado el signo del dolar ($), así como asignaciones de filas
# y columnas.
iris_smpl[, "Species"]
iris_smpl$Sepal.Length


# Utiliza la función summary() para ver estadísticos generales de nuestros datos


# Calcula la media, desviación estándar y los valores máximo y mínimo para
# cada variable numérica. Para ellos, usa las funciones mean(), sd(), min(),
# max(), y range().


# Para la variable cualitativa (de clase), vamos a ver cuantos niveles tiene,
# y cuantas observaciones para cada nivel. Usa las funciones unique(),levels(),
# table() y prop.table()


# Vamos a calcular esas funciones (media, sd,...) para toda las variables
# numéricas de una vez usando la función apply()
apply(iris[, -5], MARGIN = 2, FUN = mean) # la función apply toma 3 argumentos:
                                          # base de datos, el margen (1:fila,2:columna)
                                          # y la función


# Vamos a hacer el mismo cálculo, pero ahora para cada variedad de planta iris
# por separado. Para ello usaremos las funciones aggregate() y tapply(). ¿Qué
# diferencia hay entre las salidas de ambas funciones? Hazlo para todas las variables
# numéricas de
plBYsp1 <-tapply(iris$Petal.Length,iris$Species,summary)
plBYsp2 <- aggregate(iris$Petal.Length, by=list(iris$Species), FUN=mean)



# Creación/modificacion de variables --------------------------------------

# Imagina que el área del pétalo se obtiene de multiplicar su longitud por su
# anchura. Crea una nueva variable llamada "Petal.Area" en la base de datos iris


# Ahora vamos a crear una variable de clase que diferencie aquellas observaciones
# que tienen una longitud de sépalo mayor de su valor medio. Haz uso de las
# funciones mean() y ifelse(). Para esta última, consulta la ayuda de R. Si tienes
# dudas pide ayuda a tu profesor. Llama a la nueva variable "Sepal.High"
?ifelse


# Por ultimo, vamos a cambiar el tipo de la variable Species de factor a variable
# categórica. Para ello usaremos la función as.character(). Guarda la nueva variable
# con el mismo nombre.


# Ordenar la base de datos ------------------------------------------------

# Para estos ejercicios vamos a usar la base de datos iris_smpl, por ser más
# pequeña.

# Ordena la variables de pétalo en orden creciente y las de sépalo en orden
# decreciente. Ordena sólo las variables, no la base de datos. Usa la función sort()


# Ordena la base de datos por la variable longitud de pétalo, en orden creciente.
# Usa la función order() y la función arrange(). Recuerda que la función arrange()
# está en la librería dplyr. Necesitarás cargarla.

# Ordena la base de datos por la variable anchura de sépalo en orden decreciente


# Ordena la base de datos por la variable especie y a continuación, la anchura de sépalo



# Combinar bases de datos -------------------------------------------------

# Usa la función merge para combinar las siguientes báses de datos. El campo común
# es la identificación que se llama id en una de las bases de datos  y ID en la otra.
# Consulta la ayuda de la función merge para ver como combinar ambas bases de datos.

# Combina ambas bases de datos de manera que te quedes:
# a. con los elementos comunes
# b. con todos los elementos de z1
# c. con todos los elementos de z2

z1 <- data.frame(id=letters[1:4],
                 x=rnorm(4))
z2 <- data.frame(ID=letters[c(1:3,5:6)],
                 y=runif(5))



# Subconjuntos de datos ---------------------------------------------------

# Haz un subset de datos, que contenga sólo la especie virginica


# Haz un subset de datos, que contenga observaciones con una anchura de sépalo
# menor a 2. Repite el mismo subset pero para un valor menor o igual a 2.3


# Haz un subset de datos, que contenga sólo la especie versicolor y una
# anchura de pétalo mayor de 1.5

# Haz otros 2 subsets que tú elijas.



# Análisis adicionales ----------------------------------------------------

# calcula la correlación entre las variables núméricas. Para ello usa la
# función cor()
?cor



# Gráfico general. En el apartado de gráficos veremos en detalle esto
pairs(iris[,-5], col=iris$Species)
