library(tidyverse)
library(reshape)
set.seed(139)

n = c(1:25)*100
m = 700
lambda = 4.42
lambdac = 0.02
conf = 0.999
alpha = 1-conf

AMP = NULL
CONT = NULL
amostra = NULL

df=data.frame()

for(i in n){
  
  for (j in 1 : m){
    amostra <- rexp(i, lambda)
    a <- 1/mean(amostra) * (1 - (qnorm(1-(alpha/2))) / sqrt(i))
    b <- 1/mean(amostra) * (1 + (qnorm(1-(alpha/2))) / sqrt(i))
    AMP <- c(AMP, (b-a))
    
    amostra = head(amostra, -(i/4))
    amostra <- c(amostra, rexp(i/4, lambdac))
    a <- 1/mean(amostra) * (1 - (qnorm(1-(alpha/2))) / sqrt(i))
    b <- 1/mean(amostra) * (1 + (qnorm(1-(alpha/2))) / sqrt(i))
    CONT <- c(CONT, (b-a))
                                          
  }
  df= rbind(df, c(i,mean(AMP),mean(CONT)))
}

names(df) <- c('n', 'MA', 'MAC')
graf <- melt(df, id.vars = "n", measure.vars = c("MA","MAC"))
ggplot(data=graf, aes(x=n, y = value, color=variable)) +
  geom_point() + geom_line() +
  scale_color_manual(name ="amostras",values = c("blue","red"),labels =
                       c("não contaminadas", "contaminadas"))+
  labs(title = " Média da amplitude dos IC em função de n em amostras
                contaminadas e não contaminadas",x = "n",y="MA")