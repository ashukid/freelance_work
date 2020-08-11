
from tensorflow.keras.layers import Dense
from tensorflow.keras import Input, Model

from tcn import TCN, tcn_full_summary

import numpy as np
import pandas as pd
import sys
from tensorflow.keras.models import model_from_json


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


xtrain=xtrain[...,np.newaxis] #increasing last dimension
ytrain=ytrain[...,np.newaxis]

m.fit(xtrain, ytrain, epochs=10, validation_split=0.1,verbose=0)
model_json = m.to_json()
with open("model.json", "w") as json_file:
    json_file.write(model_json)
m.save_weights("model.h5")