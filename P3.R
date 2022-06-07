library("readxl")
library("tidyverse")
library("reshape2")
library("egg")

Oz <- read_excel("QualidadeARO3.xlsx")
AE_PP <- (subset(Oz, select = c("Antas-Espinho", "Paio-Pires")))
df = data.frame(AE_PP)
df$Paio.Pires <- as.numeric(as.character(df$Paio.Pires))
df$Antas.Espinho <- as.numeric(as.character(df$Antas.Espinho))

ggplot(df) + geom_histogram(aes(Paio.Pires), 
                            alpha = .3, 
                            binwidth = 2, 
                            colour = "blue", 
                            fill = "blue",
                            show.legend = TRUE) +
             geom_histogram(aes(Antas.Espinho),
                            alpha = .3, 
                            binwidth = 2, 
                            colour = "red", 
                            fill = "red",
                            show.legend = TRUE) +
 
             ggtitle("Níveis de ozono registados nas estações de Antas-Espinho e Paio-Pires em 2020") +
             xlab("Níveis de ozono") +
             ylab("Nº de ocorrências") + 
             geom_point(aes(x = 170, y = 300), colour = "blue") + annotate("text", x = 185, y = 300, label = "Paio-Pires") + 
             geom_point(aes(x = 170, y = 275), colour = "red") + annotate("text", x = 187, y = 275, label = "Antas-Espinho")
              

