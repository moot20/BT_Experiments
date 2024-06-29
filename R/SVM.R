library(e1071)
library(caret)

data(iris)

set.seed(42)
train_indices <- createDataPartition(iris$Species, p = 0.7, list = FALSE)
train_data <- iris[train_indices, ]
test_data <- iris[-train_indices, ]

model <- svm(
    x = train_data[, -5],
    y = train_data$Species,
    type = "C-classification",
    kernel = "linear",
    cost = 1,
    tolerance = 0.001,
    scale = FALSE,
    fitted = TRUE
)