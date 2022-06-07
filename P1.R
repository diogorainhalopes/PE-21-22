library("readxl")
library("tidyverse")
library("reshape2")
library("egg")

df = read_excel("ResiduosPerCapita.xlsx")

Ano2004 <- c(sapply(df[18,2], as.numeric), sapply(df[11,2], as.numeric), sapply(df[36,2], as.numeric))
Ano2018 <- c(sapply(df[18,3], as.numeric), sapply(df[11,3], as.numeric), sapply(df[36,3], as.numeric))
Paises <- c(sapply(df[18,1], as.character), sapply(df[11,1], as.character), sapply(df[36,1], as.character))

df1 <- data.frame(Paises, Ano2004)
df2 <- data.frame(Paises, Ano2018)
par(mfrow = c(2,1))
g1 <- ggplot(data = df1, aes(x=Paises, y=Ano2004)) + 
  geom_bar(colour = "blue", stat = "identity", fill = "blue") + 
  ggtitle("2004") + ylab("Resíduos per Capita (Tons)") + 
  scale_y_continuous(limits = c(0,25))
g2 <- ggplot(data = df2, aes(x=Paises, y=Ano2018)) + 
  geom_bar(colour = "red", stat = "identity", fill = "red") + 
  ggtitle("2018") + ylab("Resíduos per Capita (Tons)") + 
  scale_y_continuous(limits = c(0,25))

ggarrange(g1, g2, ncol = 2, nrow = 1)
