import pandas as pd
import numpy as np
import pickle
import matplotlib.pyplot as plt
from scipy import stats
import tensorflow as tf
import seaborn as sns
from pylab import rcParams
from sklearn import metrics
from sklearn.model_selection import train_test_split


#sns.set(style='whitegrid', palette='muted', font_scale=1.5)

#rcParams['figure.figsize'] = 14, 8

RANDOM_SEED = 42

columns = ['x-axis', 'y-axis', 'z-axis','activity']
df = pd.read_csv('./SISFALL_5CLASS.CSV', header = 0, names = columns)
df = df.dropna()
from sklearn.preprocessing import StandardScaler
# Standardizing data
X = df[['x-axis', 'y-axis', 'z-axis']]
y = df['activity']
scaler = StandardScaler()
X = scaler.fit_transform(X)
scaled_X = pd.DataFrame(data = X, columns = ['x-axis', 'y-axis', 'z-axis'])
scaled_X['activity'] = y.values
N_TIME_STEPS = 200
N_FEATURES = 3
step = 20
segments = []
labels = []
for i in range(0, len(scaled_X) - N_TIME_STEPS, step):
    xs = scaled_X['x-axis'].values[i: i + N_TIME_STEPS]
    ys = scaled_X['y-axis'].values[i: i + N_TIME_STEPS]
    zs = scaled_X['z-axis'].values[i: i + N_TIME_STEPS]
    label = stats.mode(scaled_X['activity'][i: i + N_TIME_STEPS])[0][0]
    segments.append([xs, ys, zs])
    labels.append(label)

reshaped_segments = np.asarray(segments, dtype= np.float32).reshape(-1, N_TIME_STEPS, N_FEATURES)
labels = np.asarray(pd.get_dummies(labels), dtype = np.float32)

X_train, X_test, y_train, y_test = train_test_split(
        reshaped_segments, labels, test_size=0.2, random_state=RANDOM_SEED,stratify=labels)

X_train, X_val, y_train, y_val = train_test_split(X_train, y_train, test_size=0.2, random_state=RANDOM_SEED)

from tensorflow.keras.models import load_model
model=load_model('model.h5')
model.summary()
model.save("model")
model=load_model('model')
loss, acc = model.evaluate(X_test, y_test, verbose=1)
print("Restored model, accuracy: {:5.2f}%".format(100 * acc))