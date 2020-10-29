#Questão 1 

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
NumeroFilho <- (
  Questao1 %>%
  dplyr::filter(EstadoCivil=="casado") %>%
  dplyr::select(NdeFilhos)
)

# Letra C - Filhos - Histograma
hist(NumeroFilho$NdeFilhos, col = "darkblue", xlab = "Número de Filhos", 
     ylab = "Frequência", border = "white", main = "Número de Filhos")   

# Letra C - Filhos - Gráfico de dispersão unidimensional 
stripchart(NumeroFilho$NdeFilhos, method = "stack", offset = 2, at=0, pch=19, 
           col="darkblue", ylab=NA, xlab = "Número de Filhos", cex=1)  

# Letra D - IDADE - Gráfico de dispersão unidimensional 
stripchart(Questao1$Anos, method = "stack", offset = 2, at=0, pch=19, 
           col="darkblue", ylab=NA, xlab = "Idade", cex=1)  

# Letra D - IDADE - Histograma
hist(Questao1$Anos, col = "darkblue", xlab = "Idade", ylab = "Frequência", 
     border = "white", main = "Histograma -  Idade")   


