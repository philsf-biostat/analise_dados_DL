## Teste de Mann-Whitney pareado ####
dados.num <- read.table("../dataset/dadosnum.dat")
attach(dados.num)
# getOption("digits") # default = 7
# options(digits = 4)

vars <- c("VITD","ADP","CTX","FAO","LEP","OPG","TNF")
desfecho <- c("aumentou","aumentou","diminuiu","diminuiu","diminuiu","aumentou","diminuiu")
df <- data.frame(Variável=vars, Desfecho=desfecho,"p-valor"=seq(1,7))

df[df$Variável == "VITD",]$p.valor <- wilcox.test(VITAMINAD.FINAL,VITAMINAD.BASAL, paired = T, alternative = "g")$p.value
df[df$Variável == "ADP",]$p.valor <- wilcox.test(ADIPONECTINA.FINAL,ADIPONECTINA.BASAL, paired = T, alternative = "g")$p.value
df[df$Variável == "CTX",]$p.valor <- wilcox.test(CTX.FINAL,CTX.BASAL, paired = T, alternative = "l")$p.value
df[df$Variável == "FAO",]$p.valor <- wilcox.test(FAO.FINAL,FAO.BASAL, paired = T, alternative = "l")$p.value
df[df$Variável == "LEP",]$p.valor <- wilcox.test(LEPTINA.FINAL,LEPTINA.BASAL, paired = T, alternative = "l")$p.value
df[df$Variável == "OPG",]$p.valor <- wilcox.test(OPG.FINAL,OPG.BASAL, paired = T, alternative = "g")$p.value
df[df$Variável == "TNF",]$p.valor <- wilcox.test(TNFALFA.FINAL,TNFALFA.BASAL, paired = T, alternative = "l")$p.value

write.table(df,file = "../resultados/diferencas.dat")
detach(dados.num)
rm(dados.num,df,vars,desfecho)

## (curiosidade) Diferenças por medicamento? ####
## t.test(margarida$VITAMINAD.BASAL[Medicamento=="Aclasta"],margarida$VITAMINAD.BASAL[Medicamento=="Fosamax"])
t.test(margarida$VITAMINAD.FINAL[Medicamento=="Aclasta"],margarida$VITAMINAD.FINAL[Medicamento=="Fosamax"])
wilcox.test(margarida$VITAMINAD.FINAL[Medicamento=="Aclasta"],margarida$VITAMINAD.FINAL[Medicamento=="Fosamax"])

## t.test(margarida$OPG.BASAL[Medicamento=="Aclasta"],margarida$OPG.BASAL[Medicamento=="Fosamax"])
t.test(margarida$OPG.FINAL[Medicamento=="Aclasta"],margarida$OPG.FINAL[Medicamento=="Fosamax"])
wilcox.test(margarida$OPG.FINAL[Medicamento=="Aclasta"],margarida$OPG.FINAL[Medicamento=="Fosamax"])

## t.test(margarida$LEPTINA.BASAL[Medicamento=="Aclasta"],margarida$LEPTINA.BASAL[Medicamento=="Fosamax"])
t.test(margarida$LEPTINA.FINAL[Medicamento=="Aclasta"],margarida$LEPTINA.FINAL[Medicamento=="Fosamax"])
wilcox.test(margarida$LEPTINA.FINAL[Medicamento=="Aclasta"],margarida$LEPTINA.FINAL[Medicamento=="Fosamax"])

## t.test(margarida$ADIPONECTINA.BASAL[Medicamento=="Aclasta"],margarida$ADIPONECTINA.BASAL[Medicamento=="Fosamax"])
t.test(margarida$ADIPONECTINA.FINAL[Medicamento=="Aclasta"],margarida$ADIPONECTINA.FINAL[Medicamento=="Fosamax"])
wilcox.test(margarida$ADIPONECTINA.FINAL[Medicamento=="Aclasta"],margarida$ADIPONECTINA.FINAL[Medicamento=="Fosamax"])

## Obsoletos ####
# ## Teste t pareado
# t.test(ADIPONECTINA.FINAL,ADIPONECTINA.BASAL, paired = T,alternative = "g")
# t.test(CTX.FINAL,CTX.BASAL, paired = T, alternative = "l")
# #with(margarida.long,t.test(CTX~time, paired=T, alternative="g"))
# t.test(FAO.FINAL,FAO.BASAL, paired = T, alternative = "l")
# t.test(LEPTINA.FINAL,LEPTINA.BASAL, paired = T, alternative = "l")
# t.test(OPG.FINAL,OPG.BASAL, paired = T, alternative = "g")
# t.test(TNFALFA.FINAL,TNFALFA.BASAL, paired = T, alternative = "l")
