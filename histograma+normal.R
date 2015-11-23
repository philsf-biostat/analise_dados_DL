x<-VITAMINA.D.BASAL
x<-VITAMINA.D.FINAL
x<-OPG.FINAL
x<-TNF.ALFA.FINAL
x<-LEPTINA.FINAL
x<-ADIPONECTINA.FINAL

grafico<- function (x,titulo) {
  h<-hist(x,xlab=titulo,main="")
  xfit<-seq(min(x),max(x),length=length(x))
  yfit<-dnorm(xfit,mean=mean(x),sd=sd(x))
  yfit <- yfit*diff(h$mids[1:2])*length(x)
  lines(xfit, yfit, col="blue", lwd=2)
}

grafico(VITAMINA.D.BASAL,"Vitamina D basal")
grafico(VITAMINA.D.FINAL,"Vitamina D final")

grafico(ADIPONECTINA.FINAL,"ADIPONECTINA final")
grafico(LEPTINA.FINAL,"LEPTINA final")

grafico(OPG.BASAL,"OPG basal")
grafico(OPG.FINAL,"OPG final")

grafico(TNF.ALFA.BASAL,"TNF-a basal")
grafico(TNF.ALFA.FINAL,"TNF-a final")
