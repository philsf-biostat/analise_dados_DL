## Teste de Mann-Whitney pareado
wilcox.test(VITAMINAD.FINAL,VITAMINAD.BASAL, paired = T, alternative = "g")
wilcox.test(ADIPONECTINA.FINAL,ADIPONECTINA.BASAL, paired = T, alternative = "g")
wilcox.test(CTX.FINAL,CTX.BASAL, paired = T, alternative = "l")
wilcox.test(FAO.FINAL,FAO.BASAL, paired = T, alternative = "l")
wilcox.test(LEPTINA.FINAL,LEPTINA.BASAL, paired = T, alternative = "l")
wilcox.test(OPG.FINAL,OPG.BASAL, paired = T, alternative = "g")
wilcox.test(TNFALFA.FINAL,TNFALFA.BASAL, paired = T, alternative = "l")

## Teste t pareado
t.test(ADIPONECTINA.FINAL,ADIPONECTINA.BASAL, paired = T,alternative = "g")
t.test(CTX.FINAL,CTX.BASAL, paired = T, alternative = "l")
#with(margarida.long,t.test(CTX~time, paired=T, alternative="g"))
t.test(FAO.FINAL,FAO.BASAL, paired = T, alternative = "l")
t.test(LEPTINA.FINAL,LEPTINA.BASAL, paired = T, alternative = "l")
t.test(OPG.FINAL,OPG.BASAL, paired = T, alternative = "g")
t.test(TNFALFA.FINAL,TNFALFA.BASAL, paired = T, alternative = "l")

## (curiosidade) Diferenças por medicamento?
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

