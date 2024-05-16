# Project descriptiion
Sweet Lift Taxi company has collected historical data on taxi orders at the airports. To attract more drivers during peak hours, predict the amount of taxi orders for the next hour. Build a predictive model with the RMSE metric with a value less than 48. 
* Resampled historical data to change the time interval of the series to fit the model training.
* Applied exploratory data analysis and statistical decomposition to recognize trends and seasonality in the data. 
* Utilized autocorrelation, partial autocorrelation and rolling mean to create lag and mean features to improve the time series modeling.
* Created machine learning models, including Linear Regression, Random Forest Regressor and LGBMRegressor to predict the number of taxi orders for the next hour. 
* The best model was the Random Forest Regressor using GridSearchCV to tune the hyperparameters.