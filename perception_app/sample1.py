import tflearn
import numpy as np
import speechData
import tensorflow as tf
from sklearn.model_selection import train_test_split
from sklearn.metrics import confusion_matrix

import librosa
import os
res=os.listdir(r"C:\Users\Administrator\Documents\pG Project\PERSONALITY\perception\TESS\dataset")
print(len(res))

import csv
mydict = []
# import matplotlib.pyplot as plt
# from google_trans_new import google_translator


#.............preprocessing & feature extraction.................
for r in res:
    import numpy as np
    rr=r.split('_')[0]
    y, sr = librosa.load(r"C:\Users\Administrator\Documents\pG Project\PERSONALITY\perception\TESS\dataset/" + r, mono=True)

    mfcc = librosa.feature.mfcc(y=y, sr=sr)
    toappend=[]

    for e in mfcc:
        toappend.append( str(np.mean(e)))


    data=','.join(toappend)
    mydict.append({'Class':rr, 'Data': data})

# # ============================================================
#

#create csv file
# field names
fields = ['Class', 'Data']

# name of csv file
filename = "dataset.csv"

# writing to csv file
with open(filename, 'w') as csvfile:
    # creating a csv dict writer object
    writer = csv.DictWriter(csvfile, fieldnames=fields)

    # writing headers (field names)
    writer.writeheader()
    # writing data rows
    writer.writerows(mydict)

#

outputlabels=["പുസ്തകം","വരയ്ക്കുക","അറിവ്","പഠിക്കുക","ലൈബ്രറി","വായിക്കുക","സ്കൂൾ","വിദ്യാർത്ഥി","അധ്യാപകൻ","എഴുതുക"]

#
# #.................training & testing .....................
#
learning_rate = 0.00001
training_iters = 10  # steps
#
width = 20  # mfcc features
height = 60  # (max) length of utterance
classes = 10  # digits
#
X, Y = speechData.loadDataSet()
trainX, testX, trainY, testY = train_test_split(X, Y, test_size=0.20, random_state=4)
print("Train data = ", np.asarray(trainX).shape, " : ", type(trainX))
print("Train label = ", np.asarray(trainY).shape, " : ", type(trainY))
 #print(trainY[0:1])
print("Test data = ", np.asarray(testX).shape, " : ", type(testX))
print("Test label = ", np.asarray(testY).shape, " : ", type(testY))

# Network building
net = tflearn.input_data([None, width, height])
net = tflearn.lstm(net, 128, dropout=0.8)
net = tflearn.fully_connected(net, classes, activation='softmax')
net = tflearn.regression(net, optimizer='adam', learning_rate=learning_rate, loss='categorical_crossentropy')
#
model = tflearn.DNN(net, tensorboard_verbose=0)
if not os.path.isfile("tflearn.lstm.model.meta"):
# model.load("tflearn.lstm.model") // for repeated turning by removeing not from if .
    print("lenth******************************===========")
    print(trainY)
    print(len(trainX[0]))
    model.fit(trainX, trainY, n_epoch=training_iters, validation_set=(testX, testY), show_metric=True,batch_size=10)

    print("\nSLNO  :  Predict -> Label\n")

    lt = len(testX)
    for i in range(1, lt + 1):
            print(i, "\t:  ", np.argmax(model.predict(testX[i - 1:i])), " --> ", np.argmax(testY[i - 1:i]))
    model.save("tflearn.lstm.model")
else:
        #translator = google_translator()

        model.load("tflearn.lstm.model")
        print("\n....Model is already trained....\n")
        print("\nSLNO  :  Predict -> Label\n")
        curt = 0
        lt = len(testX)
        ytest=[]
        ans=[]


        for i in range(1, lt + 1):
            p = np.argmax(model.predict(testX[i - 1:i]))
            v = np.argmax(testY[i - 1:i])
            ans.append(p)
            ytest.append(v)
            if p == v:
                curt += 1
            #translate_text = translator.translate(str(outputlabels[int(p)]), lang_src='en', lang_tgt='ml')

            print(i, "\t:  ", int(p)+1,outputlabels[int(p)], " --> ", int(v+1))


        cm=confusion_matrix(ytest,ans)
        print("confusion_matrix")
        print(cm)
        print("\n\t ACCURACY : ", curt / lt)
#..........................prediction..............

# print("Prediction   Result")
# files = os.listdir("predict/")
# #print(len(files))
# for wav in files:
#     if not wav.endswith(".wav"): continue
#     model.load("tflearn.lstm.model")
#
#     T = speechData.mfcc_target1("predict/"+wav)
#     #lt = len(T)
#     pp = np.argmax(model.predict(T))
#     print(outputlabels[int(pp)])
# #
# #plot


# no_of_recordings=len(res)
# plt.figure(figsize=(30,5))
# index=np.arange(len(res))
# plt.bar(index,no_of_recordings)
# plt.xlabel('commands',fontsize=12)
# plt.ylabel('No of recordings',fontsize=12)
# #plt.xticks(index,res,fontsize=15,rotation=36)
# plt.title('no.of recordings of each command')
# plt.show()
