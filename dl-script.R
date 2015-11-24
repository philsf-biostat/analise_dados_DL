detach(margarida)
margarida<-read.csv("BANCO PÓS QUALIFICAÇÃO 06_10_15.csv", header = T)

# Guardando apenas as variáveis que serão utilizadas
margarida<-margarida[c("Ordem","Sexo","Medicamento","VITAMINAD.BASAL","VITAMINAD.FINAL","ADIPONECTINA.BASAL","ADIPONECTINA.FINAL","CTX.BASAL","CTX.FINAL","FAO.BASAL","FAO.FINAL","LEPTINA.BASAL","LEPTINA.FINAL","OPG.BASAL","OPG.FINAL","TNFALFA.BASAL","TNFALFA.FINAL")]

# Retirando os pacientes do medicamento Protos
margarida<-margarida[margarida$Medicamento!="Protos",]
margarida<-droplevels(margarida)

## # Retirando o paciente P5, outlier do FAO basal
## margarida<-margarida[c(margarida$Ordem!="P5"),]

#convertendo de wide para long
margarida.wide <- margarida
margarida.long <- reshape(margarida, varying=c("ADIPONECTINA.BASAL", "ADIPONECTINA.FINAL", "CTX.BASAL", "CTX.FINAL", "FAO.BASAL", "FAO.FINAL", "LEPTINA.BASAL","LEPTINA.FINAL","OPG.BASAL","OPG.FINAL","TNFALFA.BASAL","TNFALFA.FINAL", "VITAMINAD.BASAL", "VITAMINAD.FINAL"), idvar="Ordem", direction="long")
# margarida<-margarida.long
# rm(margarida)

attach(margarida.wide)
attach(margarida.long)

