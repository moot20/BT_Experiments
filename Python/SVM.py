from sklearn import datasets
from sklearn.model_selection import train_test_split
from sklearn.svm import LinearSVC

# Load 'Iris' dataset
iris = datasets.load_iris()
X = iris.data
y = iris.target

# Split dataset into training and test sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)

# Create and train a linear SVM classifier
clf = LinearSVC(
    penalty='l2',
    loss='squared_hinge',
    dual=False,  # Set to False for consistency with R's primal formulation
    tol=0.001,   # Matches R's default tolerance
    C=1.0,
    multi_class='ovr',
    fit_intercept=True,
    intercept_scaling=1,
    class_weight=None,
    random_state=42,
    max_iter=1000
)
clf.fit(X_train, y_train)