detach(margarida)
margarida<-read.csv("BANCO PÓS QUALIFICAÇÃO 06_10_15.csv", header = T)

# Guardando apenas as variáveis que serão utilizadas
#margarida<-margarida[c("Ordem","Sexo","Medicamento","VITAMINAD.BASAL","VITAMINAD.FINAL","ADIPONECTINA.BASAL","ADIPONECTINA.FINAL","CTX.BASAL","CTX.FINAL","FAO.BASAL","FAO.FINAL","LEPTINA.BASAL","LEPTINA.FINAL","OPG.BASAL","OPG.FINAL","TNFALFA.BASAL","TNFALFA.FINAL","CALCIO.BASAL","CALCIO.FINAL")]
margarida<-margarida[c("Ordem","Sexo","Medicamento","VITAMINAD.BASAL","VITAMINAD.FINAL","ADIPONECTINA.BASAL","ADIPONECTINA.FINAL","CTX.BASAL","CTX.FINAL","FAO.BASAL","FAO.FINAL","LEPTINA.BASAL","LEPTINA.FINAL","OPG.BASAL","OPG.FINAL","TNFALFA.BASAL","TNFALFA.FINAL")]

# Retirando os pacientes do medicamento Protos
margarida<-margarida[margarida$Medicamento!="Protos",]
margarida<-droplevels(margarida)

attach(margarida)

#convertendo de wide para long
margarida.wide <- margarida
margarida.long <- reshape(margarida, varying=c("ADIPONECTINA.BASAL", "ADIPONECTINA.FINAL", "CTX.BASAL", "CTX.FINAL", "FAO.BASAL", "FAO.FINAL", "LEPTINA.BASAL","LEPTINA.FINAL","OPG.BASAL","OPG.FINAL","TNFALFA.BASAL","TNFALFA.FINAL", "VITAMINAD.BASAL", "VITAMINAD.FINAL"), idvar="Ordem", direction="long")
# margarida<-margarida.long
rm(margarida)
# margarida.long$time <-ordered(margarida.long$time)

library(nlme)
m1<-lme(ADIPONECTINA ~ time, random = ~ time |  VITAMINAD, data=margarida)
m2<-lme(ADIPONECTINA~time+VITAMINAD+(1+time|Medicamento),data=margarida.long)

lme(ADIPONECTINA ~ time, random = ~ time |  VITAMINAD, data=margarida.long)
lme(LEPTINA ~ time, random = ~ time |  VITAMINAD, data=margarida.long)
lme(CTX ~ time, random = ~ time |  VITAMINAD, data=margarida.long)

library(lmerTest)
m1<-lmer(ADIPONECTINA~time+(1+time|Medicamento),data=margarida.long)
m2<-lmer(ADIPONECTINA~time+VITAMINAD+(1+time|Medicamento),data=margarida.long)
m3<-lmer(ADIPONECTINA~time*Medicamento+(1+time|Medicamento),data=margarida.long)
m4<-lmer(ADIPONECTINA~time+(1+time|Medicamento),data=margarida.long)

m1<-lmer(log2(CTX)~time+(1+time|Medicamento),data=margarida.long)
m2<-lmer(log2(CTX)~time+log10(VITAMINAD)+(1+time|Medicamento),data=margarida.long)
m3<-lmer(log2(CTX)~time+Sexo+(1+time|Medicamento),data=margarida.long)
m4<-lmer(log2(CTX)~time+log10(VITAMINAD)+Sexo+(1+time|Medicamento),data=margarida.long)
m5<-lmer(log2(CTX)~time+log10(VITAMINAD)+Sexo+(1+time|Sexo),data=margarida.long)

# with(margarida.long,t.test(log2(CTX)~time, paired=T, alternative="g"))
# with(margarida.long,t.test(log10(VITAMINAD)~time, paired=T, alternative="l"))

anova(m1,m2,m3,m4,m5)

m1<-lmer(FAO~time+(1+time|Medicamento),data=margarida.long)
m2<-lmer(FAO~time+VITAMINAD+(1+time|Medicamento),data=margarida.long)
m3<-lmer(FAO~time*Medicamento+(1+time|Medicamento),data=margarida.long)
m4<-lmer(FAO~time+(1+time|Medicamento),data=margarida.long)

m1<-lmer(LEPTINA~time+(1+time|Medicamento),data=margarida.long)
m2<-lmer(LEPTINA~time+VITAMINAD+(1+time|Medicamento),data=margarida.long)
m3<-lmer(LEPTINA~time*Medicamento+(1+time|Medicamento),data=margarida.long)
m4<-lmer(LEPTINA~time+(1+time|Medicamento),data=margarida.long)

m1<-lmer(TNFALFA~time+(1+time|Medicamento),data=margarida.long)
m2<-lmer(TNFALFA~time+VITAMINAD+(1+time|Medicamento),data=margarida.long)
m3<-lmer(TNFALFA~time*Medicamento+(1+time|Medicamento),data=margarida.long)
m4<-lmer(TNFALFA~time+(1+time|Medicamento),data=margarida.long)


# 
# # adicionando a coluna vitd
# margarida.long["VITAMINA.D"]<-vitd

library(lmerTest)


summary(m1)
summary(m2)
summary(m3)
summary(m4)

boxcox(m1)
boxcox(m2)

## Gráficos diagnósticos
par(mfrow=c(2,2))
plot(fitted(m4),resid(m4,type="pearson"),col="blue") #a plot to check the constant standard deviation
abline(h=0,lwd=2)
qqnorm(resid(m4)) #normality of the residuals
qqline(resid(m4))
qqnorm(ranef(m4)$Medicamento[,1])
qqline(ranef(m4)$Medicamento[,1])
qqnorm(ranef(m4)$Medicamento[,2])
qqline(ranef(m4)$Medicamento[,2])


dotplot(ranef(m4,condVar=T))
