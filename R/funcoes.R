## Funções

### Funções sem argumento
Sys.time()


### Funções com um argumento

sqrt(25)

### Funções com mais de um argumento

sum(4,5)

sum(1:10)

### Funções vetorizadas

sqrt(c(4,25,256))

### Funções agregadoras

#### exemplos: sum, mean, median, 
set.seed(730)

x <- sample(1:100, 8)

mean(x)

median(x)
sum(x)
sd(x)


## operadores

2*x

`*`(2,x)

x/3

3+x

### Ajuda com funções

?sum

?mean


## Criando funções


somar <- function(x,y){
  
  x+y
  
}


somar(5,4)


somar_dividir <- function(x,y){
  
  (x+y)/5
  
}

somar_dividir(5,4)


### Usando pacotes

remotes::install_github("jjesusfilho/tjsp")

library(tjsp)

baixar_cjsg(
  livre = "acesso à justiça",
  aspas = TRUE,
  diretorio = ".",
  n = 10
)

cjsg <- ler_cjsg(diretorio = ".")
