# The poisson distribution 

x <- seq(0,50,1)
mean = 2
y1 <- dpois(x,mean)
plot(x,y1,type="l",lwd=3,cex.main = 1.5, cex.lab = 1.5,pch=19,col=1,xlab="x",
     ylab="P(x)", main = "Poisson PDF")


# The central limit theorem in action 

numiter <- 1000 
n <- 10 

store.estimates.mean <- rep(NA,numiter) # have some place to store your estimates

for(iter in 1:numiter) {
  poissson <- replicate(10,rpois(1000,2)) # 1,000 obs with lambda (the mean) = 2
  store.estimates.mean[iter] <- mean(poissson)
}

plot(density(store.estimates.mean))
mean(store.estimates.mean)

