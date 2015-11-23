detach(margarida)
margarida<-read.csv("BANCO PÓS QUALIFICAÇÃO 06_10_15.csv", header = T)

# Guardando apenas as variáveis que serão utilizadas
#margarida<-margarida[c("Ordem","Sexo","Medicamento","VITAMINA.D.BASAL","VITAMINA.D.FINAL","ADIPONECTINA.BASAL","ADIPONECTINA.FINAL","CTX.BASAL","CTX.FINAL","FAO.BASAL","FAO.FINAL","LEPTINA.BASAL","LEPTINA.FINAL","OPG.BASAL","OPG.FINAL","TNF.ALFA.BASAL","TNF.ALFA.FINAL","CALCIO.BASAL","CALCIO.FINAL")]
margarida<-margarida[c("Ordem","Medicamento","OPG.BASAL","OPG.FINAL")]
# Retirando os pacientes do medicamento Protos
margarida<-margarida[margarida$Medicamento!="Protos",]
margarida<-droplevels(margarida)

attach(margarida)

# convertendo de wide para long data
margarida.long <- reshape(margarida, varying=c("OPG.BASAL", "OPG.FINAL"), idvar="Ordem", direction="long")

m4<-lmer(OPG~time+(1+time|Medicamento),data=margarida.long)

par(mfrow=c(2,2))
plot(fitted(m4),resid(m4,type="pearson"),col="blue") #a plot to check the constant standard deviation
abline(h=0,lwd=2)
qqnorm(resid(m4)) #normality of the residuals
qqline(resid(m4))
qqnorm(ranef(m4)$Medicamento[,1])
qqline(ranef(m4)$Medicamento[,1])
qqnorm(ranef(m4)$Medicamento[,2])
qqline(ranef(m4)$Medicamento[,2])


dotplot(ranef(m3,condVar=T))