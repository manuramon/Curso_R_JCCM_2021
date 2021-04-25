
# Base de datos de altura y peso por sexos --------------------------------

# Curso de Introducción a R
# Manuel Ramon, 26 a 29 de abril de 2021

# creo la base de datos

sexo <- rep(c("male","female"), each=100)
altura <- rnorm(200, mean = 167.76, sd = 5.89) # altura en cm
altura <- altura + c(-2,3)[factor(sexo)]
peso <- rnorm(200, mean = 59.67, sd = 8.06)    # peso en Kg
peso <- peso + c(-2,8)[factor(sexo)]

db <- data.frame(id = paste0("id", stringr::str_pad(1:200, 3, pad=0)),
                 genero = sexo,
                 altura_cm = altura,
                 peso_Kg = peso)

# guardo la base de datos

write.table(db, file = "datos/heightANDweight.txt",
            row.names = FALSE, quote = FALSE)
writexl::write_xlsx(db, path = "datos/heightANDweight.xlsx")

str(db)
summary(db)
aggregate(altura ~ sexo, data = db, FUN = mean)
tapply(db$altura_cm, db$genero, mean)

library(dplyr)
db %>%
    group_by(genero) %>%
    summarise(altura_media=mean(altura_cm),
              altura_std=sd(altura_cm),
              peso_media=mean(peso_Kg),
              peso_std=sd(peso_Kg))
