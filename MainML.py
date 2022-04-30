import pandas as pd
import numpy as np
import seaborn as sns
import warnings
from sklearn import metrics

warnings.filterwarnings('ignore')
import pickle

import random
from sklearn.feature_extraction.text import TfidfVectorizer

from sklearn.model_selection import train_test_split

from sklearn.linear_model import LogisticRegression

from sklearn.metrics import confusion_matrix, accuracy_score

datafile = pd.read_csv('data.csv', error_bad_lines=False)

print("S1")

password_tuple = np.array(datafile)
import random

random.shuffle(password_tuple)

x = [labels[0] for labels in password_tuple]
y = [labels[1] for labels in password_tuple]


def splitWords(input):
    characters = []
    for i in input:
        characters.append(i)
    return characters


print(splitWords("John123"))
print("s2")

from sklearn.feature_extraction.text import TfidfVectorizer

vectorizer = TfidfVectorizer(tokenizer=splitWords)
X = vectorizer.fit_transform(x)

from sklearn.model_selection import train_test_split

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)

from sklearn.linear_model import LogisticRegression

classification = LogisticRegression(random_state=0, multi_class='multinomial')
classification.fit(X_train, y_train)

# TAKING THE USER INPUT PASSWORD

password_input = np.array(['`#arpa12v3iN4'])
strength_output = vectorizer.transform(password_input)

# pickled_model = pickle.load(open('model.pkl', 'rb'))
# output=pickled_model.predict(strength_output)


y_pred = classification.predict(X_test)

# VARIABLE STORING THE PREDICTED RESULTS
strength_output_results = classification.predict(strength_output)

accuracy = metrics.accuracy_score(y_test, y_pred)
print('Accuracy for Logistic Regression is : ' + str(round(accuracy * 100, 2)) + '%')

if (strength_output_results == 0):
    print("WEAK")
elif (strength_output_results == 1):
    print("MODERATE")
else:
    print("STRONG")
