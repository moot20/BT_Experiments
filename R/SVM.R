library(caret)
library(e1071)

# Datensatz 'Iris' laden
data(iris)

# Datensatz in Trainings- und Testdaten aufteilen
set.seed(42)
trainIndex <- createDataPartition(iris$Species, p = .7, list = FALSE, times = 1)
trainData <- iris[trainIndex,]
testData <- iris[-trainIndex,]

# Erstelle einen SVM-Klassifikator
model <- train(Species ~ ., data = trainData, method = 'svmLinear')