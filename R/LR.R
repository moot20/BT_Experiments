library(caret)
library(readr)

data <- read_delim('datasets/wine_quality.csv', delim = ";", col_names = TRUE)

X <- data[ , !names(data) %in% 'quality']
y <- data$quality

set.seed(42)
trainIndex <- createDataPartition(y, p = .8, list = FALSE)
X_train <- X[trainIndex, ]
X_test <- X[-trainIndex, ]
y_train <- y[trainIndex]
y_test <- y[-trainIndex]

model <- train(
  X_train,
  y_train,
  method = "lm",
  trControl = trainControl(method = "none")
)
