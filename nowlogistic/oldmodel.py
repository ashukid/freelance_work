import numpy as np
import pandas as pd
import math
import sys

#data_file="./climate_simulation/climate.data"
#label_file="./climate_simulation/climate.trainlabels.0"

data_file=sys.argv[1]
label_file=sys.argv[2]

with open(data_file) as f:
    data=f.read().splitlines()

with open(label_file) as f:
    label=f.read().splitlines()



data=[[float(x) for x in y.split()] for y in data]
label=[[int(x) for x in y.split()] for y in label]

data=np.array(data)
label=np.array(label)


data=pd.DataFrame(data)
label=pd.DataFrame(label,columns=["y","id"])
label_0=label.loc[label.y==0,:]
label_1=label.loc[label.y==1,:]

train_0=data.loc[data.index.isin(label_0.id),:].values
train_1=data.loc[data.index.isin(label_1.id),:].values
test=data.loc[~data.index.isin(label.id),:]

test.insert(test.shape[1], "y", test.index.values, True) 
test=test.values

assert train_0.shape[0]+train_1.shape[0]+test.shape[0] == data.shape[0]

mean_0=[]
mean_1=[]
std_0=[]
std_1=[]

def findMean(x):
    return sum(x)/len(x)

def findStd(x):
    mean=findMean(x)
    var=[math.pow(i-mean,2) for i in x]
    var=sum(var)/(len(var))
    return math.sqrt(var)

for i in range(data.shape[1]):
    mean_0.append(findMean(train_0[:,i]))
    std_0.append(findStd(train_0[:,i]))
    mean_1.append(findMean(train_1[:,i]))
    std_1.append(findStd(train_1[:,i]))


prior_0=len(train_0)/(len(train_0)+len(train_1))
prior_1=len(train_1)/(len(train_0)+len(train_1))


def gaussianD(x,mean,std):
    temp = math.exp(-(math.pow(x-mean,2))/(2*math.pow(std,2)))
    temp = temp/math.sqrt(2*math.pi*math.pow(std,2))
    return temp

def gaussianNB(x):
    prob_0=prior_0
    prob_1=prior_1
    for i in range(data.shape[1]):
        prob_0 *= gaussianD(x[i],mean_0[i],std_0[i])
        prob_1 *= gaussianD(x[i],mean_1[i],std_1[i])

        
    if(prob_0>prob_1):
        return 0
    else:
        return 1




for i in range(len(test)):
    curx=test[i]
    out=gaussianNB(curx)
    print(out,int(curx[-1]))



