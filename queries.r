install.packages("DBI")
install.packages("RMySQL")
install.packages("dplyr")
library(DBI)
library(RMySQL)

MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")


dbListTables(MyDataBase)

dbListFields(MyDataBase, 'CountryLanguage')



DataDB <- dbGetQuery(MyDataBase, "select * from CuntryLanguage")

# Observemos que el objeto DataDB es un data frame, por lo tanto ya es un objeto 
# de R y podemos aplicar los comandos usuales

class(DataDB)
head(DataDB)


pop.mean <- mean(DataDB$Population)  # Media a la variable de poblaciÃ³n
pop.mean 

pop.3 <- pop.mean *3   # Operaciones aritmÃ©ticas
pop.3

# Incluso podemos hacer unos de otros comandos de busqueda aplicando la 
# libreria dplyr

library(dplyr)
pop50.mex <-  DataDB %>% filter(CountryCode == "MEX" ,  Population > 50000)   # Ciudades del paÃ­s de MÃ©xico con mÃ¡s de 50,000 habitantes

head(pop50.mex)

unique(DataDB$CountryCode)   # PaÃ­ses que contiene la BDD
