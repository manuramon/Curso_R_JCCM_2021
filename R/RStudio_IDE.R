
# Introducción a la inteface de RStudio -----------------------------------

# Curso de Introducción a R
# Manuel Ramon, 26 a 29 de abril de 2021

# Todo lo que va a continuación de la almohadilla (#) es un comentario,
# R no lo ejecuta

# Algunos comandos básicos ------------------------------------------------

# Para ejecutarlos, ponte en la línea del comando y da al botón Run de arriba
# o con la combinación de teclas Crtl+Intro (Cmd+Intro en OSX)
2+2
27/9
2+3*5 # ¿en que orden se ejecutan las operaciones?
sqrt(49)
7^2
7**2

# Creamos variables en R --------------------------------------------------

# Échale un vistazo a la ventana del explorador para
# ver que aparecen

# empezamos por una base de datos con 10 observaciones y 2 variables
# haz un print en la consola (escribe el nombre de la base de datos y dale
# al intro)
db1 <- data.frame(a=1:10, b=rnorm(10))
db1

a = 2    # para asignar valores a objetos podemos usar el signo de igual (=)
b <- 3   # o una flecha (<-). Es preferible esta segunda opción
c <- a+b
c


# Pintamos algún gráfico sencillo -----------------------------------------

# explora en la ventana de gráficos los resultados y juega con el
# zoom y las opciones de exportar gráficos
plot(x=1:10, y=1:10)
boxplot(db1$b, col="orange")


# Busca ayuda en R --------------------------------------------------------
?sqrt
?mean
