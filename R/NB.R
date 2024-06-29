library(caret)
library(e1071)

data(iris)

set.seed(42)
trainIndex <- createDataPartition(iris$Species, p = 0.7, list = FALSE)
trainData <- iris[trainIndex, ]
testData <- iris[-trainIndex, ]

model <- naiveBayes(
    Species ~ ., 
    data = trainData, 
    laplace = 0
)