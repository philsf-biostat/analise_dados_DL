## Correlações entre valores basal e final
cor(VITAMINAD.BASAL,VITAMINAD.FINAL) # Vitamina D

cor(ADIPONECTINA.BASAL,ADIPONECTINA.FINAL,method="spearman") # ADIPONECTINA
cor(CTX.BASAL,CTX.FINAL,method="spearman") # CTX
cor(FAO.BASAL,FAO.FINAL,method="spearman") # FAO
cor(LEPTINA.BASAL,LEPTINA.FINAL,method="spearman") # LEPTINA
cor(OPG.BASAL,OPG.FINAL,method="spearman") # OSTEOPROTEGERINA
cor(TNFALFA.BASAL,TNFALFA.FINAL,method="spearman") # TNFALFA

## Correlação entre VitD e marcadores (ambos nível final)
cor(VITAMINAD.FINAL,ADIPONECTINA.FINAL,method="spearman") # ADP
cor(VITAMINAD.FINAL,CTX.FINAL,method="spearman") # CTX
cor(VITAMINAD.FINAL,FAO.FINAL,method="spearman") # FAO
cor(VITAMINAD.FINAL,LEPTINA.FINAL,method="spearman") # LEPTINA
cor(VITAMINAD.FINAL,OPG.FINAL,method="spearman") # OPG
cor(VITAMINAD.FINAL,TNFALFA.FINAL,method="spearman") # TNF

## Teste de correlação entre VitD e marcadores (ambos nível final)
cor.test(VITAMINAD.FINAL,ADIPONECTINA.FINAL,method="spearman") # ADP
cor.test(VITAMINAD.FINAL,CTX.FINAL,method="spearman") # CTX
cor.test(VITAMINAD.FINAL,FAO.FINAL,method="spearman") # FAO
cor.test(VITAMINAD.FINAL,LEPTINA.FINAL,method="spearman") # LEPTINA
cor.test(VITAMINAD.FINAL,OPG.FINAL,method="spearman") # OPG
cor.test(VITAMINAD.FINAL,TNFALFA.FINAL,method="spearman") # TNF
