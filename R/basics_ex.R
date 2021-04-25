# Comandos básicos de R. Ejercicios ---------------------------------------

# Curso de Introducción a R
# Manuel Ramon, 26 a 29 de abril de 2021


# 1. Pueba las distintas operaciones aritméticas básicas. Explora el orden
#    que sigue R al realizar las operaciones, y altera ese orden usando
#    paréntesis.

sqrt(21^2)
3+2*3


# 2. Asigna valores a variables y realiza operaciones básicas con ellas
x1 <- 2
x2 <- 3
a1 <- x1*x2


# 3. Calcula el índice de masa corporal (IMC) de una persona. El IMC es igual
#    al peso en Kg dividido por el cuadrado de su altura expresada en metros
#    Para ello, asigna el peso y altura a variables y luego guarda el IMC
#    que calculas en otra variable. Visualiza en la consola las 3 variables


# 4. Crea dos vectores numéricos de longitud igual a 5 cada uno. Muestra
#    los elementos impares de cada uno de los vectores. Suma y multiplica
#    los dos vectores entre sí
vec1 <- c(1,3,2,10,0)
length(vec1)==5 # comprobamos que efectivamente tiene 5 elementos


# 5. A partir de la siguiente matriz, extrae las filas primera y tercera,
#    la segunda columnas y el elemento de la fila primera y tercera columna.
#    suma los valores de la primera fila y tercera columa y divide el
#    resultado entre 4
m22 <- matrix(1:9, nrow = 3, ncol = 3, byrow = TRUE,
             dimnames = list(c("row1","row2","row3"),  # nombre de filas
                             c("col1","col2","col3"))) # nombre de columnas


# 6. Crea una lista que contenga el nombre de 3 personas ficticias, su
#    altura y peso y su color favorito. Asigna nobre a cada elemento de
#    la lista (ejemplo: nombre, altura, peso, color). Accede a los
#    elementos de la lista.

