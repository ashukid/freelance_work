
from tensorflow.keras.layers import Dense
from tensorflow.keras import Input, Model

from tcn import TCN, tcn_full_summary

import numpy as np
import pandas as pd
import sys




batch_size, timesteps, input_dim = None, 50, 1



i = Input(batch_shape=(batch_size, timesteps, input_dim))
o = TCN(return_sequences=True)(i)
o = Dense(1)(o)
m = Model(inputs=[i], outputs=[o])
m.compile(optimizer='adam', loss='mse',metrics=['acc'])


file_name=sys.argv[1]



df=pd.read_csv(file_name,index_col="Product_Code")

df=df.iloc[:,54:] #using normalized values for prediction

xtrain=df.iloc[:,:50].values #till 51 week data for training
ytrain=df.iloc[:,50].values


xtest=df.iloc[:,1:51].values #52nd week data for testing
ytest=df.iloc[:,51].values

xtrain=xtrain[...,np.newaxis] #increasing last dimension
ytrain=ytrain[...,np.newaxis]
xtest=xtest[...,np.newaxis]
ytest=ytest[...,np.newaxis]


m.fit(xtrain, ytrain, epochs=10, validation_split=0.1,verbose=0)



scores=m.evaluate(xtest,ytest,verbose=0)
predictions=m.predict(xtrain)


print("Predictions for week 52 !!!")
for p in predictions:
    print(int(p[0]))
print("Validation MSE : {}".format(scores[0]))

