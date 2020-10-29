getwd()
list.files()
head(PDAD_2018_mor2018_31ras)
str(PDAD_2018_mor2018_31ras)
PDAD_2018_mor2018_31ras$POP_AJUSTADA_PROJ
PDAD_2018_mor2018_31ras[,"F07"]
table(PDAD_2018_mor2018_31ras$POP_AJUSTADA_PROJ)

library(dplyr)
PDAD_2018_mor2018_31ras %>%
  dplyr::filter(A01nFicha==1) %>%
  dplyr::select(A01nFicha)


colnames(PDAD_2018_mor2018_31ras)[2] <- "A01ra"
colnames(PDAD_2018_mor2018_31ras)
