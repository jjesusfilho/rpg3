library(tidyverse)
library(writexl)
library(readxl)
library(jsonlite)
## Salvar como csv

write_csv(x = detalhes, file = "data/detalhes.csv")

## Ler csv

detalhes <- read_csv(file = "data/detalhes.csv")


## Salvar em txt

write_delim(informacoes,"data/informacoes.txt", delim = "\t")

## Ler txt

informacoes <- read_delim(file = "data/informacoes.txt", delim = "\t")


## salvar em excel

write_xlsx(detalhes,path = "data/detalhes.xlsx")

## Ler excel

detalhes <- read_excel("data/detalhes.xlsx")


## Salvar em json

write_json(movimentacao,"data/movimentacao.json",pretty = TRUE)

### Ler json

movimentacao <- read_json("data/movimentacao.json",simplifyDataFrame =T)


### Salvar em rds

saveRDS(partes,"data/partes.rds")

### Ler rds

partes <- readRDS("data/partes.rds")


## Salvar como RData

save(detalhes,informacoes,movimentacao,partes, file = "data/bases.RData")

load("data/bases.RData")




