conn <- DBI::dbConnect(RPostgres::Postgres(),host="localhost",dbname="stf_jose",user=Sys.getenv("DBUSER"),password=Sys.getenv("DBPASSWORD"))

library(tidyverse)

library(DBI)

library(dbx)

dd %>%
  slice(1:2)

dbGetQuery(conn,"select * from detalhes limit 2")

dbGetQuery(conn,"
           select * from detalhes
           order by incidente
           limit 2
           ")

dbExecute(conn,"

          alter table detalhes add column detalhes_id serial

          ")

dbGetQuery(conn,"
           select * from detalhes
           order by detalhes_id
           limit 2
           ")

dbExecute(conn,"alter table detalhes drop column detalhes_id")


dd <- dbGetQuery(conn,"

                select * from detalhes
                where classe != 'AI'

                ")

dd <- dbGetQuery(conn,"

                select * from detalhes
                where classe <> 'AI'

                ")

query <- dbSendQuery(conn,"
                 select * from
                 detalhes
                 where classe = 'AI'
                 or relator_atual = 'MINISTRO PRESIDENTE'
                     ")
dd <- dbFetch(query, n = 20)


dk <- dbFetch(query, n = 20)


df <- bind_rows(dd,dk)

dbWriteTable(conn,"dd", dd)

dbWriteTable(conn,"dk", dk)

dbExecute(conn,"
          create table df as
          (
          select * from dd
          union
          select * from dk
          )
          ")

dbExecute(conn,"drop table dd")


dfs <- list(dd =dd,df =df,dk =dk)

iwalk(dfs,~{

  dbWriteTable(conn,.y, .x)


})


df1 <- data.frame(a = 1:5,
                  b = letters[1:5])

df2 <- data.frame(c = 6:10,
                  d = letters[6:10])

df3 <- bind_cols(df1,df2)

dbCreateTable(conn,"df1", df1)
dbCreateTable(conn,"df2", df2)

dbExecute(conn,"alter table df1 add column id serial")
dbExecute(conn,"alter table df2 add column id serial")

dbWriteTable(conn, "df1", df1, append = TRUE)
dbWriteTable(conn, "df2", df2, append = TRUE)

dbExecute(conn,"truncate df1")
dbExecute(conn,"truncate df2")


dbxInsert(conn,"df1", df1)

dbxInsert(conn,"df2", df2)


dbExecute(conn,"
          create table df3 as
          (
          select df1.id, df1.a,df1.b,df2.c, df2.d
          from df1, df2
          where df1.id = df2.id

          )

          ")


df <- expand.grid(list(v1=1:2,
                       v2=c("a","b","c")))

df <- purrr::cross_df(list(v1=1:2,
                           v2=c("a","b","c")))




df <- dbGetQuery(conn,"select a, d
                     from df1, df2
                 ")


