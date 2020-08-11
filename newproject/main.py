#!/usr/bin/env python
# coding: utf-8

# In[1]:


import sys
from sklearn.naive_bayes import GaussianNB
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split


# In[2]:


data_file=sys.argv[1]
label_file=sys.argv[2]
test_file=sys.argv[3]

#data_file="./dataSets/traindata"
#label_file="./dataSets/trainingLabels.txt"
#test_file="./dataSets/testdata"

with open(data_file) as f:
    data=f.read().splitlines()

with open(label_file) as f:
    label=f.read().splitlines()
    
with open(test_file) as f:
    test_data=f.read().splitlines()



# In[88]:


data=[[float(x) for x in y.split()] for y in data]
label=[[int(x) for x in y.split()] for y in label]
label=[x[0] for x in label]
test_data=[[int(x) for x in y.split()] for y in test_data]

rows=len(data)
cols=len(data[0])


# In[90]:


def feature_selection(data,label,topk):
    values=[]

    for j in range(cols):            
        table=[[1,1],[1,1],[1,1]]
        for i in range(rows):
            
            if(data[i][j]==0):
                if(label[i]==0):
                    table[0][0]+=1
                if(label[i]==1):
                    table[0][1]+=1
            
            if(data[i][j]==1):
                if(label[i]==0):
                    table[1][0]+=1
                if(label[i]==1):
                    table[1][1]+=1
                    
            if(data[i][j]==2):
                if(label[i]==0):
                    table[2][0]+=1
                if(label[i]==1):
                    table[2][1]+=1
                    
        col_sum = [sum(c) for c in table]
        tot_sum = sum(col_sum)
        
        row_sum = [sum(c) for c in zip(*table)]
        
        exp = [[(x*y)/tot_sum for x in row_sum] for y in col_sum]
        sqr = [[((table[i][j] - exp[i][j])**2)/exp[i][j] for j in range(len(exp[0]))] for i in range(len(exp))]
        chi2 = sum([sum(x) for x in zip(*sqr)])
        values.append(chi2)
        
    index = sorted(range(len(values)), key=values.__getitem__, reverse=True)
    sorted_index= index[:topk]
    return sorted_index


# In[91]:


def get_data(data,test_data):
    indices=feature_selection(data,label,20)  
    print("Columns used in prediction : {}".format(indices))    
    new_data=[]
    new_test_data=[]
    rows=len(data)
    trows=len(test_data)
    for idx in indices:
        temp=[data[i][idx] for i in range(rows)]
        new_data.append(temp)
        
        temp=[test_data[i][idx] for i in range(trows)]
        new_test_data.append(temp)
    
    return list(zip(*new_data)),list(zip(*new_test_data))

data,test_data=get_data(data,test_data)


# In[92]:


#splitting data into training and testing
# for cross vaildation
train_x,test_x,train_y,test_y=train_test_split(data,label,test_size=0.2,shuffle=True)
# clf=GaussianNB()
clf=LogisticRegression()
clf.fit(train_x,train_y)
score=clf.score(test_x,test_y)
print("Validation score : {}".format(score))


clf=LogisticRegression()
clf.fit(data,label)
acc=clf.score(data,label)
prediction=clf.predict(test_data)

for i in range(len(test_data)):
    print(prediction[i]," ",i)
    
print("\nAccuracy : {}".format(acc))


# In[ ]:





# In[ ]:




