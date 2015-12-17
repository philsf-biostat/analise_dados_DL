# Metodologia utilizada

A análise descritiva foi apresentada na forma de tabelas os dados observados, expressos pela média, desvio padrão, mediana, amplitude interquartílica (AIQ), mínimo e máximo para dados numéricos (quantitativos) e pela frequência (n) e percentual (%) para dados categóricos (qualitativos). São apresentados gráficos descritivos das variáveis basais e finais. Ao longo do texto, as variáveis normais foram sumarizadas como média +/ desvio-padrão (DP), e as variáveis não-normais como mediana +- AIQ.

Foi aplicado o teste de normalidade de Shapiro-Wilks nas variáveis numéricas. A comparação das variáveis basais e finais foi feita com o teste t pareado para variáveis normalmente distribuídas, e com o teste de Mann-Whitney pareado para variáveis que tiveram a hipótese de normalidade rejeitada. Foram calculadas as correlações entre o nível final de Vitamina D e o nível final de cada marcador. Para variáveis normais, foi aplicada a correlação de Pearson, e para variáveis não-normais, a correlação não-parmétrica de Spearman. Em todas as análises, foi adotada a  significância de 5%. As análises estatística foram feitas utilizando o software estatístico R, versão 3.2.2 (https://www.R-project.org).

# Resultados

## Estatísticas descritivas

### Estatísticas

Variável | Média (DP) | Mediana (AIQ)
---| --- | ---
Vitamina D basal | x | x
Vitamina D final | x | x
ADP basal | x | x
ADP final | x | x
CTX basal | x | x
CTX final | x | x
FAO basal | x | x
FAO final | x | x
LEP basal | x | x
LEP final | x | x
OPG basal | x | x
OPG final | x | x
TNF basal | x | x
TNF final | x | x

Tabela 1: Estatísticas descritivas da vitamina D e marcadores (siglas), em média (DP), mediana (AIQ).

As estatísticas descritivas das variáveis analisadas estão sumarizadas na tabela

### Gráficos

![Boxplots da Vitamina D](../figuras/boxplots-vitaminad.png)

Figura 1: Níveis basal e final da Vitamina D (boxplot: mediana, quartis, outliers)

![Boxplots dos marcadores](../figuras/boxplots-marcadores.png)

Figura 2: Níveis basal e final dos marcadores ADP, CTX, FAO, LEP, OPG e TNF (siglas e boxplot: mediana, quartis, outliers)

São apresentadas nas figuras 3 e 4 as retas de melhor ajuste aos ...

Os níveis basal e final foram significativamente diferentes, conforme seção X, e resumidos na tabela X.

![Scatterplot Vitamina D](../figuras/scatterplots-vitaminad.png)

Figura 3: Comparação entre a Vitamina D basal e final (completar legenda)

Sugestão: **não incluir a figura acima, da reta de melhor ajuste da vitamina D**. Incluir no trabalho apenas as figuras 1 e 2 que ilustram a diferença entre os níveis basal e final, e a figura abaixo, com os dados e a reta de melhor ajuste dos marcadores.

![Scatterplot marcadores](../figuras/scatterplots-marcadores.png)

Figura 4: Comparação entre os níveis basal e final dos marcadores ADP, CTX, FAO, LEP, OPG e TNF (completar, siglas, etc). A linha azul é a reta de melhor ajuste aos dados. Índices de correlação de Pearson/Spearman: ADP (r=), CTX (r=), FAO (r=), LEP (r=), OPG (r=) e TNF (r=). (Incluir correlações)

## Normalidade

- P: textual ou tabela?

Considerando conjuntamente os valores basal e final, nenhuma das variáveis parece ter distribuição normal.


## Testes pareados

Variável | Desfecho | p-valor
--- | --- | --- | ---
ADP | aumentou | 3.683e-05
CTX | diminuiu | 0.0004796
FAO | diminuiu | 0.008773
LEP | diminuiu | 0.0002087
OPG | aumentou | 4.704e-05
TNF | diminuiu | 0.0003489

Tabela 2: Diferenças entre os valores basal e final dos marcadores ADP, CTX, FAO, LEP, OPG e TNF (siglas). P-valores apresentados de acordo com o teste de Mann-Whitney pareado.

## Correlações

Nenhuma das correlações foi significativa com os dados analisados.

Variável | rho | p-valor
--- | --- | --- | ---
ADP | 0.116748 | 0.6143
CTX | 0.01559961 | 0.9465
FAO | 0.2670565 | 0.2419
LEP | 0.1254896 | 0.5878
OPG | 0.03174166 | 0.8914
TNF | -0.00325947 | 0.9888

Tabela: Coeficientes de correlação de Spearman entre o nível final de Vitamina D e o nível final dos marcadores ADP, CTX, FAO, LEP, OPG e TNF (siglas).
