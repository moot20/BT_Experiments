library(caret)
library(randomForest)

# Datensatz 'Iris' laden
data(iris)

# Datensatz in Trainings- und Testdaten aufteilen
set.seed(42)
trainIndex <- createDataPartition(iris$Species, p = .7, list = FALSE, times = 1)
trainData <- iris[trainIndex,]
testData <- iris[-trainIndex,]

# Erstelle einen Random Forest-Klassifikator
model <- train(Species ~ ., data = trainData, method = 'rf', trControl = trainControl(method = "none"))

# Vorhersagen erzeugen
predictions <- predict(model, testData)

# Genauigkeit evaluieren
confusionMatrix(predictions, testData$Species)