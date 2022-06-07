library("readxl")
library("tidyverse")
library("reshape2")

set.seed(1667)

amostras <- 200
dimensao <- 4
n <- 1
p <- 0.77

vetor = NULL

for (i in 1 : 200) vetor = c(vetor, mean(rbinom(1, 4, 0.77)))
vetor
resposta <- mean(vetor) - 3.08 # 4*0.77
resposta