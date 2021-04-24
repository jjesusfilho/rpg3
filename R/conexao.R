conn <- DBI::dbConnect(RPostgres::Postgres(),host="localhost",dbname="postgres",user=Sys.getenv("DBUSER"),password=Sys.getenv("DBPASSWORD"))

library(DBI)

dbExecute(conn,"create database stf_jose")

lista <- DBI::dbGetQuery(conn,"select datname nome,datcollate ,datctype , pg_encoding_to_char(encoding)  ,datacl access_privileges from pg_database")




pg_l <- function(conn){

  DBI::dbGetQuery(conn,"SELECT d.datname as Name,
       pg_catalog.pg_get_userbyid(d.datdba) as Owner,
       pg_catalog.pg_encoding_to_char(d.encoding) as Encoding,
       d.datcollate as Collate,
       d.datctype as Ctype,
       pg_catalog.array_to_string(d.datacl, E'\n') AS Access FROM pg_catalog.pg_database d ORDER BY 1")
}

lista <- pg_l(conn)

dbDisconnect(conn)

conn <- DBI::dbConnect(RPostgres::Postgres(),host="localhost",dbname="stf_jose",user=Sys.getenv("DBUSER"),password=Sys.getenv("DBPASSWORD"))


dbWriteTable(conn,"informacoes", informacoes)

tabelas <- dbListTables(conn)

detalhes <- as.data.frame(detalhes)

dbWriteTable(conn,"detalhes", detalhes)

movimentacao <- as.data.frame(movimentacao)

dbWriteTable(conn,"movimentacao", movimentacao)

partes <- dbWriteTable(conn,"partes", partes)

tabelas <- dbListTables(conn)

dbExecute
dbGetQuery
dbWriteTable






