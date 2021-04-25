# Instalación de paquetes adicionales -------------------------------------

# Curso de Introducción a R
# Manuel Ramon, 26 a 29 de abril de 2021

my_pcks  <- installed.packages()[,"Package"]          # paquetes ya instalados
wk_pcks <- c("tidyverse","dplyr","readxl","writexl")  # paquetes necesarios
new_pcks <- wk_pcks[!wk_pcks %in% my_pcks]            # paquetes a instalar

# instala aquellos paquetes que no tenemos instalados
if (length(new_pcks)) {
    install.packages(new_pcks)
}
