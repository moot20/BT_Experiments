library(randomForest)
library(caret)

data(iris)

set.seed(42)
trainIndex <- createDataPartition(iris$Species, p = 0.7, list = FALSE)
trainData <- iris[trainIndex, ]
testData <- iris[-trainIndex, ]

model <- randomForest(
    Species ~ .,
    data = trainData,
    ntree = 100, # Python default
    replace = TRUE,  # Python default
)