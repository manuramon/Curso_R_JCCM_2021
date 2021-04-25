# Comandos básicos de R II ------------------------------------------------


# Curso de Introducción a R
# Manuel Ramon, 26 a 29 de abril de 2021


# 1. Funciones en R ----------------------------------------------------------

x <- c(1,3,4,3,6,8,7,15)

mean(x) # calculamos la media aritmética
sd(x)   # calculamos la desciación estándar
range(x) # valores mínimo y máximo

# Vamos a colocar un valor faltante en la serie de datos
x[8] <- NA  # NA es como R indica los datos faltantes
mean(x)
mean(x, na.rm = TRUE)

# Para saber que opciones tenemos, usamos la ayuda de R
?mean
`+`  # incluso el signo + es una función!
?`+`



# 2. Funciones útiles en R ------------------------------------------------

data(iris) # base de datos que va precargada en R
str(iris)  # estructura de la base de atos
head(iris) # 6 primeras filas de datos
tail(iris) # 6 ultimas filas de datos
subset(iris, Sepal.Length>7.5)
apply(iris[, -5], 2, mean)
plot(x=iris$Sepal.Length, y=iris$Sepal.Width)

ls() # lista los elementos cargados en R
rm(x, iris) # elimina elementos (en este caso la x y la base de datos iris)
ls()


# 3. Paquetes en R --------------------------------------------------------

library()
install.packages("lme4") # paquete para el análisis de regresión
                         # usando modelos mixtos

library(readxl)  # cargamos el paquete readxl para leer archivos excel
?readxl
readxl::read_excel
detach("package:readxl") # dejamos de tenerlo cargado

sessionInfo()

# 4. Ayuda en R -----------------------------------------------------------

?mean
?plot
help("plot")
??ggplot2

vignette()
vignette("lubridate")
browseVignettes()


