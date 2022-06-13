library("readxl")
library("tidyverse")
library("reshape2")
library("egg")

set.seed(847)

values <- c(4, 29, 59)

vetor1=NULL
vetor2=NULL
vetor3=NULL

for (i in 1:800) {
  vetor1 = c(vetor1, mean(runif(values[1], 5, 9)))
  vetor2 = c(vetor2, mean(runif(values[2], 5, 9)))
  vetor3 = c(vetor3, mean(runif(values[3], 5, 9)))
}
df1 <- data.frame(vetor1)
df2 <- data.frame(vetor2)
df3 <- data.frame(vetor3)

g1 <- ggplot(df1, aes(x = vetor1)) + geom_histogram(aes(y = ..density..), 
      colour="darkred", fill="red") + 
      stat_function(fun = dnorm, args = list(mean = mean(df1$vetor1), sd = sd(df1$vetor1))) +
      xlab("n = 4") + ylab("Densidade") +
      ggtitle("Histogramas de Densidade de distribuições uniformes contínuas em [5, 9]")

g2 <- ggplot(df2, aes(x = vetor2)) + geom_histogram(aes(y = ..density..), 
      colour="darkblue",fill="blue") + 
      stat_function(fun = dnorm, args = list(mean = mean(df2$vetor2), sd = sd(df2$vetor2))) + 
      xlab("n = 29") + ylab("Densidade")

g3 <- ggplot(df3, aes(x = vetor3)) + geom_histogram(aes(y = ..density..), 
      colour="darkgreen", fill="green") + 
      stat_function(fun = dnorm, args = list(mean = mean(df3$vetor3), sd = sd(df3$vetor3))) + 
      xlab("n = 59") + ylab("Densidade")
ggarrange(g1, g2, g3)
