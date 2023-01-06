from numpy import sin, cos, tan, arctan, dot, radians
from numpy import sign, argmin, sqrt, eye
import matplotlib.pyplot as plt
import numpy as np
import math 
from functions import initializeMatrix, addMatrices, subtractMatrices, multiplyMatrices, transposeMatrix, inverseMatrix



#currentGPS, GPSInitial, initialAlt, correctedGPS
def llaTOxyz(lla, ll0, alt):
    array = np.zeros(3)
    rll0 = np.zeros(2)
    
    PI= 3.14159265
    R =6378137
    f =1/298.257223563

    dLat = lla[0]-ll0[0]
    dLon = lla[1]-ll0[1]

    rll0[0] = ll0[0]*PI/180
    rll0[1] = ll0[1]*PI/180
    
    Rn = R/sqrt(1-(2*f-f*f)*sin(rll0[0])*sin(rll0[0]))
    Rm = Rn*((1-(2*f-f*f))/(1-(2*f-f*f)*sin(rll0[0])*sin(rll0[0])))

    dNorth = dLat*PI/180/math.atan2(1, Rm)
    dEast  = dLon*PI/180/math.atan2(1, Rn*cos(rll0[0]))

    array[0] =dNorth
    array[1] =dEast
    array[2] =-lla[2]-alt
    
    return array
    
#Rotation matrix
def eul2rotmat(angles, rotmatrix):

    rotmatrix[0][0] = cos(angles[1])*cos(angles[2])
    rotmatrix[0][1] = sin(angles[0])*sin(angles[1])*cos(angles[2])-cos(angles[0])*sin(angles[2])
    rotmatrix[0][2] = cos(angles[0])*sin(angles[1])*cos(angles[2])+sin(angles[0])*sin(angles[2])
    rotmatrix[1][0] = cos(angles[1])*sin(angles[2])
    rotmatrix[1][1] = sin(angles[0])*sin(angles[1])*sin(angles[2])+cos(angles[0])*cos(angles[2])
    rotmatrix[1][2] = cos(angles[0])*sin(angles[1])*sin(angles[2])-sin(angles[0])*cos(angles[2])
    rotmatrix[2][0] = -sin(angles[1])
    rotmatrix[2][1] = sin(angles[0])*cos(angles[1])
    rotmatrix[2][2] = cos(angles[0])*cos(angles[1])
    
#Transformation matrix inverse
def transforMinv(angles, Minv_out):
    
    Minv_out[0][0] = 1
    Minv_out[0][1] = sin(angles[0])*tan(angles[1]) 
    Minv_out[0][2] = cos(angles[0])*tan(angles[1])
    Minv_out[1][0] = 0
    Minv_out[1][1] = cos(angles[0])
    Minv_out[1][2] = -sin(angles[0])
    Minv_out[2][0] = 0
    Minv_out[2][1] = sin(angles[0])/cos(angles[1])
    Minv_out[2][2] = cos(angles[0])/cos(angles[1])

        
def update_estimated_states(estimated_states, dxangles, dxangularspeeds, dxposition, dxvelocity, KRes, dt):
    dx = np.zeros(12) * 0.0

    dx[0]=dxangles[0][0]+KRes[0][0]
    dx[1]=dxangles[1][0]+KRes[1][0]
    dx[2]=dxangles[2][0]+KRes[2][0]
    
    dx[3]=dxangularspeeds[0]+KRes[3][0]
    dx[4]=dxangularspeeds[1]+KRes[4][0]
    dx[5]=dxangularspeeds[2]+KRes[5][0]
    
    dx[6]=dxposition[0]+ KRes[6][0]
    dx[7]=dxposition[1]+ KRes[7][0]
    dx[8]=dxposition[2]+ KRes[8][0]
    
    dx[9]=dxvelocity[0]+ KRes[9][0]
    dx[10]=dxvelocity[1]+ KRes[10][0]
    dx[11]=dxvelocity[2]+ KRes[11][0]
    
    for i in range(12):
        estimated_states[i][0]=estimated_states[i][0]+ dt*dx[i]

def updateP(Pdot, P, dt):
    for i in range(12):
        for j in range(12):
            P[i][j] = P[i][j] + dt*Pdot[i][j]
            
def haversine_distance(lat1, lon1, lat2, lon2):
   r = 6371
   phi1 = np.radians(lat1)
   phi2 = np.radians(lat2)
   delta_phi = np.radians(lat2 - lat1)
   delta_lambda = np.radians(lon2 - lon1)
   a = np.sin(delta_phi / 2)**2 + np.cos(phi1) * np.cos(phi2) *   np.sin(delta_lambda / 2)**2
   res = r * (2 * np.arctan2(np.sqrt(a), np.sqrt(1 - a)))
   #return np.round(res, 2)
   return res
   
#def EKF(double sensors[9][1], double controls[4],double dt)  
def EKF(sensors, controls, dt):

    #int counter =0;
    #PX4_ERR("ITERATION: \%d**************************************************************************",++counter);
    #static variables
    #estimated_states[0][0] roll angle
    #estimated_states[1][0] pitch angle
    #estimated_states[2][0] yaw angle
    #estimated_states[3][0] roll speed
    #estimated_states[4][0] pitch speed
    #estimated_states[5][0] yaw speed
    #estimated_states[6][0] x
    #estimated_states[7][0] y
    #estimated_states[8][0] z
    #estimated_states[9][0]  vx
    #estimated_states[10][0] vy
    #estimated_states[11][0] vz
    
    residual = np.zeros(9)* 0.0
    estimated_states = np.zeros(12).reshape(12, 1) * 0.0
    residuals = np.zeros(9).reshape(9, 1) * 0.0
    dxAngularSpeed = np.zeros(3)* 0.0
    dxPosition = np.zeros(3)* 0.0
    dxVelocity = np.zeros(3)* 0.0
    T = 0.0
    H = np.eye(9, 12, k = 0)
    r= 1.0
    R = np.eye(9) * r
    q = 10.0
    Q = np.eye(12) * q
    #pq = 0.0001
    pq = 5.0
    #pq = 5.7
    P  = np.eye(12) * pq
    #variable initialization
    #constants
    Ix = 0.005
    Iy = 0.005
    Iz = 0.009
    m = 0.8                      #1.285  drone
    kd = 0.0                     #0.027
    dragf = 1e-6                 #0.15
    thrustf = 1e-6               #0.2
    control_bias = 0.0
    L = 0.1905
    g = 9.8
    T = 4 * (controls[0] + controls[1] + controls[2] + controls[3] - 4 * control_bias) #//thrustf*...           

    F = np.matrix([[ estimated_states[4][0]*cos(estimated_states[0][0])*tan(estimated_states[1][0])-estimated_states[5][0]*sin(estimated_states[0][0])*tan(estimated_states[1][0]), estimated_states[5][0]*cos(estimated_states[0][0])*(pow(tan(estimated_states[1][0]),2) + 1)+estimated_states[4][0]*sin(estimated_states[0][0])*(pow(tan(estimated_states[1][0]),2)+ 1), 0, 1, sin(estimated_states[0][0])*tan(estimated_states[1][0]), cos(estimated_states[0][0])*tan(estimated_states[1][0]), 0, 0, 0, 0, 0, 0],
        [-estimated_states[5][0]*cos(estimated_states[0][0])-estimated_states[4][0]*sin(estimated_states[0][0]),0,0,0,cos(estimated_states[0][0]),-sin(estimated_states[0][0]),0,0,0,0,0,0],
        [(estimated_states[4][0]*cos(estimated_states[0][0]))/cos(estimated_states[1][0])-(estimated_states[5][0]*sin(estimated_states[0][0]))/cos(estimated_states[1][0]),(estimated_states[5][0]*cos(estimated_states[0][0])*sin(estimated_states[1][0]))/pow(cos(estimated_states[1][0]),2) + (estimated_states[4][0]*sin(estimated_states[0][0])*sin(estimated_states[1][0]))/pow(cos(estimated_states[1][0]),2),0,0,sin(estimated_states[0][0])/cos(estimated_states[1][0]),cos(estimated_states[0][0])/cos(estimated_states[1][0]),0,0,0,0,0,0],
        [0,0,0,0,(estimated_states[5][0]*(Iy - Iz))/Ix,(estimated_states[4][0]*(Iy - Iz))/Ix,0,0,0,0,0,0],
        [0,0,0,-(estimated_states[5][0]*(Ix - Iz))/Iy,0, -(estimated_states[3][0]*(Ix - Iz))/Iy,0,0,0,0,0,0],
        [0,0,0,(estimated_states[4][0]*(Ix - Iy))/Iz, (estimated_states[3][0]*(Ix - Iy))/Iz,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,1,0,0],
        [0,0,0,0,0,0,0,0,0,0,1,0],
        [0,0,0,0,0,0,0,0,0,0,0,1],
        [(T*(cos(estimated_states[0][0])*sin(estimated_states[2][0]) - cos(estimated_states[2][0])*sin(estimated_states[0][0])*sin(estimated_states[1][0])))/m,(T*cos(estimated_states[0][0])*cos(estimated_states[1][0])*cos(estimated_states[2][0]))/m, (T*(cos(estimated_states[2][0])*sin(estimated_states[0][0]) - cos(estimated_states[0][0])*sin(estimated_states[1][0])*sin(estimated_states[2][0])))/m,0,0,0,0,0,0,-kd/m,0,0],
        [-(T*(cos(estimated_states[0][0])*cos(estimated_states[2][0]) + sin(estimated_states[0][0])*sin(estimated_states[1][0])*sin(estimated_states[2][0])))/m,(T*cos(estimated_states[0][0])*cos(estimated_states[1][0])*sin(estimated_states[2][0]))/m,(T*(sin(estimated_states[0][0])*sin(estimated_states[2][0])+cos(estimated_states[0][0])*cos(estimated_states[2][0])*sin(estimated_states[1][0])))/m,0,0,0,0,0,0,0,-kd/m,0],
        [-(T*cos(estimated_states[1][0])*sin(estimated_states[0][0]))/m,-(T*cos(estimated_states[0][0])*sin(estimated_states[1][0]))/m,0,0,0,0,0,0,0,0,0,-kd/m]])    
    
    tau = np.arange(3) * 0.0       
    Minv = np.arange(9).reshape(3, 3) * 0.0       
    rotm = np.arange(9).reshape(3, 3) * 0.0       
    TB = np.arange(3) * 0.0 
    
    #inverseMatrix(R, Rinv)
    Rinv = np.linalg.inv(R) 
    
    angles = np.arange(3) * 0.0  
    
    angles[0] = estimated_states[0][0]
    angles[1] = estimated_states[1][0]
    angles[2] = estimated_states[2][0]
    
    angularSpeed = np.arange(3).reshape(3, 1) * 0.0 
    
    angularSpeed[0][0] = estimated_states[3][0]
    angularSpeed[1][0] = estimated_states[4][0]
    angularSpeed[2][0] = estimated_states[5][0]

    transforMinv(angles,Minv)
    eul2rotmat(angles, rotm)


    tau[0] = L * thrustf * ((controls[2]+controls[1]) - (controls[0]+controls[3])) #(controls[1] - controls[3])
    tau[1] = L * thrustf * ((controls[0]+controls[2]) - (controls[1]+controls[3])) #(controls[2]-controls[0])
    tau[2] = L * dragf * ((controls[0]+controls[1]) - (controls[2]+controls[3])) #((controls[0]+controls[1]) - (controls[2]+controls[3]))

    T2 = np.arange(3).reshape(3, 1) * 0.0 
    T2[0][0] = 0.0
    T2[1][0] = 0.0
    T2[2][0] = T
    
    TB = rotm.dot(T2)
    dxAngles = Minv.dot(angularSpeed)
    
    dxAngularSpeed[0] = tau[0]/Ix+(Iy-Iz)/Ix*angularSpeed[1][0]*angularSpeed[2][0]
    dxAngularSpeed[1] = tau[1]/Iy+(Iz-Ix)/Iy*angularSpeed[0][0]*angularSpeed[2][0]
    dxAngularSpeed[2] = tau[2]/Iz+(Ix-Iy)/Iz*angularSpeed[0][0]*angularSpeed[1][0]

    dxPosition[0]=estimated_states[9][0]
    dxPosition[1]=estimated_states[10][0]
    dxPosition[2]=estimated_states[11][0]

    dxVelocity[0]= TB[0][0]/m-kd*estimated_states[9][0]
    dxVelocity[1]= TB[1][0]/m-kd*estimated_states[10][0]
    dxVelocity[2]= -g+TB[2][0]/m-kd*estimated_states[11][0]

    Htrans = H.T
    Ftrans = F.T
    #transposeMatrix(H, Htrans);
    #transposeMatrix(F, Ftrans);

    K1 = P.dot(Htrans)
    K = K1.dot(Rinv)
    FP = F.dot(P)
    PFT = P.dot(Ftrans)
    KH = K.dot(H)
    KHP = KH.dot(P)
    Pdot1 = FP + PFT
    Pdot2 = Pdot1 - KHP
    Pdot = Pdot2 + Q
    
    for i in range(9):
        residuals[i][0] = sensors[i][0] - estimated_states[i][0]
    KRes = K.dot(residuals)
    
    update_estimated_states(estimated_states,dxAngles,dxAngularSpeed,dxPosition,dxVelocity,KRes,dt)

    #updateP(Pdot, P,dt)
    P = P + dt*Pdot
    
    if((estimated_states[8][0]<=0)):
        estimated_states[8][0]=0

    if((estimated_states[8][0]<=0) and (estimated_states[11][0]<=0)):
        estimated_states[11][0]=0

    residual[0] = abs(estimated_states[0][0]-sensors[0][0])
    residual[1] = abs(estimated_states[1][0]-sensors[1][0])
    residual[2] = abs(estimated_states[2][0]-sensors[2][0])
    residual[3] = abs(estimated_states[3][0]-sensors[3][0])
    residual[4] = abs(estimated_states[4][0]-sensors[4][0])
    residual[5] = abs(estimated_states[5][0]-sensors[5][0])
    residual[6] = abs(estimated_states[6][0]-sensors[6][0])
    residual[7] = abs(estimated_states[7][0]-sensors[7][0])
    residual[8] = abs(estimated_states[8][0]-sensors[8][0])
    
    return residual, estimated_states
    
    
def attackDetected():
    return systemCompromised

