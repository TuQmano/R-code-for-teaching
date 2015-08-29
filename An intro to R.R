# An introduction to R # 

# Acknowledgements: this code has been adapted from previous code by 
# Peter Aronow, Joseph Chang, Danny Hidalgo, Jennifer Pan, Rocio Titiunik, and Guadalupe Tunon.

####################
## Installing R 
####################

# Details will vary if you are a Windows or Mac user. 

# For MAC, go to http://cran.r-project.org/bin/macosx/

# For Windows, go to http://cran.r-project.org/bin/windows/base/


#################################################
## PREAMBLE: Script and Console
########################################################

#  R is integrated suite of software facilities for data manipulation, calculation and graphical 
# display. It is an open source (i.e. free) software maintained by the R community. 

# R works by 
# 1. Typing code in the console (next to the 'greater than' sign) 
# 2. OR by typing on a script (like this one) and sending the lines of code to the console.

# For windows: use Ctrl-R to send text from Editor to Console
# For macs: use Command-Enter to send text to Console

# Unless you are working on very simple calculations, write in the editor and save your code 
# as a script using a ".R" file extension.

# Every line that begins with '#' is ignored by the console (the analogous to * or // in Stata).
# So you can add comments to your code without generating syntax errors.
# In fact, your code should be heavily commented so that you can understand
# what you've done if you had to come back to it later (This is VERY important)



########################################################
## R help! (Your best friend)
########################################################

## Use the "help" command.

?mean

## or 

help(mean)

# The faster you learn how to read help files and examples, the faster you will learn R, Stata, etc.




########################################################
## R as a calculator
########################################################

2 + 18

50821/6

21^4

log(4)/9^2

# R is an object-oriented programming language (as JAVA or C)
# an object is the composition of nouns (like data such as numbers, strings, or variables) 
# and verbs (like actions, such as functions).
# Store an object for later retrieval by using " <- " as assignment operator
# (mac shortcut:  hit option and the minus sign at the same time).

a <- 2 + 18
a

b <- 50821/6
b

my.name <- "German"
my.name

R <- 1; Stata = 0 # Because it is free, more flexible, and it has excellent graphics 
# (and you can use Command-Enter to send text to Console) 

# Note that = is equivalent to <- but that <- makes the assignment mechanism clearer

## Use the ls() command (List Objects) to see what objects are currently stored in the R environment

ls()

## Use the rm() command to get rid of a particular object stored

rm(my.name)
ls()

## Use the rm(list = ls()) command to get rid of all objects stored

rm(list = ls()) 



########################################################
## Objects
########################################################

## In R every "object" has a "class", indicating its abstract type 

scalar1 <- 2
scalar1              # this is a NUMERIC "data type"
class(scalar1)

R <- "fun!"
R                    # this is a CHARACTER "data type"
class(R)

truth.vec <- TRUE
truth.vec            # this is a LOGICAL "data type"
class(truth.vec)

## Important: Note: Don't name your objects things like "mean" or "sum" or "7" since those are 
## things that R already has pre-packaged.

# You can make longer things, like vectors, which we create with c(), for concatenate. 

vec1 <- c(2,2,7,-1,4)
vec1

R <- c("getting","better","at", "R")
R

## R performs math on numeric objects

vec2 <- c(2,5,1,3,2)

vec1 + vec2

vec1 - vec2

3*vec2

vec2*3

## Tricks for creating vectors

vec3 <- 1:5 # uses integers from 1 to 5
vec3

vec3 <- c(1:5, 7, 11) # integers from 1 to 5, then 7 and 11.
vec3

vector.1 <- c(1,2,3,4)
vector.2 <- c(100,99,98,97)

cbind(vector.1,vector.2)
rbind(vector.1,vector.2)


########################################################
## Basic R functions
########################################################

# R has many preprogrammed functions that manipulate objects.
# To use a function, you type the function name followed by the
# arguments in parentheses.

rm(list=ls())
a <- c(1,3,6,5,9,22) # concatenate
a

b <- c(4,5,6,5,2,1)
b

sum(a) ## sum of all elements of a

sum(b)

sum(a,b)

max(a) ## maximum element in a

min(a) ## minimum element in a

mean(a) ## mean of a

length(a) ## number of elements in a,
## useful for when you need to calculate the sample size, n

sort(a) ## sorts the elements of a from lowest to highest

## you can store the output of a function, as a new object.

output <- length(a)
output

## These functions are useful for creating vectors

seq(from = 0, to = 5, by = .5) 

## creates a sequence of numbers

rep(10, 27) 

## repeats the number "10" 27 times.

## to learn the arguments for a particular 
## function, use the help commands:

?sort

sort(a)
sort(a, decreasing = TRUE)

# Create a vector of 120 random numbers drawn from a uniform distribution 
# over the interval between 0 and 1:

z <-  runif(120)

# We can see which of these is less than 0.5 with the expression "z < 0.5"

z < 0.5

# R identifies "True" with "1" and "False" with "0":

as.numeric(z < 0.5)


# We can also plot the PDF and CDF  of this distribution   

z <- seq(from=-.5, to=1.5, by=.01) # Generate a grid of values 

plot(z, dunif(z), type="l", main="PDF", xlim=c(-.5,1.5))

# How would we plot the CDF? 


########################
## Loading a dataset 
########################

rm(list = ls() ) 

# R contains a variety of datasets 

data() # Gives the list of all datasets in R   
data(cars)
help(cars)

# More generally:

getwd()
setwd("~/Dropbox")
load("data.Rdata")

q()

