library(caret)

# Load 'Iris' dataset
data(iris)

# Split dataset into training and test sets
set.seed(42)
trainIndex <- createDataPartition(iris$Species, p = 0.7, list = FALSE)
trainData <- iris[trainIndex, ]
testData <- iris[-trainIndex, ]

# Create and train a KNN classifier
model <- train(
  Species ~ ., 
  data = trainData, 
  method = "knn",
  trControl = trainControl(method = "none"),
  tuneGrid = data.frame(k = 5),
  metric = "Accuracy"
)