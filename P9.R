library("readxl")
library("tidyverse")
library("reshape2")
set.seed(680)

n = c(1:50)*100
m = 1000
lambda = 2.48
conf = 0.91
alpha = 1-conf

x <- qnorm(conf + alpha/2)

df=data.frame()

for (i in n) {
  amp = 0
  for (j in 1:m) { 
    amostra <- rexp(i, lambda)
    
    a <- mean(amostra) + x * sd(amostra) / sqrt(i)
    b <- mean(amostra) - x * sd(amostra) / sqrt(i)
    amp <- amp + (a-b)
  }
  amp <- amp / m
  df = rbind(df, c(i, amp))
}
names(df)[1] <- 'n'
names(df)[2] <- 'MA'
ggplot() + geom_point(data=df, aes(x=n, y = MA), color = "blue") +
           labs(title = "Média da Amplitude dos IC em função de n",x = "n",y="Média da Amplitude")
