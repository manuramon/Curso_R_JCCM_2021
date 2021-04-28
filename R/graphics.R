
# Representación gráfica con R --------------------------------------------

# Curso de Introducción a R
# Manuel Ramon, 26 a 29 de abril de 2021

# leemos datos para hacer representaciones gráficas
db1 <- read.table("datos/heightANDweight.csv", header = TRUE, sep = ";")
head(db1, 4)
str(db1)

# La función básica para hacer un gráfico es plot()
plot(1:5)

# histogram
hist(db1$peso)
hist(db1$altura_cm)
hist(db1$altura_cm, col = "orange")

# boxplot
boxplot(db1$altura_cm)
boxplot(db1$peso_Kg)
boxplot(db1[, 3:4])
boxplot(altura_cm~genero, data = db1) # usamos el formato de formula
boxplot(peso_Kg~genero, data = db1)

# diagrama de barras
x <- c("A","B","A","C","D","B","D","A","B","A","A","A","B","D","C","D","A","B","A","A")
table(x)
barplot(table(x))
barplot(table(x), horiz = TRUE)


# scatterplot
plot(x = db1$altura, y=db1$peso)


# Opciones gráficas -------------------------------------------------------

?par

# usar formulas en vex de x e y
plot(peso_Kg ~ altura_cm, data = db1)

# nombre ejes
plot(peso_Kg ~ altura_cm, data = db1,
     xlab = "Altura (cm)", ylab = "Peso (Kg)")

# rango valores en los ejes
plot(peso_Kg ~ altura_cm, data = db1,
     xlim = c(140,200), ylim = c(30,90),
     xlab = "Altura (cm)", ylab = "Peso (Kg)")

# tipo y color de los puntos
plot(1:25, pch = 1:25) # pch (point character) indica el tipo de punto

plot(peso_Kg ~ altura_cm, data = db1,
     pch = 20, col = "tomato",               # col para seleccionar color
     xlim = c(140,200), ylim = c(30,90),
     xlab = "Altura (cm)", ylab = "Peso (Kg)")

# tamaño de los elementos. Usamos las funciones de tipo cex

plot(peso_Kg ~ altura_cm, data = db1,
     cex = 1.5,                       # cex para el tamaño de los puntos
     pch = 1, col = "tomato",
     xlim = c(140,200), ylim = c(30,90),
     xlab = "Altura (cm)", ylab = "Peso (Kg)")

plot(peso_Kg ~ altura_cm, data = db1,
     cex = 1.5, cex.lab=1.5,    # cex.lab para el tamaño de los nombres de los ejes
     pch = 1, col = "tomato",
     xlim = c(140,200), ylim = c(30,90),
     xlab = "Altura (cm)", ylab = "Peso (Kg)")

plot(peso_Kg ~ altura_cm, data = db1,
     cex = 1.5, cex.lab=1.5, cex.axis=1.15,   # cex.axis para el tamaño de los ejes
     pch = 1, col = "tomato",
     xlim = c(140,200), ylim = c(30,90),
     xlab = "Altura (cm)", ylab = "Peso (Kg)")

plot(peso_Kg ~ altura_cm, data = db1,
     cex = 1.5, cex.lab=1.5, cex.axis=1.15, las = 1,  # las para orientar los valores de los ejes
     pch = 1, col = "tomato",
     xlim = c(140,200), ylim = c(30,90),
     xlab = "Altura (cm)", ylab = "Peso (Kg)")


# márgenes
par(mar = c(4,5,2,1)) # mar indica los márgenes inferior, izdo, superior y derecho

plot(peso_Kg ~ altura_cm, data = db1,
     cex = 1.5, cex.lab=1.5, cex.axis=1.15, las = 1,
     pch = 1, col = "tomato",
     xlim = c(140,200), ylim = c(30,90),
     xlab = "Altura (cm)", ylab = "Peso (Kg)")


# colores por grupos
# vamos a colorear machos y hembras de diferente forma
factor(db1$genero) # pasamos la variable a factor
c("orange","lightblue")[factor(db1$genero)] # asignamos cada color a cada nivel del factor

plot(peso_Kg ~ altura_cm, data = db1,
     cex = 1.25, cex.lab=1.5, cex.axis=1.15, las = 1,
     pch = 20,
     col = c("orange","lightblue")[factor(db1$genero)], # color por grupo
     xlim = c(140,200), ylim = c(30,90),
     xlab = "Altura (cm)", ylab = "Peso (Kg)")

# anadir leyenda. Función legend
plot(peso_Kg ~ altura_cm, data = db1,
     cex = 1.25, cex.lab=1.5, cex.axis=1.15, las = 1,
     pch = 20,
     col = c("orange","lightblue")[factor(db1$genero)], # color por grupo
     xlim = c(140,200), ylim = c(30,90),
     xlab = "Altura (cm)", ylab = "Peso (Kg)")

legend(x = 140, y = 30, legend = c("female","male"),
       col=c("orange","lightblue"), pch=20,
       xjust = 0, yjust = 0)

# líneas de referencia
abline(h=mean(db1$peso_Kg), v=mean(db1$altura_cm),
       lty="dashed", # lty indica el tipo de línea: dotted, dashed, longdash
       col="gray60")


# guias: grid
plot(peso_Kg ~ altura_cm, data = db1,
     cex = 1.5, cex.lab=1.5, cex.axis=1.15, las = 1,
     pch = 1, col = "tomato",
     xlim = c(140,200), ylim = c(30,90),
     xlab = "Altura (cm)", ylab = "Peso (Kg)")
grid() # os pone las guías al gráfico


# otro gráfico
db2 <- aggregate(peso_Kg ~ round(altura_cm/100,1), data = db1, mean)
db2
names(db2)
names(db2)[1] <- "altura_m"

plot(peso_Kg ~ altura_m, data = db2,
     type = "l",  # typo de gráfico: l para líneas
     lwd = 2,    # anchuar de la línea
     xlim = c(1.40,2.00), ylim = c(50,70),
     xlab = "Altura (cm)", ylab = "Peso (Kg)")

plot(peso_Kg ~ altura_m, data = db2,
     type = "o",  # typo de gráfico: b para puntos y líneas
     lwd = 1.5,    # anchuar de la línea
     xlim = c(1.40,2.00), ylim = c(50,70),
     xlab = "Altura (cm)", ylab = "Peso (Kg)")




# Otros ejemplos ----------------------------------------------------------

data(iris)

# usando la función plot básica
par(mar=c(4,5,2,1), mgp=c(2.5,.5,0), las=1)
plot(Sepal.Width~Sepal.Length, data=iris,
     col=iris$Species, pch=20,
     ylim=c(1.85,4.65),
     xlab="Longitud de sépalo (cm)", ylab="Anchura de Sépalo (cm)")
legend("topright", bty="n", pch=20, col=c(1,2,3),
       legend = c("setosa","virginica","vesicolor"), cex=.8)
fit1 <- lm(Sepal.Width~Sepal.Length, data=subset(iris, Species=="setosa"))
lines(seq(4.25,6.25,.5), predict(fit1, data.frame(Sepal.Length=seq(4.25,6.25,.5))),
      lwd=1.5)
fit2 <- lm(Sepal.Width~Sepal.Length, data=subset(iris, Species=="virginica"))
lines(seq(5,7,.5), predict(fit2, data.frame(Sepal.Length=seq(5,7,.5))),
      lwd=1.5, col=2)
fit3 <- lm(Sepal.Width~Sepal.Length, data=subset(iris, Species=="versicolor"))
lines(seq(5.5,8,.5), predict(fit3, data.frame(Sepal.Length=seq(5.5,8,.5))),
      lwd=1.5, col=3)
grid()



# usando ggplot
# es más fácil y son gráficos más vistosos
library(ggplot2)
theme_set(theme_bw())
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) +
    geom_point(aes(color=Species)) +
    geom_smooth(aes( group=Species, color=Species),
                method="lm", formula=y~x, se=FALSE) +
    xlab("Longitud de sépalo") +
    ylab("Anchura de sépalo")

ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) +
    facet_grid(~Species) +
    geom_point(aes(color=Species)) +
    geom_smooth(aes( group=Species, color=Species),
                method="lm", formula=y~x, se=FALSE) +
    xlab("Longitud de sépalo") +
    ylab("Anchura de sépalo")


