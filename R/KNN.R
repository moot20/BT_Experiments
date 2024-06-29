library(caret)

data(iris)

set.seed(42)
trainIndex <- createDataPartition(iris$Species, p = 0.7, list = FALSE)
trainData <- iris[trainIndex, ]
testData <- iris[-trainIndex, ]

model <- train(
  Species ~ ., 
  data = trainData, 
  method = "knn",
  trControl = trainControl(method = "none"),
  tuneGrid = data.frame(k = 5)
)