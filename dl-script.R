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

## Teste de Breuch Pagan (heterocedasticidade)
library(lmtest)
bptest(fit.vit)
bptest(fit.adp)
bptest(fit.ctx)
bptest(fit.fao)
bptest(fit.lep)
bptest(fit.opg)
bptest(fit.tnf)
