from tensorflow.keras.layers import Dense,Flatten,LSTM,Dropout
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from tensorflow.keras.models import Sequential
from tensorflow.keras.regularizers import l2
from tensorflow.keras.optimizers import Adam
from keras.callbacks import ModelCheckpoint
import matplotlib.pyplot as plt
from pylab import rcParams
from tensorflow import keras
from sklearn import metrics
from scipy import stats
import tensorflow as tf
import seaborn as sns
import tensorflow as tf
import pandas as pd
import numpy as np
import os
RANDOM_SEED = 42

columns = ['x-axis', 'y-axis', 'z-axis','gx-axis', 'gy-axis', 'gz-axis','activity']
df = pd.read_csv(r'C:\Users\saifm\Downloads\Documents\ECE\Graduation_Project\SisFall\SisFall_dataset\SISFALL\FULL_DATA\SISFALL_34CLASS.csv', header = 0, names = columns)
df = df.dropna()
df1=df[['x-axis', 'y-axis', 'z-axis']]
df1=df1*(32.0 / 8192.0)
y = df[['activity']]
df1['activity'] = y.values
scale_columns = ['x-axis', 'y-axis', 'z-axis']
scaler = StandardScaler()
scaler = scaler.fit(df1[scale_columns])
df1.loc[:, scale_columns] = scaler.transform(df1[scale_columns].to_numpy())
values = df1[['x-axis', 'y-axis', 'z-axis']]
labels = df1['activity']

from scipy import stats
def create_dataset(X, y, time_steps=1, step=1):
    Xs, ys = [], []
    for i in range(0, len(X) - time_steps, step):
        v = X.iloc[i:(i + time_steps)].values
        labels = y.iloc[i: i + time_steps]
        Xs.append(v)        
        ys.append(stats.mode(labels)[0][0])
    return np.array(Xs), np.array(ys).reshape(-1, 1)

TIME_STEPS = 200
STEP = 40

Xdata, Ylabel = create_dataset(
    values, 
    labels, 
    TIME_STEPS, 
    STEP)


from sklearn.preprocessing import OneHotEncoder
enc = OneHotEncoder(handle_unknown='ignore', sparse=False)
enc = enc.fit(Ylabel)
Ylabel = enc.transform(Ylabel)



X_train, X_test, y_train, y_test = train_test_split(Xdata, Ylabel, test_size=0.2, random_state=RANDOM_SEED,stratify=Ylabel)
X_train, X_val, y_train, y_val = train_test_split(X_train, y_train, test_size=0.2, random_state=RANDOM_SEED)

BATCH_SIZE = 128
input_shape=([X_train.shape[1], X_train.shape[2]])
model = Sequential()
model.add(LSTM(100, input_shape=input_shape))
model.add(Dense(100, activation='relu'))
model.add(Dense(y_train.shape[1], activation='softmax'))
model.compile(loss='categorical_crossentropy', optimizer='adam', metrics=['accuracy'])
history = model.fit(X_train, y_train, epochs=15, batch_size=BATCH_SIZE, validation_data=(X_val,y_val),verbose=1, shuffle=True)

export_dir = 'saved_model/1'
tf.saved_model.save(model, export_dir)
_, accuracy = model.evaluate(X_test, y_test, verbose=1)
y_pred=model.predict(X_test)
print(accuracy)

mode = "Speed" 
if mode == 'Storage':
    optimization = tf.lite.Optimize.OPTIMIZE_FOR_SIZE
elif mode == 'Speed':
    optimization = tf.lite.Optimize.OPTIMIZE_FOR_LATENCY
else:
    optimization = tf.lite.Optimize.DEFAULT

converter = tf.lite.TFLiteConverter.from_saved_model(export_dir)

converter.allow_custom_ops = True
# converter.target_spec.supported_ops = [tf.lite.OpsSet.TFLITE_BUILTINS,
#                                    tf.lite.OpsSet.SELECT_TF_OPS]

converter.optimizations = [optimization]

tflite_model = converter.convert()
# Save the model.
import pathlib
tflite_model_file = pathlib.Path('./model.tflite')
tflite_model_file.write_bytes(tflite_model)