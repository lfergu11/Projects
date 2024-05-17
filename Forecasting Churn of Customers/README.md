# Project description
Created machine learning models to predict whether a customer will leave the bank soon using the data on clients' past behavior and termination of contracts with the bank. 
* Addressed class imbalance in the target value through upsampling of the training dataset.
* Used encoding & scaling methods to improve training of the machine learning models. 
* Machine learning models created includes Logistic Regression, Random Forest Classifier, KNeighborsClassifier, and CatBoost Classifier.
* Used GridSearchCV to tune hyperparameters for the Random Forest Classifier to optimize F1 score. 
* By sending the predicted churning customers promotions, assuming a typical rate of conversion this model will reduce churn by 325.