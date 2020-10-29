#install.packages("tidyverse") # Instalar o pacote "tidyverse"
library(tidyverse) # Carregar o pacote "tidyverse"

pacotes <- c("tidyverse","data.table","Hmisc","lubridate",
             "ggrepel","sf","sidrar","survey",
             "srvyr","scales","ggthemr","readxl",
             "kableExtra","psych","xtable")


if(length(setdiff(pacotes,installed.packages()))==0){}else{
  
  install.packages(setdiff(pacotes,installed.packages()))
  
}

#devtools::install_github('cttobin/ggthemr')
