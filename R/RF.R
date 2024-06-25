library(randomForest)
library(caret)

# Load 'Iris' dataset
data(iris)

# Split dataset into training and test sets
set.seed(42)
trainIndex <- createDataPartition(iris$Species, p = 0.7, list = FALSE)
trainData <- iris[trainIndex, ]
testData <- iris[-trainIndex, ]

# Create and train a Random Forest classifier
model <- randomForest(
    Species ~ .,
    data = trainData,
    ntree = 500,
    mtry = floor(sqrt(ncol(trainData) - 1)),  # Default for classification
    nodesize = 1,  # Default for classification
    importance = FALSE,
    proximity = FALSE,
    replace = TRUE,  # Default bootstrap sampling
    keep.forest = TRUE,
    keep.inbag = FALSE
)