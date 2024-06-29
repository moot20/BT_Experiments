library(caret)
library(cluster)

# Load the dataset
data <- read.csv('datasets/online_shoppers_intention.csv')

# Prepare the data
data$Month <- as.numeric(factor(data$Month))
data$VisitorType <- as.numeric(factor(data$VisitorType))
data$Weekend <- as.numeric(data$Weekend)
data$Revenue <- as.numeric(data$Revenue)

# Select features for clustering
features <- data[, !names(data) %in% c("Revenue")]

# Standardize the features
preproc <- preProcess(features, method=c("center", "scale"))
scaled_features <- predict(preproc, features)

# Perform K-Means clustering
n_clusters <- 3
set.seed(42)
kmeans_model <- kmeans(
    scaled_features, 
    centers = n_clusters,
    algorithm = "Lloyd",
    iter.max = 300,
    nstart = 10
)