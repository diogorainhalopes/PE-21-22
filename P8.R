library("ggplot2")

m = 800
n = 577
set.seed(967)

lambda = 1.69
conf = 0.97
alpha = 1-conf

amp = NULL

for (i in 1:m) { 
  amostra <- rexp(n, lambda)
  a <- 1/mean(amostra) * (1 - (qnorm(1-(alpha/2))) / sqrt(n))
  b <- 1/mean(amostra) * (1 + (qnorm(1-(alpha/2))) / sqrt(n))
  amp <- c(amp, (b-a))
}
print(mean(amp))