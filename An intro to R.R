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

#############################################
# More on creating and manipulating objects #
#############################################

## the matrix() function in R is one way to create a matrix

matrix(data = 1:12, nrow = 3, ncol = 4)

matrix(data = 1:12, nrow = 3, ncol = 4, byrow = TRUE)

e <- seq(1,100,1) 

matrix(e,10,10, byrow=TRUE)

## You can also create a matrix from vectors
## using the cbind and rbind commands

my.vec <- c(4:8)
my.vec2 <- c(5:9)
my.vec3 <- c(1:5)

cbind(my.vec, my.vec2, my.vec3)
rbind(my.vec, my.vec2, my.vec3)

## Let's store the last matrix

mat <- rbind(my.vec, my.vec2, my.vec3)

## You can give your matrix colums and rows names

colnames(mat) <- c("col1","col2","col3","col4","col5")

mat

rownames(mat) <- c("row1","row2", "row3")

mat 

## We can extract particular elements of a matrix just like
c<## we could from a vector, though this time we have to specify
  ## two dimensions, the row and the column
  
  ## remember: what comes before the comma refers to row, 
  ## after the comma refers to columns
  
  mat[1,1] # first row, first column

mat[,1]  # first column

mat[1,]  # first row

vec1 <- c(2,2,7,-1,4)
vec1[3] # gives you the element in the third place 
vec1[6] # there is nothing in the sixth place of vector 1!
vec1[-1] # retrieves vector1 WITHOUT the first element

## You can also replace a particular element of a vector

vec1[3] <- 6 # now the third element is a 6 instead of a 7! (More on this, later)
vec1


####################
# Random Variables #
####################

## RANDOM NUMBER GENERATION
## generates a set of pseudo-random numbers drawn from a given
## probability distribution.  "Pseudo-" because these are, in fact,
## deterministic functions.

# Generate N observations from the N(0,1) distribution

help(rnorm)

normdist <- rnorm(10000)  # rnorm generates a random variable that will 
# be normally distributed.
# dnorm gives you the height of the probability 
# distribution at each point (i.e. the PDF)
hist(normdist)

pnorm(1.64) # area under standard normal curve to the left of 1.64
pnorm(3) - pnorm(-3) # area between -3 and +3

plot(normdist, dnorm(normdist)) # PDF
plot(normdist, pnorm(normdist)) # CDF

# Note that, by default, it uses mean=0, sd=1

summary(normdist)
sd(normdist) 

set.seed(123)
rnorm(100, mean=0, sd=2)
## Now let's put this in an object that we can call later.
ran.nr <- rnorm(100, mean=10, sd=4)
ran.nr


# This will be useful when making simulations. Let's say we have a 
# (linear) model like 

# y = 3 + 2.5*x + u 

# Where u is some random vector that is normally distributed (What does this model
# look like?)

x <- rnorm(100,10,2)
u <- rnorm(100)

y <- 3 + 2.5*x + u

lm1 <- lm(y~x) # lets fit a linear model to this data 
summary(lm1)

install.packages("arm")

library(arm); display(lm1) # just coefficients and SEs

y_hat <- fitted(lm1) # to get the predicted values from our linear prediction 

# Random sampling, with and without replacement:
# (The default is without replacement, unless you specify otherwise)

?sample  # <-- to get the relevant help page

sample(10, 5)

sample(10, 10)

sample(10, 11)  # <-- should give an error!

sample(10, 11, replace = TRUE)

## Let's say that I'm a lazy movie reviewer and I give out three kinds of
## reviews: negative, neutral and positive, assigned at random with the 
## following probabilities:
##   negative - 30%
##   neutral  - 50%
##   positive - 20%

## I could do my job using the sample function. 

set.seed(123) # to make reproducible results 
sample(c("negative","neutral","positive"), size=5, replace=TRUE,
       prob=c(.3,.5,.2))

## large N 
set.seed(12345)
reviews <- sample(c(-1,0,1), size=100, replace=TRUE, prob=c(.3,.5,.2))
reviews
## how would we expect this large random sample to be? Let's check:
mean(reviews)  ## the mean of the random draws
var(reviews)   ## the variance of the random draws
hist(reviews, col = "blue")  ## a histogram of the draws 
## ("col" changes the color of the histogram)



########################################################
## Dataframes
########################################################

#### Dataframe: a data frame is also a two-dimensional (row x column) object

## Each column must be of the same data type
## But data type may vary by column

## Regression and other statistical functions usually use dataframes
## Use as.data.frame() to convert matrices to dataframes

class(mat)
mydataframe <- as.data.frame(mat)
mydataframe
class(mydataframe)

# we will use this often to refer to a variable in a dataset.

mydataframe$col1

## We can subset using logical statements
## This means we can find certain items in our data sets
## by what they are (they satisfy the logical statement), not their position.

# look at which elements of col2 are 1's

mydataframe$col2 == 1
mydataframe$col2 == 2

# show me the rows for which "col1" is 1

mydataframe[mydataframe$col1 == 1, ]


# Logical tests
# == is equal to
# != is not equal to
# & and
# | or
# <= less than or equal to
# >= greater than or equal to

mydataframe[mydataframe$col1 > 1, ]

# show me the rows for which "col1" is greater than 1



# Subsetting Data: Parentheses are for functions, brackets are for
# indicating the position of items in a vector or matrix.

somevector <- c(1,10,15,20)
someothervector <- c("Bulbasaur","Ivysaur","Venusaur","Charmander") # EXTRA POINTS IF YOU RECOGNIZE THESE NAMES!
somematrix <- cbind(somevector,someothervector)
somematrix 

# How can we name these variables? 

colnames(somematrix)[1] <- "Rank"
colnames(somematrix)[2] <- "Species"
somematrix

somematrix[2,]
somematrix[,2]
somevector[someothervector=="Bulbasaur" | someothervector=="Venusaur"]
somematrix[somevector < 12,]
somematrix[somevector <= 15,]

# We can use these operations to create new "objects" (matrices, dataframes, etc.)

NoCharmander <- somematrix[someothervector!="Charmander",]
NoCharmander # The row with the value "Charmander" in someothervector is eliminated

# More on Subsetting data

NewData <- subset(somematrix, somevector==20 | somevector==15)
NewData


###################
# R Programming
##################

# R is also a  collection-oriented computer language. 
# The basic types of collection that R manipulates are
# vectors and lists. 

# Vectors # 

# A vector is a collection of elements that are
# all of the same type (numbers, strings, true/false values).
# vectors have a type and a length.

x = c(1, 2, 3, 4)
length(x) 
class(x) 

# Vector Examples
c(TRUE, FALSE, TRUE, FALSE) 
c(1, 2, 3, 5, 7) 

# Lists #

# Lists provide a way of storing objects of different types in a single container.
# Lists have a length and have class "list"

x = list(17, "A nice number", TRUE)
length(x) 
class(x)

# Missing Values #

#The indicator NA is used to indicate that a value within a vector is missing.
c(1, 2, 3, NA, 4) 

# The equivalent indicator of missingness for list elements is denoted by NULL.
list(10, NULL)

# The functions is.na and is.null can be used to test for the presence of missing values.
x = c(1, NA, pi, NA, sqrt(2)) 
is.na(x)

########################
# Arithmetic operators #
########################

# R provides the following basic arithmetic operators.

# -x negation (minus the values in x)
# x+y 
# x-y 
# x*y 
# x/y 
# x^y 
# x %/% integral division
# y x %% y  remainder after integral division

# The %/% and %% are defined as follows:
# The value of x %/% y is the value of x / y, rounded down to the next lowest integer.
# The value of x %% y is defined as the value of x - y * (x %/% y).

# Integral Division and Remainder Examples

7/3 
7 %/% 3
7 %% 3 

##########################
# Mathematical Functions #
##########################

# abs, sign 
# sqrt 
# exp 
# log 
# log10 
# sin 
# cos 
# tan 
# asin 
# acos 
# atan 
# factorial
# round, signif 
# ceiling, floor

# For example... 

round(3.3456)
round(3.3456, digits=2)

# use ? to find out more about these...

#####################
# Summary functions #
#####################

# min, max and range

# The functions min and max return the minimum and maximum values contained 
# in any of their arguments, and the function range returns a vector of 
# length 2 containing the minimum and maximum of the values in the arguments.

max(1:100)
min(1:100)
range(1:100)

# sum and prod

# The functions sum and prod compute the sum and product of all the 
# elements in their arguments.

sum(1:5)
prod(1:5)

# Summary Functions and NA

# In any of these summary functions the presence of NA and NaN (Not a Number) values 
# in any of the arguments will produce a result which is NA and NaN.

min(NA, 100, 4, 5, -10)

# NA and NaN values can be disregarded by specifying an additional argument of na.rm=TRUE.

min(10, 20, NA, na.rm = TRUE)

# Cumulative Summaries

# There are also cumulative variants of the summary functions.

cumsum(1:10) 
cumprod(1:10) 


######################
## Loading a dataset #
######################

# R can read any number of file types (*.csv, *.txt, etc.). 

# comma separated values
dat.csv <- read.csv("http://www.ats.ucla.edu/stat/data/hsb2.csv")

# tab separated values
dat.tab <- read.table("http://www.ats.ucla.edu/stat/data/hsb2.txt",
                      header=TRUE, sep = "\t")

require(foreign) # "foreign" ships with R (no need to install anything) 
# SPSS files
dat.spss <- read.spss("http://www.ats.ucla.edu/stat/data/hsb2.sav",
                      to.data.frame=TRUE)
# Stata files
dat.dta <- read.dta("http://www.ats.ucla.edu/stat/data/hsb2.dta")

#This data file contains 200 observations from a sample of high school 
# students with demographic information about the students. 
# It also contains a number of scores on standardized tests.

dim(dat.csv) # Retrieve or set the dimension of an object.
str(dat.csv) # Compactly display the internal structure of an R object

summary(dat.csv) # produces result summaries of the results of various model fitting functions.

# first few rows
head(dat.csv)

# last few rows
tail(dat.csv)

# variable names
colnames(dat.csv)

# pop-up view of entire data set (uncomment to run)
View(dat.csv)

# get first 10 rows of variable female using two methods
dat.csv[1:10, "female"]
dat.csv$female[1:10]

# get column 1 for rows 1, 3 and 5
dat.csv[c(1,3,5), 1]

# get row 1 values for variables female, prog and socst
dat.csv[1,c("female", "prog", "socst")]

summary(subset(dat.csv, read >= 60))

by(dat.csv[, 7:11], dat.csv$prog, colMeans)

# Note: Remember the dollar sign notation is used to extract named elements out of an R list.

table(dat.csv$prog) # Simple table
table(dat.csv$female)

tab1 <- table(prog,female) # Cross table
tab2 <- matrix(tab1, 3,2) # We can transform this table into a matrix 

prop.table(tab1,1) # Row proportions
prop.table(tab1,2) # Col proportions
prop.table(tab1) # Tot proportions

chisq.test(tab1) # Do chisq test Ho: no relathionship (we cannot reject the null)
fisher.test(tab1) # Do fisher'exact test 

round(prop.table(tab1,2), 2) # Round to 2 digits
round(100* prop.table(tab1,2), 2) # Round col % to 2 digits

addmargins(tab1) # Adding row/col margins

# 3-way crosstabs 

test <- xtabs(~female+race+math, data=dat.csv)
test
# Selection using the --subsetâ€”

mydata1 <- subset(dat.csv, female == 1 & math >= 50)

mydata2 <- subset(mydata1, female == 1 & math >= 50, 
                  select=c(female, math, prog))


##########################################
# Apply a Function over a List or Vector #
##########################################

setwd("/Users/gfeierherd/Google Drive/Dissertation Data/New data/ANUARIO 2012")
data <-
  # (see also the "plyr" package)
  
  # apply - When you want to apply a function to the rows or columns of a matrix (and higher-dimensional analogues).
  
  M <- matrix(seq(1,16), 4, 4)

# apply min to rows
c <- apply(M, 1, min)

# apply min to columns
apply(M, 2, max)

# For our data... 

apply(mydata2, 2, mean)

# lapply - When you want to apply a function to each element of a list in turn and get a list back.
x <- list(a = 1, b = 1:3, c = 10:100) 
lapply(x, FUN = length) 
lapply(x, FUN = sum) 

# sapply - When you want to apply a function to each element of a list in turn, but you want a vector 
# back, rather than a list.

x <- list(a = 1, b = 1:3, c = 10:100)

#Compare with above; a named vector, not a list 
sapply(x, FUN = length)  

sapply(x, FUN = sum)   

# tapply - For when you want to apply a function to subsets of a vector and the subsets are defined by 
# some other vector, usually a factor.

x <- 1:20
y <- factor(rep(letters[1:5], each = 4))
tapply(x, y, sum)  

math_ratio <- tapply(dat.csv$math,dat.csv$female, mean) # Descriptive statiscs by groups using --tapply--

math_ratio

# More descriptive statistics by groups using aggregate! 

aggregate(dat.csv[c("math","science")],by=list(dat.csv$female), mean, na.rm=TRUE)

#############################
# Saving objects into files #
#############################

getwd() # Current working directory 
setwd("~/Dropbox/PLSC 500/") # Sets a new working directory 

# On a PC, it will look like
# setwd("C:/data/")

# write.csv(dat.csv, file = "path/to/save/filename.csv")

# write.table(dat.csv, file = "path/to/save/filename.txt", sep = "\t", na=".")

# write.dta(dat.csv, file = "path/to/save/filename.dta")

# write.xlsx(dat.csv, file = "path/to/save/filename.xlsx", sheetName="hsb2")

# save to binary R format (can save multiple datasets and R objects)

save(dat.csv, mydata1, file = "example.RData")

rm(list=ls())
setwd("~/Dropbox/PLSC 500/") 
load("example.Rdata")

# Creating a variable with a sequence of numbers from 1 to n 
# (where â€˜nâ€™ is the total number of observations)

mydata1$id2 <- seq(dim(mydata1)[1])


#################################################################
## If-then-else and ifelse statements
#################################################################

## If-then-else. Structure:
## if (condition) #do this# else #do that#
## uses conditions of length 1
if (0.8>=0.5) 1 else 0

## Ifelse. Structure:
## ifelse(condition,#do this#,#do that#)
## can be applied to a vector
x <- c(3,6,8,3,45,78)
s <- ifelse(x>10, 1, 0)

## a quick to generate a treatment dummy:
mydata1$treat <- ifelse(mydata1$math>60, 1, 0)

## how many of the 60 units received a scholarhip?
sum(mydata1$treat)


#################################################################
## For-Loops
#################################################################

## As part of a computing task we often want to repeatedly carry out some computation for 
## each element of a vector or list. In R this is done with a for loop.

# We index with i, and the for loop iterates through the process from the starting value to
# the last value.

## Structure
## for (#variable# in #vector#) { #expression# } 

## The effect of such a loop is to set the value of variable equal to
## each element of the vector, each time evaluating the
## given expression.

## Suppose we have a vector x that contains a set of numerical
## values, and we want to compute the sum of those values. One
## way to carry out the calculation is to initialise a variable to
## zero and to add each element in turn to that variable.

x <- 1:100

s=0

for(i in 1:length(x)) {
  s = s + x[i]
}

s

## The effect of this calculation is to successively set the variable
## i equal to each of the values 1, 2,..., length(x), and for
## each of the successive values to evaluate the expression s = s + x[i].

# Sometimes you can do the same thing without a loop:
sum(1:100)

# You can have more commands in the body of the loop:
s = 0
for(i in 1:100){
  s = s+i
  cat("When i = ", i, ", s = ",s, "\n",sep="") # <-- "cat" (Concatenate and Print) prints things;  \n stands for (end-of-line). 
}


## In this case starting at 1, incrementing by 1 each time, until we reach 5
for( i in 1:5) {
  print(paste("Hello, world!  I'm on interation", i))
}

# Or... 

for( i in 1:5) {
  cat("Hello, world!  I'm on interation ", i,"\n", sep="")
}


# in this case we don't plug in consecutive values for i
for( i in c(3,10,9)) {
  print(paste("Hello, world!  I've got i equal to", i))
}


## Here is a simple example where we first define a 
## storage matrix to hold the output of our for loop

holder <- c()

## we will simulate one hundred draws of one observation from a 
## normal distribution with mean zero and standard dev 1

for(i in 1:100){
  draw <- rnorm(1, mean = 0, sd = 1) 
  holder[i] <- draw
}

## visual representation of this,
hist(holder)

## let's write a more flexible for loop that will let you 
## change the number of simulations quickly

sims <- 1000
holder <- c()

for(i in 1:sims){
  draw <- rnorm(1, mean = 0, sd = 1) 
  holder[i] <- draw
}

hist(holder)


s = 0
for(i in 1:1000){
  s = s+10
  cat("When i = ", i, ", s = ",s, "\n",sep="")
  remainder10 = (i %% 10)
  tens = i/10
  if(remainder10 == 0)cat("I'm getting", rep("really", tens),"tired\n")
  
}

rm(list=ls())
## code to include in long loops to know in which interation you are
i=1000
if (i/100==round(i/100)) print(i)

sims <- 10000
holder <- c()

for(i in 1:sims){
  draw <- rnorm(1, mean = 0, sd = 1) 
  holder[i] <- draw
  if (i/100==round(i/100)) print(i)
  
}

hist(holder)


#################################################################
## Writing Functions
#################################################################

## R differs from many other statistical software systems
## because it is designed to be extensible. Users can add
## new functionalities in ways which makes it impossible to 
## distinguish that functionality from the capabilities shipped 
## with the system.

## Additional functionality is added to R by defining new functions.

## Structure

# function (#arglist#) {#body#}

## arglist: comma separated list of variable names known as the formal
# arguments of the function

## Functions take a number of values as arguments an return a single value

## General idea:

## name.of.the.function <- function(x,y,z){
##      		## tells R that this is a function and define the 
##          ## arguments it will have, here (x,y,z)
##
##   	out <- what the function does.
##
##  	return(out) ## defines the output of the function
## }
## closes the function

## This function will take three numbers as arguments;  it will add
## the first two and multiply the sum by the third

my.function <- function(x,y,z){
  out <- (x + y)*z
  return(out)
}

## Now we call our function with 

my.function(x = 5, y = 10, z = 3)
my.function(2,2,2)
my.function(5, 10, 3)

## Now let's see a function that returns the smallest element in a vector
## using the R commands we've seen so far
## note that in this case the input is a vector!

small <- function(vec){ 
  sorted <- sort(vec)
  out <- sorted[1]
  return(out)
}

## Here's a new vector we can use for a test

test <- c(2, 5, 4000, .1, 1)

small(test)

## Function evaluation takes place as follows:

# 1. Temporarily create a set of variables by associating the arguments passed 
# to the function with the variable names in arglist.
# 2. Use these variable deï¬?nitions to evaluate the function body.
# 3. Remove the temporary variable deï¬?nitions.
# 4. Return the computed values.


rm(list=ls())

#################################################################
## Graphics
#################################################################

load("/Users/gfeierherd/Dropbox/PLSC 500/Intro to R/mydata100.RData")

# When should we attach a dataset?
attach(mydata100)
detach(mydata100)

options(width=64)

summary(mydata100)

#BARPLOT#
# Barplots of counts via table
barplot(c(60,40))
barplot(workshop) #Doesn't work
barplot(table(workshop)) #Tabulates then graphs
barplot(table(workshop), horiz=TRUE) #Turns graph sideways

# Grouped barplots & mosaic plots
barplot(table(gender,workshop))
plot(workshop,gender) #Mekko chart, no need to use table
mosaicplot(table(workshop,gender))

# Barplots of means via tapply, which applies a function to each cell
myMeans <- tapply(q1, gender, mean, na.rm=TRUE)
barplot(myMeans)
myMeans <- tapply(q1, list(workshop,gender), mean,na.rm=TRUE)
barplot(myMeans, beside=TRUE)

#DOTPLOT#
dotchart(table(workshop,gender),
         main="Dotchart of Workshop Attendance",
         cex=1.5, col="slateblue", pch=16) 


#HISTOGRAMS AND DENSITIES#

#Basic histogram with density
hist(posttest)
hist(posttest, breaks=20, probability=TRUE,
     main="Histogram with Density and Points", xlab="Posttest scores")
lines(density(posttest), col="red") 

#Histogram of subset
hist(posttest[which(gender=="Male")], col="gray60")

#Putting two graphs on one page
par(mfrow=c(2,1))
hist(posttest, col="gray90",
     breaks=c(50,55,60,65,70,75,80,85,90,95,100))
hist(posttest[ which(gender=="Male") ],
     col="gray60",
     breaks=c(50,55,60,65,70,75,80,85,90,95,100))
par(mfrow=c(1,1))

#Graphing multiple densities with rug
plot(density(pretest, bw="nrd0", adjust=.75), lty=4, lwd=2, col="darkgreen", 
     xlab = "Score", ylab = "Density", main = "Density Plot", ylim=c(0,.09), 
     xlim=c(50,100))
rug(pretest, ticksize = 0.03, side = 1, lwd = 0.5, col="darkgreen")
lines(density(posttest, bw="nrd0", adjust=.75), lty=1, lwd=2, col="red")
rug(posttest, ticksize = 0.03, side = 3, lwd = 0.5, col="red")
legend("topright",c("Pretest","Posttest"),lwd=2, lty = c(4,1), col=c("darkgreen","red"), bty="n")


#SCATTERPLOTS#
#Basic scatterplot
plot(pretest,posttest, col="blue")

par(mfrow=c(2,2))
plot(pretest, posttest, type="p", main="Comparison of Pretest and Posttest Scores", xlab="Pretest score",ylab="Posttest score") 
abline(lm(posttest~pretest), lty=1, lwd=2)  #add line of best fit

#Plotting labels
plot(pretest, posttest, type="p", main="Comparison of Pretest and Posttest Scores", xlab="Pretest score",ylab="Posttest score",pch=as.character(gender))

# Jittered scatterplot 
par(mfrow=c(1,2))
plot(q1, q4, main="Likert Scale Without Jitter", xlab="Q1 Score",ylab="Q4 Score")
plot( jitter(q1,3), jitter(q4,3), main="Likert Scale With Jitter", xlab="Q1 Score",ylab="Q4 Score")

#Scatterplot matrix  
plot(mydata100)

#Confidence intervals (basic example)
x <- c(1,2,3,4)
y1 <- c(1,2,3,4) #lower confidence limit
y2 <- c(2,3,4,5) #prediction line
y3 <- c(3,4,5,6) #upper conf limit
yMatrix <- cbind(y1,y2,y3)
yMatrix
plot( x, y2, xlim=c(1,4), ylim=c(1,6), cex=1.5 ) 
matlines(x, yMatrix, lty=c(2,1,2), col="black" )
rm( x, y1, y2, y3, yMatrix)

#################################################################
## A Monte Carlo simulation experiment to approximate bday probabilities
#################################################################

## The basics
# First do it just once (then put a loop around it to do it as
# many times as we want.)

## Let's say there is 10 of us in this room, and we want to figure out the probability
## that at least two of us share the same birthday (that there is at least one birthday match).

people <- 15 

bdays <- sample(365, people, replace = T)
bdays

tally <- table(bdays)

tally

tally > 1

max(tally > 1)  # 1 will mean True (we have a match!), 0 will mean False.


### Now make the loop to do it many times and record the results:
sims  <-  10000

dist <- rnorm(100)
ex <- sample(dist,10,replace=T)
# placeholder for the results
results  <- NA

for(i in 1:sims){
  bdays = sample(365, people, replace = T)
  tally = table(bdays)
  results[i] = (max(tally) > 1)
}

results

results = as.numeric(results)

results[1:50]

sum(results)

# Note: in the "results" vector, 
# 1 means "True" 
#     (i.e., "max(tally) > 1" was True for that iteration, 
#      i.e., there was at least one bday match on that iteration),
# and 0 means "False"
#     (i.e., "max(tally) > 1" was False for that iteration, 
#      i.e., there was no bday match on that iteration)

sum(results)/length(results)  # <-- estimated probability of a match  



########################################################
## R packages & KNITR
########################################################

## People write software for R all the time. These are called "packages."

## We will use some of these ofter. 
## To steps to use packages (1) install, (2) load them. 
## Step 1 only needs to be done once, the first time you use the package. 
## After that, just load the package. 

## One package that you will use often is 
## "foreign", which permits you to load data formatted for other software.

## (1) To install a package:
install.packages("foreign")

## (2) load the package:
library(foreign)
## (this must be done every time you use the foreign package).

## Note that to install them the name has to be between "" but to load them 
## it is just the name of the package. 

## Other useful packages are
## car -- has many datasets and linear regresison functions
install.packages("car")
## arm -- functions from Gelman and Hill
install.packages("arm")
## xtables -- helps you write up tables in LaTeX code
install.packages("xtable")
## more packages are at http://cran.r-project.org/web/packages/
## As you get more familiar with R, you will use more packages.


##########################################################################
# Linear Regression
##########################################################################

data(cars)
attach(cars) 

help(lm)

# make a new variable, speed^2
speed2 = speed^2

# model 1, just speed on distance with intercept
lm1 = lm(dist ~ speed)
summary(lm1)

# model 2, speed and speed^2 on distance with intercept
lm2 = lm(dist ~ speed + speed2)
summary(lm2)

# model 3, speed and speed^2 no intercept
lm3 = lm(dist ~ speed + speed2 - 1)
summary(lm3)

detach(cars)

# other regression outputs (from arm package)
library(arm)
display(lm3) # just coefficients and SEs
coefplot(lm3) # a very basic coefficients plot
?coefplot



q()



