library(e1071)
library(caret)

# Load 'Iris' dataset
data(iris)

# Split dataset into training and test sets
set.seed(42)
train_indices <- createDataPartition(iris$Species, p = 0.7, list = FALSE)
train_data <- iris[train_indices, ]
test_data <- iris[-train_indices, ]

# Create and train a linear SVM classifier
model <- svm(
    x = train_data[, -5],
    y = train_data$Species,
    type = "C-classification",
    kernel = "linear",
    cost = 1,        # Equivalent to C in sklearn
    tolerance = 0.001,  # Equivalent to tol in sklearn
    scale = FALSE,
    fitted = TRUE,
    cache.size = 40,
    epsilon = 0.1
)