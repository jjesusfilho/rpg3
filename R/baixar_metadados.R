library(stf)


stf_download_information("2635061", dir = "data-raw/informacoes")

stf_download_parties("2635061","data-raw/partes")

stf_download_details("2635061","data-raw/detalhes")

stf_download_sheet("2635061", "data-raw/movimentacao")


informacoes <- read_stf_information(path = "data-raw/informacoes")

detalhes <- read_stf_details(path = "data-raw/detalhes")

partes <- read_stf_parties(path = "data-raw/partes")

movimentacao <- read_stf_docket_sheet(path = "data-raw/movimentacao")

download_stf_rtf(movimentacao,path = "data-raw/rtfs")

arquivos <- list.files("data-raw/rtfs", full.names = TRUE)

rtf <- read_stf_rtf(arquivos)
