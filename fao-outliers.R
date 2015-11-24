summary(margarida[,c("FAO.BASAL","FAO.FINAL")])

par(mfrow=c(2,2))

boxplot(data.frame(Basal=FAO.BASAL,Final=FAO.FINAL),main="FAO",ylab="ug/L")

# FAO
fit.fao<-lm(FAO.FINAL~FAO.BASAL)
summary(fit.fao)
plot(FAO.BASAL,FAO.FINAL)
abline(fit.fao)

shapiro.test(FAO.BASAL)
shapiro.test(FAO.FINAL)

t.test(FAO.FINAL,FAO.BASAL,paired = T, alternative = "l")

margarida.long <- reshape(margarida, varying = c('FAO.BASAL', 'FAO.FINAL'), idvar = 'Ordem', direction = 'long')
ggplot(margarida.long, aes(x=time, y=FAO, group=Ordem)) + geom_line(alpha=.5)

detach(margarida)

# Retirando o paciente P5, outlier do FAO basal
margarida<-margarida[c(margarida$Ordem!="P5"),]

# Retirando o paciente P10, outlier do FAO final
margarida<-margarida[c(margarida$Ordem!="P10"),]
