##########Questão 1
############################################

# Letra A - Estado Civil - Gráfico de barras
barplot(table(Questao1$EstadoCivil), 
        col = "darkblue",
        space=0.5, width=c(.2,.2),
        main="Gráfico de barras - Estado Civil",
        xlab="Estado Civil", ylab="Frequência", )


# Letra B - Região de procedência - Gráfico de barras
barplot(table(Questao1$RegiaoProcedencia),
        ylim=c(0,14), col = "darkblue",
        space=0.5, width=c(.2,.2),
        main="Gráfico de barras - Região de procedência",
        xlab="Região", ylab="Frequência", )


# Letra C - Filtro de casados
library(dplyr)
NumeroFilhos <- (
  Questao1 %>%
  dplyr::filter(EstadoCivil=="casado") %>%
  dplyr::select(NdeFilhos)
)

# Letra C - Filhos - Histograma
hist(NumeroFilhos$NdeFilhos, col = "darkblue", xlab = "Número de Filhos", 
     ylab = "Frequência", border = "white", main = "Histograma - Número de Filhos",
     breaks=5, ylim=c(0, 10))    


# Letra C - Filhos - Gráfico de dispersão unidimensional 
stripchart(NumeroFilhos$NdeFilhos, method = "stack", offset = 2, at=0, pch=19, 
           col="darkblue", ylab=NA, xlab = "Número de Filhos", cex=1)  

# Letra D - IDADE - Gráfico de dispersão unidimensional 
stripchart(Questao1$Anos, method = "stack", offset = 2, at=0, pch=19, 
           col="darkblue", ylab=NA, xlab = "Idade", cex=1)  

# Letra D - IDADE - Histograma
hist(Questao1$Anos, col = "darkblue", xlab = "Idade", ylab = "Frequência", 
     border = "white", main = "Histograma -  Idade")   

##########Questão 2
############################################
## Média, variância, máximo e mínimo e mediana população
summary(Questao2$População)
var(Questao2$População)


## Média, variância, máximo e mínimo e mediana população
summary(Questao2$Densidade)
var(Questao2$Densidade)

##########Questão 3
############################################
classes3<-c("0-2","2-4","4-6","6-8","8-10")
hist(Questao3$TxCrescimentoPopulacao[Questao3$TxCrescimentoPopulacao >= 1 & Questao3$TxCrescimentoPopulacao < 9], 
     col = "darkblue", xlab = "Taxa de Crescimento", 
     ylab = "Densidade", border = "white", main = "Taxa de Crescimento da População", prob=T,
     labels=classes3, breaks=seq(0,10,2), ylim=c(0, 0.25))  


##########Questão 4
############################################
# Letra A - Construa os histogramas das duas distribuições.
library(FSA)
library(dplyr)
##Zona Urbana
## Selecionando colunas
Tabela4 <- Questao4 %>% select(ClassesAlugueis, ZonaUrbana) %>% slice(1:5)
classe4 <- as.numeric(sub("\u2c75.*", "", Tabela4$`ClassesAlugueis`))
Tabela4$ClassesAlugueis <- classe4

##	Histograma Aluguéis - Zona Urbana
histFromSum(Tabela4$ClassesAlugueis, Tabela4$ZonaUrbana, col = "darkblue", border = "white",
            xlim = c(1,16), xlab = "Classe de Aluguéis", main = "Histograma - Aluguéis Zona Urbana",
            ylab = "Densidade", freq = FALSE, breaks = c(classe4, 15), )


##Zona Rural
## Selecionando colunas
Tabela41 <- Questao4 %>% select(ClassesAlugueis, ZonaRural) %>% slice(1:5)
classe41 <- as.numeric(sub("\u2c75.*", "", Tabela41$`ClassesAlugueis`))
Tabela41$ClassesAlugueis <- classe41

##	Histograma Aluguéis - Zona Rural
histFromSum(Tabela41$ClassesAlugueis, Tabela41$ZonaRural, col = "darkblue", border = "white",
            xlim = c(1,16), xlab = "Classe de Aluguéis", main = "Histograma - Aluguéis Zona Rural",
            ylab = "Densidade", freq = FALSE, breaks = c(classe41, 15))

# Letra C - Calcule a média, q1, mediana, q3, mínimo e máximo da distribuição
# Distirbuição Urbana
vetor_1 = as.numeric(sub("\u2c75.*", "", Questao4$ClassesAlugueis))
vetor_2 = as.numeric(sub(".*\u2c75", "", Questao4$ClassesAlugueis))
PontoMedio = (vetor_1 + vetor_2)/2
DadosUrb <- rep(PontoMedio, Questao4$ZonaUrbana)
summary(DadosUrb)

# Distirbuição Rural
vetor_1 = as.numeric(sub("\u2c75.*", "", Questao4$ClassesAlugueis))
vetor_2 = as.numeric(sub(".*\u2c75", "", Questao4$ClassesAlugueis))
PontoMedio = (vetor_1 + vetor_2)/2
DadosRural <- rep(PontoMedio, Questao4$ZonaRural)
summary(DadosRural)

##########Questão 5
############################################
#Carregar Tabela
library(readxl)
Questao5IPCASubitens <- read_excel("Dados/Questao5.xlsx", 
                                   sheet = "Questão5IPCASubitens", na = "-")

library(readxl)
Questao5PesosSubitens <- read_excel("Dados/Questao5.xlsx", 
                                    sheet = "Questão5PesosSubitens", na = "-")
library(DescTools)
# Letra A - Calcule a 1º. Quartil, mediana, 3º. Quartil, o máximo e mínimo do IPC - subitens
# para BH, DF e Brasil 

#BH
Summarize(Questao5IPCASubitens$BH)

#DF
Summarize(Questao5IPCASubitens$DF)

#Brasil
Summarize(Questao5IPCASubitens$NACIONAL)

# Letra B - Média ponderada das variações dos subitens pelos pesos dos subitens 
# BH, DF e Brasil
#BH
VetorBH_1 =  Questao5IPCASubitens$BH
VetorBH_2 = Questao5PesosSubitens$BH
weighted.mean(VetorBH_1, VetorBH_2, na.rm=TRUE)

#DF 
VetorDF_1 =  Questao5IPCASubitens$DF
VetorDF_2 = Questao5PesosSubitens$DF
weighted.mean(VetorDF_1, VetorDF_2, na.rm=TRUE)

#Brasil
VetorNAC_1 =  Questao5IPCASubitens$NACIONAL
VetorNAC_2 = Questao5PesosSubitens$NACIONAL  
weighted.mean(VetorNAC_1, VetorNAC_2, na.rm=TRUE)

# Letra C - Média aparada de 5% e 10% 
# BH, DF e Brasil
#BH
VetorBH_1 =  Questao5IPCASubitens$BH
VetorBH_2 = Questao5PesosSubitens$BH
VetorBHPonderado <- (VetorBH_1 * VetorBH_2)
sum(Trim(VetorBHPonderado, trim=0.05, na.rm = TRUE))/100
sum(Trim(VetorBHPonderado, trim=0.10, na.rm = TRUE))/100


#DF
VetorDF_1 =  Questao5IPCASubitens$DF
VetorDF_2 = Questao5PesosSubitens$DF
VetorDFPonderado <- (VetorDF_1 * VetorDF_2)
sum(Trim(VetorDFPonderado, trim=0.05, na.rm = TRUE))/100
sum(Trim(VetorDFPonderado, trim=0.10, na.rm = TRUE))/100

# Brasil
library(DescTools)
VetorNAC_1 =  Questao5IPCASubitens$NACIONAL
VetorNAC_2 = Questao5PesosSubitens$NACIONAL  
VetorNACPonderado <- (VetorNAC_1 * VetorNAC_2)
sum(Trim(VetorNACPonderado, trim=0.05, na.rm = TRUE))/100
sum(Trim(VetorNACPonderado, trim=0.10, na.rm = TRUE))/100


#### Média Aparada simples:
#mean(VetorNACPonderado, trim = 0.10, na.rm = TRUE)
#mean(VetorNACPonderado, trim = 0.05, na.rm = TRUE)

# BH
#mean(Questao5IPCASubitens$BH, trim = 0.05, na.rm = TRUE)
#mean(Questao5IPCASubitens$BH, trim = 0.10, na.rm = TRUE)

# DF
#mean(Questao5IPCASubitens$DF, trim = 0.05, na.rm = TRUE)
#mean(Questao5IPCASubitens$DF, trim = 0.10, na.rm = TRUE)

# Brasil
#mean(Questao5IPCASubitens$NACIONAL, trim = 0.05, na.rm = TRUE)
#mean(Questao5IPCASubitens$NACIONAL, trim = 0.10, na.rm = TRUE)






