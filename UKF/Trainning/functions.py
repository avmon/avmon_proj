import numpy as np

#initialize
def initializeMatrix(array , row, col):
    for i in range(row):
        for j in range(col):
            array[i][j]=0.0


#addition
def addMatrices(arrayA, arrayB, arrayC, row, col):
    for i in range(row):
        for j in range(col):
            arrayC[i][j] = arrayA[i][j] + arrayB[i][j]


#subtraction
def subtractMatrices(arrayA, arrayB, arrayC, row, col):
    for i in range(row):
        for j in range(col):
            arrayC[i][j] = arrayA[i][j] - arrayB[i][j]


#multiplication
def multiplyMatrices(arrayA, arrayB, arrayC, row, col, col2):
    for i in range(row):
        for j in range(col2):
            for k in range(col):
                arrayC[i][j] += arrayA[i][k] * arrayB[k][j]


#transpose
def transposeMatrix(arrayA, result, row, col):
    for i in range(row):
        for j in range(col):
            result[j][i] = arrayA[i][j]


#inverse
def inverseMatrix(array, arrayReturn, size):

    arrayA = np.arange(size * size * 2).reshape(size, size * 2) * 0.0
    for i in range(size):
        for j in range(size):
            arrayA[i][j] = array[i][j]
    
    a = 0
    ratio = 0
    n = size
    
    for i in range(n):
        for temp in range(n):
            j = temp + n
            if(i==(j-n)):
                arrayA[i][j] = 1.0
            else:
                arrayA[i][j] = 0.0

    for i in range(n):
        for j in range(n):
            if(i!=j):
                ratio = arrayA[j][i] / arrayA[i][i]
                for k in range(2*n):
                    arrayA[j][k] -= ratio * arrayA[i][k]           
            
    for i in range(n):
        a = arrayA[i][i]
        for j in range(2*n):
           arrayA[i][j] /= a 
    
    for i in range(n):
        for temp in range(n):
            j = temp + size
            arrayReturn[i][j-n]=arrayA[i][j]
            