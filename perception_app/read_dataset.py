import os
import numpy as np
import librosa
import csv

#------------------------------
# sess = tf.Session()
# keras.backend.set_session(sess)
#------------------------------
#variables
num_classes =4
batch_size = 40
epochs = 70


# import pywt.data



#------------------------------


# import seaborn as sns

# get_ipython().run_line_magic('matplotlib', 'inline')


# Data Import
def read_dataset():
    mydict = []
    data_list = []
    label_list = []
    my_list = os.listdir(r'C:\Users\Administrator\Documents\pG Project\PERSONALITY\perception\TESS')
    i=-1
    ii=0
    for pa in my_list:

        print(pa,"==================")
        i=i+1
        for root, dirs, files in os.walk(r'C:\Users\Administrator\Documents\pG Project\PERSONALITY\perception\TESS\\' + pa):

         for f in files:


             file_path = os.path.join(r'C:\Users\Administrator\Documents\pG Project\PERSONALITY\perception\TESS\\'+pa, f)

             rr = i
             y, sr = librosa.load(file_path, mono=True)

             mfcc = librosa.feature.mfcc(y=y, sr=sr)
             toappend = []

             for e in mfcc:
                 toappend.append(str(np.mean(e)))

             data = ','.join(toappend)
             mydict.append({'Class': rr, 'Data': data})
             print(rr,file_path)

        # # ============================================================
        #

        # create csv file
        # field names
    fields = ['Class', 'Data']
    filename = "dataset.csv"

    # writing to csv file
    with open(filename, 'w') as csvfile:
        # creating a csv dict writer object
        writer = csv.DictWriter(csvfile, fieldnames=fields)

        # writing headers (field names)
        writer.writeheader()
        # writing data rows
        writer.writerows(mydict)
read_dataset()
