library(tidyverse)
library(lubridate)

## count

relator <- detalhes %>%
          count(relator_atual)

relator <- detalhes %>%
           count(relator_atual, sort = TRUE)

relator_classe <- detalhes %>%
          count(relator_atual, classe, sort = TRUE)

## filter

ai <- detalhes %>%
      filter(classe == "AI")

ai_presidente <- detalhes %>%
       filter(classe == "AI" , relator_atual == "MINISTRO PRESIDENTE")

ai_hc <- detalhes %>%
       filter(classe == "AI" | classe == "HC")

na <- detalhes %>%
      filter(numero_unico != "0004754-72.2008.0.01.0000" | is.na(numero_unico))

classes <- c("AI","HC")

ai_hc <- detalhes %>%
         filter(classe %in% classes)

## Selecionar

incidente <- informacoes %>%
           select(incidente)

incidente_origem <- informacoes %>%
           select(incidente, origem)

incidente <- informacoes %>%
           select(1)

info3 <- informacoes %>%
         select(1:3)

info4 <- informacoes %>%
         select(2, 6)

info_3 <- informacoes %>%
        select(-3)

info_4_6 <- informacoes %>%
          select(-c(4,6))

info_assunto <- informacoes %>%
            select(assunto1:assunto3)

assunto <- informacoes %>%
           select(starts_with("assunto"))

origem <- informacoes %>%
          select(ends_with("origem"))

origem <- informacoes %>%
          select(contains("origem"))

assunto <- informacoes %>%
         select(matches("\\d"))

assuntos <- informacoes %>%
         select(assunto = assunto1)

### arrange

detalhes <- detalhes %>%
       arrange(relator_atual)

detalhes <- detalhes %>%
        arrange(desc(relator_atual))


### mutate
#### criando novas colunas
informacoes <- informacoes %>%
       mutate(ano_protocolo = year(data_protocolo))

informacoes <- informacoes %>%
        mutate(ano_protocolo = NULL)

informacoes <- informacoes %>%
        mutate(ano_protocolo = year(data_protocolo), .after = data_protocolo)

informacoes <- informacoes %>%
       mutate(ano_protocolo = year(data_protocolo),
              mes_protocolo = month(data_protocolo),
              dia_protocolo = wday(data_protocolo, label = TRUE, abbr=FALSE))

## AT
informacoes <- informacoes %>%
         mutate(across(2:4, .fns = ~str_remove(.x, "DIREITO")))

## ALL
info <- informacoes %>%
       mutate(across(.fns = as.character))

## IF
info <- informacoes %>%
        mutate(across(where(is.numeric), as.character))

## Summarize

df <- tibble(idade = sample(18:50,30,replace = TRUE))

sumario <- df %>%
        summarize(media = mean(idade),
                  mediana= median(idade),
                  desvio_padrao = sd(idade),
                  minimo = min(idade),
                  maximo = max(idade)
                  )


## Group by

View(starwars)

sumario<- starwars %>%
        group_by(sex) %>%
        summarize(peso = mean(mass,na.rm = TRUE),
                  altura = mean(height, na.rm = TRUE))






