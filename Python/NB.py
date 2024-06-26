from sklearn import datasets
from sklearn.model_selection import train_test_split
from sklearn.naive_bayes import GaussianNB

# Load 'Iris' dataset
iris = datasets.load_iris()
X = iris.data
y = iris.target

# Split dataset into training and test sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)

# Create and train a Gaussian Naive Bayes classifier
clf = GaussianNB(
    priors=None,  # Let the model compute priors from the data
    var_smoothing=1e-09  # Default value, similar to no Laplace smoothing
)
clf.fit(X_train, y_train)