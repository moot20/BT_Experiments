library(caret)
library(e1071)  # Required for naiveBayes model

# Load 'Iris' dataset
data(iris)

# Split dataset into training and test sets
set.seed(42)
trainIndex <- createDataPartition(iris$Species, p = 0.7, list = FALSE)
trainData <- iris[trainIndex, ]
testData <- iris[-trainIndex, ]

# Create and train a Naive Bayes classifier
model <- naiveBayes(
    Species ~ ., 
    data = trainData, 
    laplace = 0  # No Laplace smoothing, similar to Python's default
)