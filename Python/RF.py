from sklearn import datasets
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier

# Load 'Iris' dataset
iris = datasets.load_iris()
X = iris.data
y = iris.target

# Split dataset into training and test sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)

# Create and train a Random Forest classifier
clf = RandomForestClassifier(
    n_estimators=500,  # Matching R's default ntree
    criterion='gini',
    max_features='sqrt',  # Equivalent to R's default mtry for classification
    min_samples_leaf=1,  # Equivalent to R's default nodesize for classification
    bootstrap=True,
    oob_score=True,  # To match R's out-of-bag error estimation
    n_jobs=-1,  # Use all available cores for efficiency
    random_state=42
)
clf.fit(X_train, y_train)
