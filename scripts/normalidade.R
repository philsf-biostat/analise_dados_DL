## Shapiro-Wilk ####
dados.num <- read.table("../dataset/dadosnum.dat")
n.fun <- function(x) c(shapiro.test(x)$p.value)
np <- sapply(dados.num, n.fun)
np <- round(np,digits = 4)
np <- data.frame('p-valor' = np)
names(np)<-"p-valor"
write.table(np,file = "../resultados/norm.dat")
rm(n.fun,np)

## Obsoletos ####
# ## Teste de Shapiro-Wilk
# shapiro.test(VITAMINAD.BASAL)
# shapiro.test(VITAMINAD.FINAL)
# 
# shapiro.test(ADIPONECTINA.BASAL)
# shapiro.test(ADIPONECTINA.FINAL)
# 
# shapiro.test(CTX.BASAL)
# shapiro.test(CTX.FINAL)
# 
# shapiro.test(FAO.BASAL)
# shapiro.test(FAO.FINAL)
# 
# shapiro.test(LEPTINA.BASAL)
# shapiro.test(LEPTINA.FINAL)
# 
# shapiro.test(OPG.BASAL)
# shapiro.test(OPG.FINAL)
# 
# shapiro.test(TNFALFA.BASAL)
# shapiro.test(TNFALFA.FINAL)
# 
# ## Teste de Anderson-Darling
# library(nortest)
# ad.test(VITAMINAD.BASAL)
# ad.test(VITAMINAD.FINAL)
# 
# ad.test(ADIPONECTINA.BASAL)
# ad.test(ADIPONECTINA.FINAL)
# 
# ad.test(CTX.BASAL)
# ad.test(CTX.FINAL)
# 
# ad.test(FAO.BASAL)
# ad.test(FAO.FINAL)
# 
# ad.test(LEPTINA.BASAL)
# ad.test(LEPTINA.FINAL)
# 
# ad.test(OPG.BASAL)
# ad.test(OPG.FINAL)
# 
# ad.test(TNFALFA.BASAL)
# ad.test(TNFALFA.FINAL)
# 
