from sklearn import datasets
from sklearn.model_selection import train_test_split
from sklearn import svm

# Datensatz 'Iris' laden
iris = datasets.load_iris()
X = iris.data
y = iris.target

# Datensatz in Trainings- und Testdaten aufteilen
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)

# Erstelle einen SVM-Klassifikator
clf = svm.SVC(kernel='linear')

# Träniere den Klassifikator
clf.fit(X_train, y_train)