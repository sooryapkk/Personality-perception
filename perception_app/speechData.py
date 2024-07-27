import os
import numpy as np
import librosa
import pickle
from random import shuffle
import tflearn as tf
path = r"C:\Users\Administrator\Documents\pG Project\PERSONALITY\perception\TESS\dataset/"

list1=['book','draw','knowledge','learn','library','read','school','stud','teacher','write']
# // saveing/loading data set
def loadDataSet():
    if os.path.isfile("mal_num1.txt"):
        print("\n....DataSet is available, No need to generate....")
        with open("mal_num.txt", "rb") as fp:
            X = pickle.load(fp)
            Y = pickle.load(fp)
    else:
        print("\n....DataSet generating, May take some time....")
        X, Y = mfcc_generator()
        with open("mal_num.txt", "wb") as fp:
            pickle.dump(X, fp)
            pickle.dump(Y, fp)
    return X, Y


# // define the label set
from enum import Enum


class Target(Enum):  # labels
    digits = 1
    speaker = 2
    first_letter = 3


# // to take the speakers name as labels....(0_anu_.wav)->(anu)
def get_speakers():
    files = os.listdir(path)

    def nobad(file):
        return "_" in file and not "." in file.split("_")[1]

    speakers = list(set(map(speaker, filter(nobad, files))))
    print(len(speakers), " speakers: ", speakers)
    return speakers


def mfcc_generator(target=Target.digits):
    if target == Target.speaker: speakers = get_speakers()
    batch_features = []
    labels = []
    files = os.listdir(path)

    print("loaded batch of %d files" % len(files))
    shuffle(files)

    for wav in files:
        # if not wav.endswith(".wav"): continue
        # wave, sr = librosa.load(path + wav, mono=True)
        # label=wav.split('_')[0]
        # label=list1.index(label)
        # label=dense_to_one_hot(label)
        # labels.append(label)
        # mfcc = librosa.feature.mfcc(wave, sr)
        # # print("liborsa Mfcc = ",np.array(mfcc).shape)
        # print(len(mfcc[0]))
        # mfcc = np.pad(mfcc, ((0, 0), (0, 130 - len(mfcc[0]))), mode='constant', constant_values=0)
        # batch_features.append(np.array(mfcc))
        if not wav.endswith(".wav"): continue
        wave, sr = librosa.load(path + wav, mono=True)
        mfcc = librosa.feature.mfcc(wave, sr)
        # mfcc = np.pad(mfcc, ((0, 0), (0, 80 - len(mfcc[0]))), mode='constant', constant_values=0)
        samples = []
        label = wav.split('_')[0]
        label=list1.index(label)
        label=dense_to_one_hot(label)
        labels.append(label)
        for i in range(0, 20):
            row=[]
            for j in range(60):
                row.append(mfcc[i][j])

                # samples.append(mfcc[i][j])
            samples.append(row)
        batch_features.append(np.array(samples))
    print(np.array(batch_features).shape)
    return batch_features, labels


def mfcc_target(predict):
    batch_features = []
    files = os.listdir(predict)
    print("loaded %d audio files" % len(files))
    for wav in files:
        if not wav.endswith(".wav"): continue
        wave, sr = librosa.load(predict + wav, mono=True)
        mfcc = librosa.feature.mfcc(wave, sr)
        mfcc = np.pad(mfcc, ((0, 0), (0, 300 - len(mfcc[0]))), mode='constant', constant_values=0)
        batch_features.append(np.array(mfcc))
    print(np.array(batch_features).shape)
    return batch_features



def mfcc_target1(predict):
    batch_features = []
    files = [predict]
    # print("loaded %d audio files" % len(files))
    for wav in files:
        if not wav.endswith(".wav"): continue
        wave, sr = librosa.load(predict , mono=True)
        mfcc = librosa.feature.mfcc(wave, sr)
        mfcc = np.pad(mfcc, ((0, 0), (0, 300 - len(mfcc[0]))), mode='constant', constant_values=0)
        batch_features.append(np.array(mfcc))
    print(np.array(batch_features).shape)
    return batch_features


# // to take the speakers name as labels....(0_anu_.wav)->(anu)
def get_speakers():
    files = os.listdir(path)

    def nobad(file):
        return "_" in file and not "." in file.split("_")[1]

    speakers = list(set(map(speaker, filter(nobad, files))))
    print(len(speakers), " speakers: ", speakers)
    return speakers


def one_hot_from_item(item, items):
    # items=set(items) # assure uniqueness
    x = [0] * len(items)  # numpy.zeros(len(items))
    i = items.index(item)
    x[i] = 1
    return x


def dense_to_one_hot(batch, batch_size, num_labels):
    sparse_labels = tf.reshape(batch, [batch_size, 1])
    indices = tf.reshape(tf.range(0, batch_size, 1), [batch_size, 1])
    concatenated = tf.concat(1, [indices, sparse_labels])
    concat = tf.concat(0, [[batch_size], [num_labels]])
    output_shape = tf.reshape(concat, [2])
    sparse_to_dense = tf.sparse_to_dense(concatenated, output_shape, 1.0, 0.0)
    return tf.reshape(sparse_to_dense, [batch_size, num_labels])


def dense_to_one_hot(labels_dense, num_classes=10):
    """Convert class labels from scalars to one-hot vectors."""
    return np.eye(num_classes)[labels_dense]

