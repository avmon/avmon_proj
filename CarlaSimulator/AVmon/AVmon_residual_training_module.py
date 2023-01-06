# -*- coding: utf-8 -*-
import numpy as np
import matplotlib.pyplot as plt


import tensorflow as tf
from sklearn.preprocessing import MinMaxScaler
import joblib
#############################################################################################################
#                                            data read
#############################################################################################################

data_location = 'Carla_Logging.csv' # file can be generated through running the simulator multiple times


columns = ["Simulation_time","speed","accelerometer_X","accelerometer_Y","accelerometer_Z","yaw","roll","pitch",
           "steer","location_X","location_Y","estimated_location_X","estimated_location_Y",
           'error_x','error_y','error_x_new','error_y_new','attack_event']

#Importing the dataset

main_data = np.genfromtxt(data_location, delimiter=',', unpack=False,skip_header=1)

timestamp   = main_data[:, 1]
speed       = main_data[:, 2]
acc_X       = main_data[:, 3]
acc_Y       = main_data[:, 4]
acc_Z       = main_data[:, 5]
yaw         = main_data[:, 6]
roll        = main_data[:, 7]
pitch       = main_data[:, 8]
steer       = main_data[:, 9]
location_X  = main_data[:, 10]
location_Y  = main_data[:, 11]
est_loc_X   = main_data[:, 12]
est_loc_Y   = main_data[:, 13]
error_x     = main_data[:, 14]
error_y     = main_data[:, 15]


data_size = len(main_data)

print(data_size)
location_Z = np.zeros(data_size) * 1.0 

fig1  = plt.figure(figsize=(12,6))
plt.plot(location_X,location_Y, color='red')
plt.show()

fig2 = plt.figure(figsize=(12,9))
ax3 = plt.axes(projection='3d')
# Measurements
ax3.scatter3D(location_X,location_Y,location_Z)


ax3.set_xlabel('X Label')
ax3.set_ylabel('Y Label')
ax3.set_zlabel('Z Label')
ax3.set_title('trajectory Position')

#############################################################################################################
# Training
#############################################################################################################
measurements_training_in = np.column_stack((speed,acc_X,acc_Y,acc_Z,yaw,steer))
measurements_training_out = np.column_stack((error_x,error_y))
scaler_in = MinMaxScaler()
scaler_out = MinMaxScaler()

# IGNORE WARNING ITS JUST CONVERTING TO FLOATS
# WE ONLY FIT TO TRAININ DATA, OTHERWISE WE ARE CHEATING ASSUMING INFO ABOUT TEST SET
scaler_in.fit(measurements_training_in)
scaled_train_in = scaler_in.transform(measurements_training_in)
scaler_out.fit(measurements_training_out)
scaled_train_out = scaler_out.transform(measurements_training_out)

#############################################
NAME = "Kalman-ANN"
#tensorboard = TensorBoard(log_dir="NNlogs/{}".format(NAME)) #http://localhost:6006/

model = tf.keras.models.Sequential() # a basic feed-forward model
model.add(tf.keras.layers.Dense(256, activation=tf.nn.relu)) # a simple fully-connected layer, 128 units, relu activation
model.add(tf.keras.layers.Dense(64, activation=tf.nn.relu)) # our output layer. 10 units for 10 classes. Softmax for probability distribution
model.add(tf.keras.layers.Dense(2, activation=tf.nn.relu)) # our output layer. 10 units for 10 classes. Softmax for probability distribution

model.compile(loss='mean_squared_error',optimizer='adam',metrics=['accuracy'],)

history = model.fit(scaled_train_in, scaled_train_out, epochs=1000, batch_size=10) # train the model

#history = model.fit(scaled_train_in, scaled_train_out, epochs=500, batch_size=100,
#validation_split=0.2,
# callbacks=[tensorboard]) # train the model

joblib.dump(scaler_in,  'scaler_in.gz')
joblib.dump(scaler_out, 'scaler_out.gz')
model.save('AVMon.model')
print(model.summary())

loss = history.history['loss']
#val_loss = history.history['val_loss']

epochs = range(1,len(loss)+1)

plt.clf()
#SKIP = 300
SKIP = 0
plt.plot(epochs[SKIP:], loss[SKIP:],'r.',label = "Training_loss")
#plt.plot(epochs[SKIP:], val_loss[SKIP:],'b.',label = "Validation_loss")
#plt.title('Training and Validation loss')
plt.title('Training loss')
plt.xlabel('Epochs')
plt.ylabel('Loss')
plt.legend()
plt.show()

