# -*- coding: utf-8 -*-
import os
import numpy as np
from scipy import linalg as LA
from scipy.optimize import fmin_l_bfgs_b as opt

n=int(os.popen("sed '/^ *$/d' GeomO | wc -l | awk '{print $1}'").read()) # number of atoms
Q=np.empty((n,3))
sample=open('GeomO','r')
for i in range(n):
        line=sample.readline()
        word=line.split()
        Q[i,0]=float(word[2])
        Q[i,1]=float(word[3])
        Q[i,2]=float(word[4])
sample.close() # reading geometry

def Energy(Q):
	f=open('Geom_tmp','w')
	f.write(str(np.reshape(Q,(n,3))))
	f.close()
        result=os.popen('Cal_Energy.sh','r')
	E=result.read()
	if (len(E)!=0):
		E=float(E)
		f=open('Geom_app','a')
		f.write('\n\n'+str(np.reshape(Q,(n,3))))
		f.write('\n\n'+str(E))
		f.close()
		return E
	else:
		return 0

res=opt(Energy,Q,approx_grad=1)
x=res[0] #optimized parameters
print np.reshape(x,(n,3))
print Energy(x)
