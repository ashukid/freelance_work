from tensorflow.keras.layers import Dense
from tensorflow.keras import Input, Model

from tcn import TCN, tcn_full_summary

import numpy as np
import pandas as pd
import sys
from tensorflow.keras.models import model_from_json


batch_size, timesteps, input_dim = None, 50, 1


file_name=sys.argv[1]
df=pd.read_csv(file_name,index_col="Product_Code")

df=df.iloc[:,54:] #using normalized values for prediction
xtest=df.iloc[:,1:51].values #52nd week data for testing
ytest=df.iloc[:,51].values

xtest=xtest[...,np.newaxis]
ytest=ytest[...,np.newaxis]

json_file = open('model.json', 'r')
loaded_model_json = json_file.read()
json_file.close()
loaded_model = model_from_json(loaded_model_json,custom_objects={'TCN': TCN})
# load weights into new model
loaded_model.load_weights("model.h5")
print("Loaded model from disk")
 
# evaluate loaded model on test data
loaded_model.compile(loss='mse', optimizer='adam', metrics=['accuracy'])
scores = loaded_model.evaluate(xtest, ytest, verbose=0)
predictions=loaded_model.predict(xtrain)


print("Predictions for week 52 !!!")
for p in predictions:
    print(int(p[0]))
print("Validation MSE : {}".format(scores[0]))