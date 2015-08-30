### OLS with matrix algebra ###

rm(list=ls())

# Today we'll cover: 

# A quick review of Matrix algebra 
# Matrix Calculus 
# Deriving OLS  

# Let's create some data (let's say, 10 people, 7 of them under treatment: 

y <- c(3,2,5,6,3,4,5,2,4,3)
a <- c(1,1,1,1,1,1,1,1,1,1)
x <- c(1,1,1,1,1,1,1,0,0,0)
z <- x*2+1

X <- cbind(a,x)

# What is our best linear predictor? 

summary(lm(y~x))

# y = 3 + 1*x 

# How we derive this using matrix algebra? (We'll do it by hand on the board)

# Find X'X 

X
t(X)
t(X) %*% X

# Find (X'X)^-1

solve(t(X) %*% X) 

# Find X'Y

t(X) %*% Y 

# Find (X'X)^-1X'Y.

solve(t(X) %*% X) %*% t(X) %*% Y  



