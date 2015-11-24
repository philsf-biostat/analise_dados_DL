detach(margarida)
margarida<-read.csv("BANCO PÓS QUALIFICAÇÃO 06_10_15.csv", header = T)

# Guardando apenas as variáveis que serão utilizadas
#margarida<-margarida[c("Ordem","Sexo","Medicamento","VITAMINAD.BASAL","VITAMINAD.FINAL","ADIPONECTINA.BASAL","ADIPONECTINA.FINAL","CTX.BASAL","CTX.FINAL","FAO.BASAL","FAO.FINAL","LEPTINA.BASAL","LEPTINA.FINAL","OPG.BASAL","OPG.FINAL","TNFALFA.BASAL","TNFALFA.FINAL","CALCIO.BASAL","CALCIO.FINAL")]
margarida<-margarida[c("Ordem","Sexo","Medicamento","VITAMINAD.BASAL","VITAMINAD.FINAL","ADIPONECTINA.BASAL","ADIPONECTINA.FINAL","CTX.BASAL","CTX.FINAL","FAO.BASAL","FAO.FINAL","LEPTINA.BASAL","LEPTINA.FINAL","OPG.BASAL","OPG.FINAL","TNFALFA.BASAL","TNFALFA.FINAL")]

# Retirando os pacientes do medicamento Protos
margarida<-margarida[margarida$Medicamento!="Protos",]
margarida<-droplevels(margarida)

# Retirando o paciente P5, outlier do FAO basal
margarida<-margarida[c(margarida$Ordem!="P5"),]

#convertendo de wide para long
margarida.wide <- margarida
margarida.long <- reshape(margarida, varying=c("ADIPONECTINA.BASAL", "ADIPONECTINA.FINAL", "CTX.BASAL", "CTX.FINAL", "FAO.BASAL", "FAO.FINAL", "LEPTINA.BASAL","LEPTINA.FINAL","OPG.BASAL","OPG.FINAL","TNFALFA.BASAL","TNFALFA.FINAL", "VITAMINAD.BASAL", "VITAMINAD.FINAL"), idvar="Ordem", direction="long")
# margarida<-margarida.long
# rm(margarida)

attach(margarida.wide)
attach(margarida.long)

## Diferenças por medicamento?
t.test(margarida$VITAMINA.D.BASAL[Medicamento=="Aclasta"],margarida$VITAMINA.D.BASAL[Medicamento=="Fosamax"])
wilcox.test(margarida$VITAMINA.D.BASAL[Medicamento=="Aclasta"],margarida$VITAMINA.D.BASAL[Medicamento=="Fosamax"])

t.test(margarida$OPG.BASAL[Medicamento=="Aclasta"],margarida$OPG.BASAL[Medicamento=="Fosamax"])
t.test(margarida$OPG.FINAL[Medicamento=="Aclasta"],margarida$OPG.FINAL[Medicamento=="Fosamax"])

t.test(margarida$LEPTINA.BASAL[Medicamento=="Aclasta"],margarida$LEPTINA.BASAL[Medicamento=="Fosamax"])
t.test(margarida$LEPTINA.FINAL[Medicamento=="Aclasta"],margarida$LEPTINA.FINAL[Medicamento=="Fosamax"])

t.test(margarida$ADIPONECTINA.BASAL[Medicamento=="Aclasta"],margarida$ADIPONECTINA.BASAL[Medicamento=="Fosamax"])
t.test(margarida$ADIPONECTINA.FINAL[Medicamento=="Aclasta"],margarida$ADIPONECTINA.FINAL[Medicamento=="Fosamax"])

## Correlações entre valores basal e final
cor(VITAMINA.D.BASAL,VITAMINA.D.FINAL) # Vitamina D

cor(ADIPONECTINA.BASAL,ADIPONECTINA.FINAL) # ADIPONECTINA
cor(CTX.BASAL,CTX.FINAL) # CTX
cor(FAO.BASAL,FAO.FINAL) # FAO
cor(LEPTINA.BASAL,LEPTINA.FINAL) # LEPTINA
cor(OPG.BASAL,OPG.FINAL) # OSTEOPROTEGERINA
cor(TNF.ALFA.BASAL,TNF.ALFA.FINAL) # TNF.a

## Regressões: Final ~ Basal + Vitamina(??)
# VITAMINA D
fit.vit<-lm(VITAMINA.D.FINAL~VITAMINA.D.BASAL)
summary(fit.vit)
plot(VITAMINA.D.BASAL,VITAMINA.D.FINAL)
abline(fit.vit)

par(mfrow=c(2,3))

# ADIPONECTINA
fit.adp<-lm(ADIPONECTINA.FINAL~ADIPONECTINA.BASAL)
summary(fit.adp)
plot(ADIPONECTINA.BASAL,ADIPONECTINA.FINAL)
abline(fit.adp)

# CTX
fit.ctx<-lm(CTX.FINAL~CTX.BASAL)
summary(fit.ctx)
plot(CTX.BASAL,CTX.FINAL)
abline(fit.ctx)

# FAO
fit.fao<-lm(FAO.FINAL~FAO.BASAL)
summary(fit.fao)
plot(FAO.BASAL,FAO.FINAL)
abline(fit.fao)

#LEPTINA
fit.lep<-lm(LEPTINA.FINAL~LEPTINA.BASAL)
summary(fit.lep)
plot(LEPTINA.BASAL,LEPTINA.FINAL)
abline(fit.lep)

# OSTEOPROTEGERINA
fit.opg<-lm(OPG.FINAL~OPG.BASAL)
summary(fit.opg)
plot(OPG.BASAL,OPG.FINAL)
abline(fit.opg)

# TNF
fit.tnf<-lm(TNF.ALFA.FINAL~TNF.ALFA.BASAL)
summary(fit.tnf)
plot(TNF.ALFA.BASAL,TNF.ALFA.FINAL)
abline(fit.tnf)

## Busca de regressão múltipla
bigfit<-lm(CALCIO.FINAL ~ OPG.BASAL + OPG.FINAL + VITAMINA.D.FINAL + VITAMINA.D.BASAL + ADIPONECTINA.BASAL + ADIPONECTINA.FINAL + CTX.BASAL + CTX.FINAL + FAO.BASAL + FAO.FINAL + LEPTINA.BASAL + LEPTINA.FINAL + TNF.ALFA.BASAL + TNF.ALFA.FINAL)
summary(bigfit)

## Teste de Mann-Whitney pareado
wilcox.test(ADIPONECTINA.BASAL,ADIPONECTINA.FINAL,paired = T)
wilcox.test(CTX.BASAL,CTX.FINAL,paired = T)
wilcox.test(FAO.BASAL,FAO.FINAL,paired = T)
wilcox.test(LEPTINA.BASAL,LEPTINA.FINAL,paired = T)
wilcox.test(OPG.BASAL,OPG.FINAL,paired = T)
wilcox.test(TNF.ALFA.BASAL,TNF.ALFA.FINAL,paired = T)

## Teste t pareado
t.test(ADIPONECTINA.FINAL,ADIPONECTINA.BASAL, paired = T,alternative = "g")
t.test(CTX.FINAL,CTX.BASAL,paired = T, alternative = "l")
#with(margarida.long,t.test(CTX~time, paired=T, alternative="g"))
t.test(FAO.FINAL,FAO.BASAL,paired = T, alternative = "l")
t.test(LEPTINA.FINAL,LEPTINA.BASAL,paired = T, alternative = "l")
t.test(OPG.FINAL,OPG.BASAL,paired = T, alternative = "g")
t.test(TNF.ALFA.FINAL,TNF.ALFA.BASAL,paired = T,alternative = "l")

## Teste de Breuch Pagan (heterocedasticidade)
library(lmtest)
bptest(fit.vit)
bptest(fit.adp)
bptest(fit.ctx)
bptest(fit.fao)
bptest(fit.lep)
bptest(fit.opg)
bptest(fit.tnf)
