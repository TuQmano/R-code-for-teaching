# Bootstraping, robust, and cluster standard errors. 

#################
# The bootstrap #
#################

#  Non-parametric bootstrapping of OLS

rm(list=ls()) #  Clean the environment 

#  Let's make up some data: 

final <- c(rep(65,10),rep(34,12),rep(76,10),rep(98,10),rep(80,18),rep(100,20))
ta1 <- c(rep(0,40),rep(1,40))
dta <- as.data.frame(cbind(final,ta1))

attach(dta)

# OLS estimation
(ols <- lm(final~ta1))

set.seed(500)
nboot<-1000

coefs.boot <- matrix(nrow=nboot, ncol=ncol(dta))  

for(i in 1:nboot){
  sample.boot<-dta[sample(1:nrow(dta),replace=T),]
  y.b <-sample.boot[,1]
  x.b <-sample.boot[,2]
  ols.out <-summary(lm(y.b~x.b))
  coefs.boot[i,]<-ols.out$coefficients[,1]
}

apply(coefs.boot,2,sd) # These are the "correct" standard errors, using the variability from your sample

########################################
# Robust and clustered standard errors #
########################################

# The idea is that we can characterize the sampling variability of the estimator 
# just by characterizing the relationship between the errors and the predictors.

#  EXAMPLE 1 

data(cars)
attach(cars) 

# install.packages("sandwich")
# install.packages("lmtest")

require(sandwich) #  for robust SE
require(lmtest) #  summarizing tests 

data(cars)
lm1 <- with(cars, lm(dist ~ speed + speed^2 ))
(lm1)

lm1$newse <- vcovHC(lm1, type="HC2") #  "HC" gives you the White’s estimator. Why HC2? See Aronow and Samii 2013.
coeftest(lm1,lm1$newse)

# To get at cluster (robust) SEs when you believe that errors are correlated within certain groups:

robust.se <- function(model, cluster){
  require(sandwich)
  require(lmtest)
  M <- length(unique(cluster))
  N <- length(cluster)
  K <- model$rank
  dfc <- (M/(M - 1)) * ((N - 1)/(N - K))
  uj <- apply(estfun(model), 2, function(x) tapply(x, cluster, sum));
  rcse.cov <- dfc * sandwich(model, meat = crossprod(uj)/N)
  rcse.se <- coeftest(model, rcse.cov)
  return(list(rcse.cov, rcse.se))
}

# see http://www.drewdimmery.com/robust-ses-in-r/)

robust.se(lm1,c(1:50))


#  EXAMPLE 2 

library(mvtnorm) # For random number generator 

# DGP with correlation across clusters

vcov <- matrix(c(1,0.1,0.1, 1), nrow=2, ncol=2, byrow=T)
data <- rmvnorm(2000, mean=c(0,0), sigma=vcov) 
covariate <- runif(2000)
data <- cbind(data,covariate)
data <- as.data.frame(data)
data$cluster <- c(rep("A",250),rep("B",250), rep("C",250), rep("D",250), rep("E",250), rep("F",250), rep("G",250), rep("H",250))
names(data) <- c("running", "y", "cov", "cluster")
data$treat <- c(ifelse(data$running>0,1,0)) 
data$y = data$y + 4*data$treat + (data$cluster=="A")*2 + (data$cluster=="B")*(-7) + (data$cluster=="C")*3 + (data$cluster=="E")*1 + (data$cluster=="G")*3.5   

(fit <- lm(y ~ treat + running, data=data))
fit$newse <- vcovHC(fit, type="HC2") 
coeftest(fit,fit$newse)

# To get at cluster robust SEs when you believe that errors are correlated within certain groups, but not between groups.

robust.se(fit,data$cluster)


