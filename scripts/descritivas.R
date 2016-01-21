## Sumário básico ####
summary(margarida.wide,digits = 2)

## Variáveis numéricas ####
# options(digits = 3)
dados.num <- margarida.wide[c("VITAMINAD.BASAL","VITAMINAD.FINAL","ADIPONECTINA.BASAL","ADIPONECTINA.FINAL","CTX.BASAL","CTX.FINAL","FAO.BASAL","FAO.FINAL","LEPTINA.BASAL","LEPTINA.FINAL","OPG.BASAL","OPG.FINAL","TNFALFA.BASAL","TNFALFA.FINAL")]
desc.fun <- function(x) c(mean(x),sd(x),median(x),IQR(x))
desc.num <- vapply(dados.num,desc.fun,c("Média" = 0, "DP" = 0, "Mediana" = 0, "AIQ" = 0) )
desc.num <- t(round(desc.num,digits = 2 ))

write.table(desc.num,file = "../resultados/descritivas.dat")

## Tabela Markdown ####
knitr::kable(desc.num)
