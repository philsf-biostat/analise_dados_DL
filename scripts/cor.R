## Correlações entre VitD e marcadores (ambos final) ####
dados.num <- read.table("../dataset/dadosnum.dat")
cor.fun <- function(x) c(cor.test(VITAMINAD.FINAL,x,method="spearman")$estimate,cor.test(VITAMINAD.FINAL,x,method="spearman")$p.value)
ct <- vapply(dados.num, cor.fun,c("rho" = 0,"p-valor" = 0))
ct <- round(ct, digits = 4)
ct <- t(ct)
ct<-ct[c("ADIPONECTINA.FINAL","CTX.FINAL","FAO.FINAL","LEPTINA.FINAL","OPG.FINAL","TNFALFA.FINAL"),]

write.table(ct,file = "../resultados/cortest.dat")
rm(ct,cor.fun)

## Correlações entre valores basal e final ####
cor.test(VITAMINAD.BASAL,VITAMINAD.FINAL,method="spearman") # Vitamina D

cor.test(ADIPONECTINA.BASAL,ADIPONECTINA.FINAL,method="spearman") # ADIPONECTINA
cor.test(CTX.BASAL,CTX.FINAL,method="spearman") # CTX
cor.test(FAO.BASAL,FAO.FINAL,method="spearman") # FAO
cor.test(LEPTINA.BASAL,LEPTINA.FINAL,method="spearman") # LEPTINA
cor.test(OPG.BASAL,OPG.FINAL,method="spearman") # OSTEOPROTEGERINA
cor.test(TNFALFA.BASAL,TNFALFA.FINAL,method="spearman") # TNFALFA

## Obsoletos ####
# ## Teste de correlação entre VitD e marcadores (ambos nível final)
# cor.test(VITAMINAD.FINAL,ADIPONECTINA.FINAL,method="spearman") # ADP
# cor.test(VITAMINAD.FINAL,CTX.FINAL,method="spearman") # CTX
# cor.test(VITAMINAD.FINAL,FAO.FINAL,method="spearman") # FAO
# cor.test(VITAMINAD.FINAL,LEPTINA.FINAL,method="spearman") # LEPTINA
# cor.test(VITAMINAD.FINAL,OPG.FINAL,method="spearman") # OPG
# cor.test(VITAMINAD.FINAL,TNFALFA.FINAL,method="spearman") # TNF
