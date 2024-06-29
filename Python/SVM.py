from sklearn import datasets
from sklearn.model_selection import train_test_split
from sklearn.svm import LinearSVC

iris = datasets.load_iris()
X = iris.data
y = iris.target

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)

clf = LinearSVC(
    C=1.0,
    tol=0.001,
    fit_intercept=True,
    random_state=42,
    max_iter=1000
)

clf.fit(X_train, y_train)