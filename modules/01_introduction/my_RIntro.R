# Open file to edit in the source window
# file.edit("filename")

# Run .R file
# source("myRIntro01.R")
# source("https://www.math.ntnu.no/emner/TMA4268/2019v/1Intro/RintroPartB.R", echo=TRUE)
# getwd()
# setwd("location")
# q()

2 + 3
2 * 6
3 * 10^4 - 3 * 5^2
10^2 - 1
10^(2-1)
sqrt(9)
log(3, base=10)

# Outputs function documentation
'?'(log)

# Outputs function declaration
log

log10(3)
log(3)
exp(34)
gamma(3)
factorial(5)
choose(10,4)
1:4
c(1,2,3,4)
c(1:4)
seq(from=1, to=4, by=1)
sum(1:5)
prod(1:5)

# Objects. They appear in the environment window
heights = c(192, 185, 174, 195, 173)
shoes = c(46, 43, 40, 45, 40)
ratio = heights/shoes

# Printing to and reading from a csv-file
n = 1000
ds = matrix(rnorm(n), ncol=10)
colnames(ds) = paste("Variable", 1:10, sep="") #
write.csv(ds, file="stnorm.csv", row.names=FALSE) #do not want 1:100 as rownames
getwd()
list.files()
dss = read.csv(file="stnorm.csv", header=TRUE)
dim(dss)
typeof(dss)
head(dss)

# Exporting plots
ds = rnorm(100)
boxplot(ds)
# The different parts of the boxplot are: 
#     minimum value   - lower thin line
#     1st quantile    - lower edge of the box
#     median          - thick black line in the box
#     3rd quantile    - upper edge of the box
#     maximum value   - upper thin line
# The whiskers are defined as:
#     Q1 - 1.5 * IQR
#     Q3 + 1.5 * IQR
#     IQR = Q3 - Q1

# Three different ways of saving the plot as files
dev.copy2pdf(file="box.pdf")
dev.copy2eps(file="box.eps")
# This approach makes it possible to store many plots in one file
pdf("box.pdf"); # opens file
boxplot(ds); 
dev.off() # closes file

# Packages and functions
# install.packages("ISLR")
library(ISLR) #loads the library
library(help="ISLR") #loads the library and the library documentation
help(NCI60) # loads the dataset documentation
# The NCI60 
library(help="car")

# Help for functions
rnorm
?rnorm
rnorm(n=100, mean=0, sd=1)

# More on vectors and matrices
x = c(1,2,3)
typeof(x)
y = c("a", "b", "c")
typeof(y)

u = c("1", "2", "3")
typeof(u)
v = as.numeric(u)
typeof(v)

z = c("red", 1, "yellow", 2)
typeof(z)


gender = factor(c("male", "female", "female", "male"))
gender
sum(gender == "male")
table(gender)


x = 1:5
x = seq(1, 5, length=5)
x = c(1, 2, 3, 4, 5)
2 %in% x
6 %in% x
x[2] = 10
x[3:4] = 0
x[-2] = 1   # excluded element 2
x[c(1, 4)] = 4
x[x > 4] = 10
y = log(x)
z = exp(y)
z = z + y
y = x * y
z = y / x
a = t(x) %*% y  # t() means transpose 
min(x)
max(x)
sum(x)
mean(x)
var(x)
length(x)
sort(x)
order(x)
sort(x) == x[order(x)]

# Notice the length of your vectors when doing calculations with two vectors
x = 1:5
y = 2
x - y
5 * x

z = 10:15
w = 1:2
z - w

A = matrix(1:6, nrow=3, ncol=2)
B = matrix(1:6, nrow=2, ncol=3, byrow=TRUE)
B
A %*% B # matrix multiplication
A * t(B) # elemenet multiplication
A %*% t(A)
A^2

x1 = 1:3
x2 = c(7, 6, 6)
x3 = c(12, 19, 21)
A = cbind(x1, x2, x3) # binds vectors into a matrix, vectors treated as columns
A = rbind(x1, x2, x3) # binds vectors into a matrix, vectors treated as rows

dim(A)
nrow(A)
ncol(A)
apply(A, 1, sum) # apply the sum function to the rows of A
apply(A, 2, sum) # apply the sum function to the cols of A
sum(diag(A)) # trace of A
A = diag(1:3)
solve(A) # inverse of A, in general solve(A, b) solves Ax=b wrt x
det(A)

# Plotting
x = seq(-4, 4, length = 500) # start value, finish value, number of points
y = x^2 - 1
plot(x, y, type="l", main="My plot", xlab="x", ylab="y")
abline(v=3)
abline(h=5)

boxplot(x)
hist(x)

library(ggplot2)
qplot(x,y)
qplot(x, geom="boxplot")
qplot(x, y, geom="boxplot")
qplot(x, geom="histogram")


# Writing functions
myfunction = function(x, y)
{
  n = c(length(x), length(y))
  m = c(sum(x), sum(y))
  p = m/n
  return(p)
}

a = 1:10
b = seq(from=0.1, to=1, length=10)
p = myfunction(x=a, y=b)
p

lett = c("a", "b", "c", "d", "e", "f", "g", "h")
for (i in 1:length(lett)) {
  print("Now we work with:")
  print(lett[i])
  if (lett[i] == "b") {
    print(lett[i])
  }
  else {
    if (lett[i] == "d") {
      print(lett[i])
    }
    else {
      print("not b or d")
    }
  }
}


# Lists
a = c("male", "female", "male", "male")
b = matrix(c(1:6), ncol=2)
c = rnorm(100, mean=0, sd=1)
my_list = list(a=a, b=b, c=c)

my_list[1] # = a
my_list[2] # = b
my_list[3] # = c

my_list$a
my_list$b
my_list$c

my_list[[1]][2]


# Data frames
Sick = c(0, 1, 1, 0, 0, 0, 1, 0)
Age = c(50, 15, 39, 35, 26, 20, 10, 69)
Sex = factor(c("male", "female", "female", "male", "male", "male", "female", "male"))
df = data.frame(Sick=Sick, Age=Age, Sex=Sex)
df$Sick
df$Age
df$Sex

df$Sex[2]
