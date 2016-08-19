atom=[]
xO=[]
yO=[]
zO=[]
xX=[]
yX=[]
zX=[]
N=0 #atom number

sample=open('GeomO','r')
while True:
        line=sample.readline()
        if len(line)==0:
                break
        word=line.split()
        atom=atom+[word[0]]
        xO=xO+[float(word[1])]
        yO=yO+[float(word[2])]
        zO=zO+[float(word[3])]
        N+=1
sample.close()

sample=open('GeomX','r')
while True:
        line=sample.readline()
        if len(line)==0:
                break
        word=line.split()
        xX=xX+[float(word[1])]
        yX=yX+[float(word[2])]
        zX=zX+[float(word[3])]
sample.close()

step=16 # <------
for i in range(1,step):
        filename='GI_Ener_Cal-'+str(i)+'.com'
        f=open(filename,'w')
        for j in range(N):
                x=round(xO[j]+(xX[j]-xO[j])/step*i,6)
                y=round(yO[j]+(yX[j]-yO[j])/step*i,6)
                z=round(zO[j]+(zX[j]-zO[j])/step*i,6)
                f.write(atom[j]+' '+str(x)+' '+str(y)+' '+str(z)+'\n')
        f.close()
