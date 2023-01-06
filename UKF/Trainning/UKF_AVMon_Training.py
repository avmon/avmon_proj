#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from time import sleep, time

from mpl_toolkits.mplot3d import Axes3D
from ekf2 import llaTOxyz, EKF, haversine_distance
#from time import sleep

import tensorflow as tf
from tensorflow.keras import layers
from sklearn.preprocessing import MinMaxScaler
from filterpy.common import Q_discrete_white_noise

import mpu
import time
from keras.models import Sequential
from keras.layers import Dense
from keras.layers import LSTM
from keras.layers import Dropout
import math
#############################################################################################################
#average value for each sensor of the 9 sensors
def Average(l): 
    avg = sum(l) / len(l) 
    return avg

#############################################################################################################
errors = []
#############################################################################################################
#############################################################################################################
#                                            data read
#############################################################################################################
# You can use any trajectory as you want


#datafile = 'complex_plan_full_speed_cpu.csv'
datafile = 'complex_plan_slow_speed_cpu.csv'
#datafile = 'complex_plan_with_hold_cpu.csv'
#datafile = 'square_plan_full_speed_cpu.csv'
#datafile = 'square_plan_slow_cpu.csv'
#datafile = 'square_plan_with_hold_cpu.csv'
  

data_location = datafile


columns = ["timestamp", "lat", "lon", "alt", "roll_body", "pitch_body", "yaw_body", "roll_speed", "pitch_speed", "yaw_speed", 
"actuators_output_0", "actuators_output_1", "actuators_output_2", "actuators_output_3", "actuators_output_4", 
"actuators_output_5", "actuators_output_6", "actuators_output_7", "actuators_output_8", "actuators_output_9", 
"actuators_output_10", "actuators_output_11", "sensor_gyro_rad_0", "sensor_gyro_rad_1", "sensor_gyro_rad_2", 
"sensor_acc_0", "sensor_acc_1", "sensor_acc_2", "cpuload"]

#Importing the dataset
#uav_main_data = pd.read_csv(data_location,header=None)
#uav_main_data = pd.read_csv(data_location,header=None,names=columns)
uav_main_data = np.genfromtxt(data_location, delimiter=',', unpack=False,skip_header=1)

timestamp = uav_main_data[:, 0]
lat = uav_main_data[:, 1]
lon = uav_main_data[:, 2]
alt = uav_main_data[:, 3]
roll_body = uav_main_data[:, 4]
pitch_body = uav_main_data[:,5]
yaw_body = uav_main_data[:, 6]
roll_speed = uav_main_data[:, 7]
pitch_speed = uav_main_data[:, 8]
yaw_speed = uav_main_data[:, 9]
output0 = uav_main_data[:, 10]
output1 = uav_main_data[:, 11]
output2 = uav_main_data[:, 12]
output3 = uav_main_data[:, 13]
output4 = uav_main_data[:, 14]
output5 = uav_main_data[:, 15]
GyroX   = uav_main_data[:, 22]
GyroY   = uav_main_data[:, 23]
GyroZ   = uav_main_data[:, 24]
AccX    = uav_main_data[:, 25]
AccY    = uav_main_data[:, 26]
AccZ    = uav_main_data[:, 27]

data_size = len(uav_main_data)
#############################################################################################################
RadiusEarth = 6378388.0 # m
arc= 2.0*np.pi*(RadiusEarth+alt)/360.0 # m/

dx = arc * np.cos(lat*np.pi/180.0) * np.hstack((0.0, np.diff(lon))) # in m
dy = arc * np.hstack((0.0, np.diff(lat))) # in m

mx = np.cumsum(dx)
my = np.cumsum(dy)

#############################################################################################################
#                                            data pre-ptocessing
#############################################################################################################

fig = plt.figure(figsize=(12,9))
ax = plt.axes(projection='3d')
# Measurements
ax.scatter3D(mx,my,alt, s=50, label='GPS Measurements', marker='+')

# Start/Goal
ax.scatter3D(mx[0],my[0], s=60, label='Start', c='r')
ax.scatter3D(mx[-1],my[-1], s=60, label='Goal', c='g')

ax.set_xlabel('X Label')
ax.set_ylabel('Y Label')
ax.set_zlabel('Z Label')
ax.set_title('Position') 


correctedGPS_array = np.zeros(data_size * 3).reshape(data_size, 3) * 0.0 
currentGPS = np.zeros(3) * 0.0
correctedGPS = np.zeros(3) * 0.0 
initialGPS = np.zeros(2) * 0.0 

for i in range(data_size):
    if i == 0:
        initialGPS[0] = lat[i]/10000000.0
        initialGPS[1] = lon[i]/10000000.0
        initialAlt = alt[i]/1000.0
    else:
        currentGPS[0] = lat[i]/10000000.0
        currentGPS[1] = lon[i]/10000000.0
        currentGPS[2] = - alt[i]/1000.0
        correctedGPS = llaTOxyz(currentGPS, initialGPS, initialAlt)
        correctedGPS_array[i][0] = correctedGPS[0]
        correctedGPS_array[i][1] = correctedGPS[1]
        correctedGPS_array[i][2] = correctedGPS[2]


delta_acc = 0.0
for i in range(data_size): 
    if i > 0 and i < 10:
        delta = timestamp[i] - timestamp[i - 1]
        delta_ins = delta / 1000000.0
        delta_acc += delta_ins
        dt = round(delta_acc/i,1)
              
        
#noise = Q_discrete_white_noise(dim=2, dt=dt, var=0.005)
#print(noise)

mx2 = correctedGPS_array[:,0]
my2 = correctedGPS_array[:,1]
alt2 = correctedGPS_array[:,2]


fig2 = plt.figure(figsize=(12,9))
ax2 = plt.axes(projection='3d')
# Measurements
ax2.scatter3D(mx2,my2,alt2, s=50, marker='+')

# Start/Goal
ax2.scatter3D(mx2[0],my2[0], s=60, label='Start', c='r')
ax2.scatter3D(mx2[-1],my2[-1], s=60, label='Goal', c='g')

ax2.set_xlabel('X Label')
ax2.set_ylabel('Y Label')
ax2.set_zlabel('Z Label')
ax2.set_title('GPS Measurements Position')


#############################################################################################################
#                                            AVMon filter 
#############################################################################################################

data_size = len(uav_main_data)
train_size = int(data_size * 0.67)
test_size = data_size - train_size

sensors_array = np.column_stack((roll_body,pitch_body,yaw_body,roll_speed,pitch_speed,yaw_speed,correctedGPS_array[:,0],correctedGPS_array[:,1],correctedGPS_array[:,2]))
sensors_next = sensors_array[:-1]
sensors_next = np.insert(sensors_next, 0, sensors_next[0],axis = 0)    

controls_array = np.zeros(data_size * 6).reshape(data_size, 6) * 0.0 
residual_array = np.zeros(data_size * 9).reshape(data_size, 9) * 0.0 
residual_array2 = np.zeros(data_size * 9).reshape(data_size, 9) * 0.0 
residual_array3 = np.zeros(data_size * 9).reshape(data_size, 9) * 0.0 
residual_list = np.zeros(9)* 0.0

residual_distance_array = np.zeros(data_size) * 0.0 
residual_distance_array2 = np.zeros(data_size) * 0.0 

controls_array[:,0] = (output0-1000)/1000.0
controls_array[:,1] = (output1-1000)/1000.0
controls_array[:,2] = (output2-1000)/1000.0
controls_array[:,3] = (output3-1000)/1000.0
controls_array[:,4] = (output4-1000)/1000.0
controls_array[:,5] = (output5-1000)/1000.0

sensors = np.zeros(9).reshape(9, 1) * 0.0 
controls= np.zeros(4) * 0.0 
estimated_states = np.zeros(12).reshape(12, 1) * 0.0
estimated_states_array = np.zeros(data_size * 12).reshape(data_size, 12) * 0.0

dt = 0.1              

for i in range(data_size):  
    sensors[0][0]=roll_body[i]
    sensors[1][0]=pitch_body[i]
    sensors[2][0]=yaw_body[i]
    sensors[3][0]=roll_speed[i]
    sensors[4][0]=pitch_speed[i]
    sensors[5][0]=yaw_speed[i]
    sensors[6][0]=correctedGPS_array[i][0]
    sensors[7][0]=correctedGPS_array[i][1]
    sensors[8][0]=correctedGPS_array[i][2]
    controls[0]=controls_array[i][0]
    controls[1]=controls_array[i][1]
    controls[2]=controls_array[i][2]
    controls[3]=controls_array[i][3]
    residual, estimated_states = EKF(sensors,controls,dt)
    #sleep(0.1)
    for j in range(9):
        residual_array[i][j] = residual[j]
        residual_array2[i][j] = np.sqrt(((sensors_next[i][j] - estimated_states[j][0]) ** 2))
        residual_array3[i][j] = sensors_next[i][j] - estimated_states[j][0]       
        residual_list[j] = abs(residual_array3[i][j])
    for k in range(12):
        estimated_states_array[i][k] = estimated_states[k][0]
  
###########################################################################
roll_angle_est = estimated_states_array[:,0]    #roll angle
pitch_angle_est = estimated_states_array[:,1]   #pitch angle
yaw_angle_est = estimated_states_array[:,2]     #yaw angle
roll_speed_est = estimated_states_array[:,3]    #roll speed
pitch_speed_est = estimated_states_array[:,4]   #pitch speed
yaw_speed_est = estimated_states_array[:,5]     #yaw speed 
x_est = estimated_states_array[:,6]             # X
y_est = estimated_states_array[:,7]             # Y
z_est = estimated_states_array[:,8]             # z   
vx_est = estimated_states_array[:,9]            # vX
vy_est = estimated_states_array[:,10]           # vY
vz_est = estimated_states_array[:,11]           # vz  


###########################################################################
Errors_roll_angle_before = residual_array3[:,0]
Errors_pitch_angle_before = residual_array3[:,1]
Errors_yaw_angle_before = residual_array3[:,2]  
Errors_roll_speed_before = residual_array3[:,3]
Errors_pitch_speed_before = residual_array3[:,4]
Errors_yaw_speed_before = residual_array3[:,5]  
Errors_x_before = residual_array3[:,6]
Errors_y_before = residual_array3[:,7]
Errors_z_before = residual_array3[:,8]  


fig3 = plt.figure(figsize=(12,9))
ax3 = plt.axes(projection='3d')
# Measurements
ax3.scatter3D(x_est,y_est,z_est, s=50, marker='+')


ax3.set_xlabel('X Label')
ax3.set_ylabel('Y Label')
ax3.set_zlabel('Z Label')
ax3.set_title('EKF Position')

'''
#############################################################################################################
# Training
#############################################################################################################
measurements_training_in = np.column_stack((roll_body,pitch_body,yaw_body,roll_speed,pitch_speed,yaw_speed,AccX,AccY,AccZ,GyroX,GyroY,GyroZ))
measurements_training_out = np.column_stack((Errors_x_before, Errors_y_before, Errors_z_before,
Errors_roll_angle_before, Errors_pitch_angle_before, Errors_yaw_angle_before, 
Errors_roll_speed_before, Errors_pitch_speed_before, Errors_yaw_speed_before))
scaler_in = MinMaxScaler()
scaler_out = MinMaxScaler()

# IGNORE WARNING ITS JUST CONVERTING TO FLOATS
# WE ONLY FIT TO TRAININ DATA, OTHERWISE WE ARE CHEATING ASSUMING INFO ABOUT TEST SET
scaler_in.fit(measurements_training_in)
scaled_train_in = scaler_in.transform(measurements_training_in)
scaler_out.fit(measurements_training_out)
scaled_train_out = scaler_out.transform(measurements_training_out)

training_in, testing_in = scaled_train_in[0:train_size,:], scaled_train_in[train_size:data_size,:]
training_out, testing_out = scaled_train_out[0:train_size,:], scaled_train_out[train_size:data_size,:]

#############################################
NAME = "Kalman-ANN"
model = tf.keras.models.Sequential() 
model.add(tf.keras.layers.Dense(256, activation=tf.nn.relu)) 
model.add(tf.keras.layers.Dense(128, activation=tf.nn.relu)) 
model.add(tf.keras.layers.Dense(64, activation=tf.nn.relu))
model.add(tf.keras.layers.Dense(9, activation=tf.nn.relu)) 


model.compile(loss='mean_squared_error',optimizer='adam',metrics=['accuracy'],)

history = model.fit(training_in, training_out, epochs=2000, batch_size=100) # train the model

#history = model.fit(scaled_train_in, scaled_train_out, epochs=500, batch_size=100,
#validation_split=0.2,
# callbacks=[tensorboard]) # train the model
model.save('AVMon.model')
print(model.summary())

loss = history.history['loss']

epochs = range(1,len(loss)+1)

plt.clf()
SKIP = 0
plt.plot(epochs[SKIP:], loss[SKIP:],'r.',label = "Training_loss")
#plt.plot(epochs[SKIP:], val_loss[SKIP:],'b.',label = "Validation_loss")
#plt.title('Training and Validation loss')
plt.title('Training loss')
plt.xlabel('Epochs')
plt.ylabel('Loss')
plt.legend()
plt.show()
'''
