#!/usr/bin/env python
# coding: utf-8

# In[1]:


import sys

data_file=sys.argv[1]
label_file=sys.argv[2]
eta=float(sys.argv[3])
stop=float(sys.argv[4])


with open(data_file) as f:
    data=f.read().splitlines()

with open(label_file) as f:
    label=f.read().splitlines()


# In[2]:


data=[[float(x) for x in y.split()] for y in data]
label=[[int(x) for x in y.split()] for y in label]

features=len(data[0])

def column(matrix,i):
    return [row[i] for row in matrix]


label_dict={}
for i in range(len(label)):
    label_dict[label[i][1]]=label[i]
    
target_id=label_dict.keys()
    
train=[]
test=[]
for i in range(len(data)):
    if(i in target_id):
        cur_label=label_dict[i][0]
        temp=data[i]
        if(cur_label==0):
            cur_label=0
        temp.append(cur_label)
        train.append(temp)
    else:
        temp=data[i]
        temp.append(i)
        test.append(temp)        

assert len(train)+len(test)==len(data)


# In[4]:


features=len(train[0])-1
w=[0.1]*features #weights
b=0.1 #bias


# In[74]:


def exp(x):
    return (2.718)**x

def sigmoid(x):
    return 1/(1+exp(-x))

def forward(x):
    out=0
    for i in range(features):
        out += x[i]*w[i]
    out+=b
    
    # using sigmoid for logistic regression
    out = sigmoid(out)
    return out


# In[75]:


prev_iter_error=99999
for epoch in range(100000):
    for i in range(len(train)):
        batch=train[i]
        x=batch[:-1]
        y=batch[-1]

        out=forward(x)
        current_iter_error=(out-y)**2 ##least square error
        if(abs(prev_iter_error - current_iter_error) < stop):
            break
        prev_iter_error=current_iter_error

        
        # gradient descent
        dw=(out-y)*out*(1-out)
        for j in range(features):
            w[j] = w[j] - eta*dw*x[j]
        b = b - eta*dw


# In[77]:


for i in range(len(test)):
    batch=test[i]
    x=batch[:-1]
    idd=batch[-1]
    out=forward(x)
    # sigmoid thresholding for logistic regression
    out = 1 if out>=0.5 else 0
    print(out,idd)


