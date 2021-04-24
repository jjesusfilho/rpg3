library(tidyverse)

## Cria dataframe com R base
df <- data.frame(col1 = c("a","b","c"),
                 col2 = c(1,3,3))

## Cria dataframe/tibble com tidyverse/tibble

df <- tibble(col1 = c("a","b","c"),
             col2 = c(1,3,3))

## Converte dataframe para tibble

df <- as_tibble(df)

## estrutura de uma  tibble

glimpse(df)

## Adiciona linha a uma tibble

df <- df %>%
     add_row(col1 = "d", col2 = 4)

## Adiciona coluna a uma tibble

df <- df %>%
    add_column(col3 = c("k","g","b","r"))


df <- df %>%
     add_column(col0 = 5:8, .before = 1)


