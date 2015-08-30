####################################################
#  Simulations of sampling from finite populations #
####################################################

rm(list=ls())

library(ri)
?ri

Y <- c(1,2,3,4,5,6)
mean(Y)

Z <- c(1,1,1,1,0,0) # of our six obs, we will always select 4 for treatment.
block <- c(1,1,1,2,1,2) # we will randomize across two different blocks 

(perms <- genperms(Z=Z,blockvar=block)) # all possible permutations
(probs <- genprob(perms)) # probability of treatment

# i.e. row one has .75 of being selected into treatment (out of 4 people, we will select 3); 
# row 6 has .5 of being selected into treatment (out of two people, we will select 1)

(nperms <- ncol(perms))

samplemeans <- htmeans <- rep(NA,nperms)

for(iter in 1:nperms) {
  samplemeans[iter] <- mean(Y[perms[,iter]==1])
  htmeans[iter] <- 1/6 * sum((Y/probs)[perms[,iter]==1])
}

samplemeans
mean(samplemeans) # biased

htmeans
mean(htmeans) # unbiased


