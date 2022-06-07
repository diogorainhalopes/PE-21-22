library("readxl")
library("tidyverse")
library("reshape2")

U <- read_xlsx("Utentes.xlsx")
df <- data.frame(U, select = c("Idade", "IMC"))
ggplot(df, aes(x=Idade, y=IMC)) + geom_point(size = 1, shape = 21, fill="blue") +
                                  geom_smooth(method=lm) +
                                  ggtitle("Gráfico de dispersão entre as variáveis IMC e Idade")
