import pandas as pd
from sklearn.preprocessing import StandardScaler
from sklearn.cluster import KMeans
from sklearn.metrics import silhouette_score

# Load the dataset
data = pd.read_csv('datasets/online_shoppers_intention.csv')

# Prepare the data
data['Month'] = pd.factorize(data['Month'])[0]
data['VisitorType'] = pd.factorize(data['VisitorType'])[0]
data['Weekend'] = data['Weekend'].astype(int)
data['Revenue'] = data['Revenue'].astype(int)

# Select features for clustering
features = data.drop(['Revenue'], axis=1)

# Standardize the features
scaler = StandardScaler()
scaled_features = scaler.fit_transform(features)

# Perform K-Means clustering
n_clusters = 3
kmeans = KMeans(
    n_clusters=n_clusters,
    init='random',
    n_init=10,
    max_iter=300,
    random_state=42
)

kmeans.fit(scaled_features)