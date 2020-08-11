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

features=len(data[0])

def column(matrix,i):
    return [row[i] for row in matrix]


label_dict={}
for i in range(len(label)):
    label_dict[label[i][1]]=label[i]
    
target_id=label_dict.keys()
    
train_0=[]
train_1=[]
test=[]
for i in range(len(data)):
    if(i in target_id):
        cur_label=label_dict[i][0]
        temp=data[i]
        temp.append(cur_label)
        if(cur_label==0):
            train_0.append(temp)
        else:
            train_1.append(temp)
    else:
        temp=data[i]
        temp.append(i)
        test.append(temp)        

assert len(train_0)+len(train_1)+len(test)==len(data)


mean_0=[]
mean_1=[]
std_0=[]
std_1=[]

def findMean(x):
    return sum(x)/len(x)

def power(x):
    return x**2

def sqrt(x):
    return x**(1/2.0)

def findStd(x):
    mean=findMean(x)
    var=[power(i-mean) for i in x]
    var=sum(var)/(len(var))
    return sqrt(var)

for i in range(features):
    mean_0.append(findMean(column(train_0,i)))
    std_0.append(findStd(column(train_0,i)))
    mean_1.append(findMean(column(train_1,i)))
    std_1.append(findStd(column(train_1,i)))


prior_0=len(train_0)/(len(train_0)+len(train_1))
prior_1=len(train_1)/(len(train_0)+len(train_1))


def exp(x):
    return (2.718)**x

def gaussianD(x,mean,std):
    std=std+0.0001
    temp = exp(-(power(x-mean))/(2*power(std)))
    temp = temp/sqrt(2*3.14*power(std))
    return temp

def gaussianNB(x):
    prob_0=prior_0
    prob_1=prior_1
    for i in range(features):
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

