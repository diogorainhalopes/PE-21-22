set.seed(1511)

x <- rexp(404, 0.14)
e <- ecdf(x)
plot(e)
prob <- (1-e(18))
teo <- 0.0804596
print(teo - prob)
#valor teorico = 0.0804596 (WolframAlpha)