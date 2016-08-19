# -*- coding: utf-8 -*-
import random
import numpy as np
from scipy import linalg as LA
from scipy.optimize import fmin_l_bfgs_b as opt

####### initialization of parameters #######
n=6 # dimension <<<<<<<<--------------------
rmax=0.01 # max radius of the hypersphere <<<<<<<<--------------------
x0=np.ones(n-1) # initial guess <<------
I=np.identity(n)
M=np.zeros((n,n))

####### reading initial Geometry Energy, Gradient and Hessian #######
Q0=np.empty((n,1))
sample=open('Geom','r')
line=sample.readline()
word=line.split()
for i in range (n):
	Q0[i]=[float(word[i])]
sample.close() # geometry

E0=-153.568720464994 # energy <<<<<<<---------------------

g0=np.empty((n,1))
sample=open('Grad','r')
line=sample.readline()
word=line.split()
for i in range (n):
	g0[i]=[float(word[i])]
sample.close() # gradient

H0=np.empty((n,n))
sample=open('Hess','r')
N=int(n/5)+1
for i in range(N):
	for j in range(5*i,n):
		line=sample.readline()
		word=line.split()
		if (j<5+5*i):
			for k in range(j-5*i+1):
				H0[j][k+5*i]=float(word[k])
				H0[k+5*i][j]=float(word[k])
		else:
			H0[j][0+5*i]=float(word[0])
			H0[j][1+5*i]=float(word[1])
			H0[j][2+5*i]=float(word[2])
			H0[j][3+5*i]=float(word[3])
			H0[j][4+5*i]=float(word[4])
			H0[0+5*i][j]=float(word[0])
			H0[1+5*i][j]=float(word[1])
			H0[2+5*i][j]=float(word[2])
			H0[3+5*i][j]=float(word[3])
			H0[4+5*i][j]=float(word[4]) # hessian 

####### generate vector P ########
P=np.empty((n,1))
norm=LA.norm(g0)
mm=[0] # just in case, and this is for determine m
for i in range(1,n):
	if (abs(g0[i])>abs(g0[mm[0]])):
		mm=[i,]
	elif (abs(g0[i]==abs(g0[mm[0]]))):
		mm.append(i)
	P[i]=g0[i]/norm # determine direction
P[0]=g0[0]/norm # direction complete
r=0.1*norm**2 # r corresponds to norm, maximum is half steplength <<<<<<<<---------------------
if (r>rmax):
	r=rmax
P*=r
C=Q0-P # center of hypersphere

random.shuffle(mm)
m=mm[0] # m is the index of largest projection axis

####### U construction #######
def unitary(x0):
	for i in range(m):
		M[m][i]=x0[i]
		M[i][m]=-x0[i]
	for i in range(m+1,n):
		M[m][i]=x0[i-1]
		M[i][m]=-x0[i-1]
	U=LA.expm(M)
	return U

def Energy(x0):
	U=unitary(x0)
	dQ=(U-I).dot(P)
	E=E0+g0.T.dot(dQ)+0.5*dQ.T.dot(H0).dot(dQ)
	return E

####### optimization #######
res=opt(Energy,x0,approx_grad=1)
x=res[0] #optimized parameters
Q=unitary(x).dot(P)+C

####### output result #######
print np.reshape(Q,(n/3,3))
