# Load libraries
import pandas as pd
from sklearn.tree import DecisionTreeClassifier # Import Decision Tree Classifier
from sklearn.model_selection import train_test_split # Import train_test_split function
from sklearn import metrics #Import scikit-learn metrics module for accuracy calculation
from DBOperations import *
def decisionalgo(userid="NA",Z_test=[]):
    col_names = ['attempts',	'marks',	'label']
    # load dataset
    pima = pd.read_csv("dataset.csv", header=0, names=col_names)
    #split dataset in features and target variable
    feature_cols = ['attempts',	'marks' ]
    X = pima[feature_cols] # Features
    y = pima.label # Target variable
    # Split dataset into training set and test set
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=1) # 70% training and 30% test
    # Create Decision Tree classifer object
    clf = DecisionTreeClassifier()

    # Train Decision Tree Classifer
    clf = clf.fit(X_train,y_train)
    #Z_test=[[1,	1],[50,	0],[12,	1]]
    #Z_test=getScores(userid)
    #Predict the response for test dataset
    print(Z_test)

    y_pred = clf.predict(Z_test)
    print(y_pred)
    return y_pred

    # Model Accuracy, how often is the classifier correct?
    #print("Accuracy:",metrics.accuracy_score(y_test, y_pred))


