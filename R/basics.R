# Comandos básicos de R ---------------------------------------------------


# Curso de Introducción a R
# Manuel Ramon, 26 a 29 de abril de 2021

# Todo lo que va a continuación de la almohadilla (#) es un comentario,
# R no lo ejecuta


getwd() # para saber en que directorio estamos trabajando
setwd("datos/")
getwd()
setwd("../") # ir al directorio inmediatamente superior
getwd()


# 1. Operaciones básicas -------------------------------------------------

2+2
2 + 2 # R es bastante flexible con los espacios. Es aconsejable ponerlos para
      # facilitar la lectura del código

3*2+6-2*4*0.5+6/3               # es difícil de leer
3*2 + 6 - 2*4*0.5 + 6/3         # más fácil de leer
(3*2) + 6 - (2*4*0.5) + (6/3)   # aún más facil de leer

# de los ejemplos de arriba se observa que el orden de las operaciones es
# importante. Ejemplo, queorden se sigue en la siguiente operación?
3+3^2*2+1
2+3*sqrt(25)/3
(3+3)^2*(2+1)

10+20 # suma
10-20 # resta
10*20 # multiplicación
10/20 # división
3^2   # cuadrado de ...
3**2  # idem
3^3   # cubo
3^5   # n potencia (en este caso n=5)
sqrt(9)   # raiz cuadrada
27^(1/3)  # raiz cúbica
243^(1/5) # n raiz (en este caso n=5). Comparar con 3^5 arriba
abs(-23)  # calcula el valor absoluto



# 2. Operadores lógicos ---------------------------------------------------

2 == 3  # ¿Es 2 igual a 3?
2 != 3  # ¿Es 2 distinto de 3?
6 > 6   # mayor que
6 >= 6  # mayor igual a
2 < 5   # menor que
2 <= 1  # menos o igual a

2 + 2 > 5
2 + 2 = 5 # error, el operado es un doble ==

# también valen para comparar texto

"Mario" == "mario"
"Mario" == "Mario"


# 3. Crear/Modificar variables --------------------------------------------

# comprueba que las variables aparecen en la ventana del explorador
a <- 3
b <- 2
c <- 6
# para ver el valor de estas variables en la consola:
a
a;b;c
c(a,b,c) # esto es un vector, los veremos más adelante
print(a)


# podemos operar con las variables creadas y crear otras nuevas
a+b
a*c
c/b
c/b==a # estamos haciendo una comparación, nos dice si ambos valores son iguales
a==b   # idem
d <- a*c
d
todos <- c(a,b,c,d) # guardamos los valores en un vector
todos

# Ejemplo: vamos a calcular los beneficios que esperaría obtener de la venta
# de mi libro de apuntes a mis alumnos
no.alumnos <- 40  # supongamos que tengo 40 alumnos
precio <- 10       # cada libro tiene un precio de 10 €
impuestos <- 0.17 # tengo que pagar un 17% de impuestos
ingresos <- no.alumnos*precio
beneficio <- ingresos*(1-impuestos)
beneficio

# hay nombres restringidos que no pueden usarse para nombrar variables
TRUE <- 2
NA   <- 2
2casas <- 8 # RStudio lo marca como error

# R tiene variables ya creadas, por ejemplo el valor de pi
pi

# otras variables corresponden al  nombre de funciones
mean # calcula la media aritmética de un conjunto de datos
sd   # calcula la desviación estándar de un conjunto de datos

# IMPORTANTE: nunca uséis nombres ya existentes para crear vuestras variables,
# o podríais perder funciones

# R distingue mayusculas de minúsculas. Es importante a la hora de nombrar
# variables. Una recomendación es usar siempre minúsculas
Uno <- 1
Uno
uno  # nos dice que uno no existe
uno <- 2
Uno == uno

# IMPORTANTE. conviene usar nombres que tengan sentido a la hora de crear
# variables, para que más adelante sepamos a que nos referimos
x1 <- 178
altura <- 178 # sabemos que es un dato altura
mario.altura <- 178 # cm
mario_peso <- 70    # Kg
marioIMC <- mario_peso/(mario.altura/100)^2 # IMC = Kg/metros^2
round(marioIMC, 1)



# 4.  Tipos de datos ------------------------------------------------------

class(altura)
class("Juan")
data(iris) # base de datos cargada en R, muy famosa
str(iris)


# 5. Vectores -------------------------------------------------------------

my_data1 <- c(1,2,3,4,5)
my_data2 <- 1:5  # equivalente a la anterior. Secuencia de datos de 1 a 5

datos <- c(1,2,3)
alumnos <- c("Pablo", "Ana", "Carmen")
datos
alumnos

# podemos obtener información de los vectores en la ventana del explorador
# podemos saber cuántos elementos tiene un vector y de que tipo (int, num, chr)
# para saber la longitud que tiene un vector, podemos usar la función length()
length(datos)
uno2cien <- 1:100
uno2cien # que son los números entre corchetes que aparecen en la consola?
length(uno2cien)

# para acceder a los elementos de un vector, usamos corchetes
alumnos[2]
alumnos[1:2]
c(1,3)
alumnos[c(1,3)] # para acceder al primer y tercer elemento

alumnos[-2]     # también podemos quitar elementos con valores negativos
alumnos[-c(1,3)]

# para alterar el orden de los elemento de un vector
alumnos
alumnos[c(3,2,1)]

# podemos modificar el valor de un elemento del vector
alumnos
alumnos[2] <- "Maria"
alumnos

# podemos combinar 2 vecores en otro vector
alumnos1 <- c("Pablo", "Carlos","Mario")
alumnos2 <- c("Ana", "Carmen", "Paula")
alumnos_all <- c(alumnos1, alumnos2)
alumnos_all

# qué pasa si combinamosvectores de diferente tipo
datos <- c(1,2,3)
alumnos <- c("Pablo", "Ana", "Carmen")
mezcla <- c(datos, alumnos)
class(mezcla) # que tipos de datos tenemos en este vector?

# podemos operar con vectores
datos*2 # multiplica por 2 cada elemento del vector
datos - datos # resta el primer elemento del primer vector con el primer
              # elemento del segundo vector, y sucesivamente
datos + c(1,2) # recicla el segundo vector y da un aviso

# podemos operar usando operadores lógicos
datos>1
datos[datos>1]
alumnos_all
alumnos.curso <- c(1,2,1,1,2,2)
alumnos.curso == 1
alumnos_all[alumnos.curso == 1]


# 6. Matrices en R --------------------------------------------------------

m1 <- matrix(1:9)
m1  # por defecto, matriz de nx1
m2 <- matrix(1:9, nrow = 3, ncol = 3)
m2  # matrix de 3x3
m3 <- matrix(1:9, nrow = 3, ncol = 3, byrow = TRUE)
m3  # como arriba, pero cambia el orden
dimnames(m3)
m3 <- matrix(1:9, nrow = 3, ncol = 3, byrow = TRUE,
             dimnames = list(c("row1","row2","row3"),  # nombre de filas
                             c("col1","col2","col3"))) # nombre de columnas
m3

# usando rbind o cbind
x1 <- c(1,2,3)
x2 <- c(4,5,6)
x3 <- c(7,8,9)
m1 <- rbind(x1,x2,x3) # junta los vectores por filas (row bind)
m1
m2 <- cbind(x1,x2,x3) # junta los vectores por columnas (column bind)
m2
dimnames(m1)
dimnames(m2)

# para saber la dimensión de una matrix (filas x columnas):
m3
dim(m3)  # dimensión
nrow(m3) # número de filas
ncol(m3) # número de columnas
diag(m3) # diagonal de la matriz

# podemos seleccionar elementos, así como filas o columnas completas
m3
m3[2,2]
m3[1, ]
m3[, 1]

# y operar con la matriz
m3
m3*2
m3[1,] <- m3[1, ] * 2
m3


# 7. Listas en R ----------------------------------------------------------

vec1 <- c("Ana","Juan",1:3, NA, TRUE)
str(vec1)
length(vec1)
lis1 <- list("Ana","Juan",1:3, NA, TRUE)
str(lis1)
length(lis1) # los números 1:3 los considera un solo elemento!
length(vec1) == length(lis1)

lis1[1]
lis1[[1]]
lis1[3]
lis1[[3]]

names(lis1)
names(lis1) <- c("Alumna","Alumno","ciclos","Edades","Calificacion")
lis1
lis1$Alumno
