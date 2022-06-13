library("readxl")
library("tidyverse")
library("reshape2")
library("egg")

Oz <- read_excel("QualidadeARO3.xlsx")
AE_PP <- (subset(Oz, select = c("Antas-Espinho", "Paio-Pires")))
df = data.frame(AE_PP)
df$id <- 1:8784
df$Paio.Pires <- as.numeric(as.character(df$Paio.Pires))
df$Antas.Espinho <- as.numeric(as.character(df$Antas.Espinho))
graf <- melt(df, id.vars = "id", measure.vars = c("Paio.Pires","Antas.Espinho"))
ggplot(data=graf, aes(x=value,color=variable)) + geom_histogram(alpha = .5,
                                                                binwidth = 1,
                                                                show.legend = TRUE) +

labs(title = "Níveis de ozono registados nas estações de Antas-Espinho e Paio-Pires em 2020",
     x = "Níveis de ozono",y="Nº de ocorrências") +
  scale_color_manual(name ="Estações", values = c("red", "blue"), labels = c("Paio-Pires", "Antas-Espinho"))