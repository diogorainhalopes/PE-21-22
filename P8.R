library("ggplot2")

seed = 967
m = 800
n = 967

amplitude = 0


set.seed(seed)
for (i in 1:m) { 
  a <- mean(rexp(n, 1.69)) + qnorm(0.97 + 0.03/2)*sd(rexp(n, 1.69))/sqrt(n)
  b <- mean(rexp(n, 1.69)) - qnorm(0.97 + 0.03/2)*sd(rexp(n, 1.69))/sqrt(n)
  amplitude <- amplitude + (a-b)
}

amplitude <- amplitude / m
print(amplitude)