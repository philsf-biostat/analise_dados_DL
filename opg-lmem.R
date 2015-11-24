## Testando modelos para a variável OPG (diagnóstico)
library(lme4)
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
