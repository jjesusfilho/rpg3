con <- DBI::dbConnect(RPostgres::Postgres(),host="localhost",dbname="stf_jose",user=Sys.getenv("DBUSER"),password=Sys.getenv("DBPASSWORD"))

tabelas <- c("df","dd","dk","df1","df2","df3")


walk(tabelas,~{

  dbRemoveTable(con,.x)

})


set.seed(035)

d1 <- tibble::tibble(a=sample(1:5,5),
                     b=sample(c(NA_real_,6:9),5),
                     c=sample(c(NA_character_,sample(letters,4)),5))

set.seed(936)
d2 <- tibble::tibble(a= sample(c(NA_real_,2:7),7),b=sample(c(NA_real_,3:8),7))

d3 <- inner_join(d1,d2,by = "a")


d3 <- d3 %>%
    mutate(b = coalesce(b.x, b.y),
           b.x = NULL,
           b.y = NULL)


inner_join(d1,d2,by=c("a","b"))

d4 <- d1 %>%
  select(aa = a, everything())


left_join(d1,d2, by = "a")

inner_join(d4,d2,by=c("aa"="a"))


right_join(d1,d2, by="a")


d2 %>%
   filter(a != 6) %>%
   right_join(d1, by = "a")

left_join(d1,d2,by = "a",keep = TRUE)

full_join(d1,d2, by = "a")

d1 %>%
  filter(a %in% d2$a)

anti_join(d1,d2, by = "a")

d1 %>%
  filter(!a %in% d2$a)

iwalk(list(d1 = d1,d2 = d2), ~{

  dbWriteTable(conn, .y, .x)

})





