## Objetos no R ##

### Inteiro ###

inteiro <- 34L

inteiro1 <- 46L

46L - 34L

inteiro1 - inteiro

typeof(inteiro1)

## Double ###

numero1 <- 34

numero2 <- 46

typeof(34)

typeof(numero1)

numero3 <- 3.5

typeof(numero3)

numero4 <- 5.6774L

typeof(numero4)

### caracteres ###

texto1 <- "a"
typeof(texto1)

typeof("a")

n <- "34"

n1 <- "46"

n1 - n

n <- as.numeric(n)

n1 <- as.numeric(n1)

n1 - n


### Datas ###

data <- "2020-06-13"

typeof(data)

class(data)

data <- as.Date(data)

typeof(data)

class(data)

data2 <- "2020-06-12"
data2 <- as.Date(data2)

data - data2

as.numeric(data)
as.numeric(data2)

data3 <- as.Date("1970-01-01")

data4 <- as.Date("1969-05-03")

as.numeric(data3)

as.numeric(data4)


### Fatores ###

nomes <- c("João","Maria","Maria","Pedro","Flávia","Flávia","Pedro","Pedro")

typeof(nomes)

class(nomes)

nomes <- as.factor(nomes)

nomes

as.numeric(nomes)

idades <- c(45,18,67)

idades <- as.factor(idades)

as.numeric(idades)

idades <- as.character(idades)


idades <- as.numeric(idades)



### Vetores

a <- 1
b <- c(1,6)

d <- c("josé","maria")

f <- c("josé",6)

nomes <- c("José","maria","flávia")

idades <- c(45,23,76)

### Dataframes  ###

df <- data.frame(nome = nomes, idade = idades)

df <- data.frame(nome = c("pedro","karina","mario"),
                 idade = c(43,65,12),
                 religiao = c("cristão","matriz-afro","islâmica"),
                 sexo = c("masculino","feminino","masculino"))

df$religiao <- as.factor(df$religiao)

df$sexo <- as.factor(df$sexo)

### Matriz

m <- matrix(1:10,nrow = 5,byrow= T)


## listas

l <- list(meudf = df, minhamatriz = m, idades = idades, nomes = nomes)

purrr::map(l, class)


e1 <- l[1]

e1 <- l[[1]]

nome <- l[[1]]$nome

e1 <- l[["meudf"]]


l2 <- l[-2]


