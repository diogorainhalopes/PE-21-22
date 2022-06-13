library("tidyverse")
library("reshape2")
set.seed(680)

n = c(1:50)*100
m = 1000
lambda = 2.48
conf = 0.91
alpha = 1-conf

df=data.frame()
amp = NULL
for (i in n) {
  for (j in 1:m) { 
    amostra <- rexp(i, lambda)
    a <- 1/mean(amostra) * (1 - (qnorm(1-(alpha/2))) / sqrt(i))
    b <- 1/mean(amostra) * (1 + (qnorm(1-(alpha/2))) / sqrt(i))
    amp <- c(amp, (b-a))
  }
  df = rbind(df, c(i, mean(amp)))
}
names(df)[1] <- 'n'
names(df)[2] <- 'MA'
ggplot() + geom_point(data=df, aes(x=n, y = MA), color = "blue") +
           labs(title = "Média da Amplitude dos IC em função de n",x = "n",y="Média da Amplitude")
