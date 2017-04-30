#get the housing data
url1 <- "http://archive.ics.uci.edu/ml/machine-learning-databases/housing/housing.data"
data <- read.table(url, header = FALSE)

#get some insight into the dsts
data_header <- c("CRIM", "ZN", "INDUS", "CHAS", "NOX", "RM", "AGE", "DIS", "RAD", "TAX", "PTRATIO", "B", "LSTAT", "MEDV" )
colnames(data) <- data_header
head(data)
summary(data)
str(data)

#is there any missing value?
sum(is.na(data))

#provide some plots for exploratory data analysis 
library(ggplot2)

#histogram of median value of the housing price in 1000$
ggplot(data, aes(x = MEDV)) + geom_histogram(breaks = seq(min(data$MEDV), max(data$MEDV), 5 ), col = 'grey', fill = 'blue') + 
        xlab('Median values in $1000')


#provide plot of MEDV based on a subset of the independent variables
p1 <- ggplot(data, aes(x = CRIM, y = MEDV)) + geom_point() + geom_smooth() + xlab('Crime') + ylab('Median values in $1000')
p2 <- ggplot(data, aes(x = TAX, y = MEDV)) + geom_point() + geom_smooth() + xlab('Tax') + ylab('Median values in $1000')
p3 <- ggplot(data, aes(x = LSTAT, y = MEDV)) + geom_point() + geom_smooth() + xlab('Lower status of the population') + ylab('Median values in $1000')
p4 <- ggplot(data, aes(x = DIS, y = MEDV)) + geom_point() + geom_smooth() + xlab('weighted distances to five Boston employment centres') + ylab('Median values in $1000')
fourplots = list(p1, p2, p3, p4)
library("gridExtra")
do.call(grid.arrange,  fourplots)
