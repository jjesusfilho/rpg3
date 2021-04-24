library(stf)


incidentes <- 2635061:2635161

#stf_download_information(incidentes, dir = "data-raw/informacoes")

#stf_download_parties(incidentes,"data-raw/partes")

stf_download_details(incidentes,"data-raw/detalhes")

stf_download_sheet(incidentes, "data-raw/movimentacao")


informacoes <- read_stf_information(path = "data-raw/informacoes")

detalhes <- read_stf_details(path = "data-raw/detalhes")

partes <- read_stf_parties(path = "data-raw/partes")

movimentacao <- read_stf_docket_sheet(path = "data-raw/movimentacao")

download_stf_rtf(movimentacao,path = "data-raw/rtfs")

arquivos <- list.files("data-raw/rtfs", full.names = TRUE)

rtf <- read_stf_rtf(arquivos)
