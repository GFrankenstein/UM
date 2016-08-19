x=[]
y=[]
z=[]
N=2 #atom number
sample=open('coord_tmp','r')
for i in range(N):
	line=sample.readline()
        word=line.split()
        x=x+[float(word[0])]
        y=y+[float(word[1])]
        z=z+[float(word[2])]
sample.close()
print 'C',x[0],y[0],z[0]
print 'C',x[0],-y[0],-z[0]
print 'C',-x[0],-y[0],z[0]
print 'C',-x[0],y[0],-z[0]
print 'H',x[1],y[1],z[1]
print 'H',x[1],-y[1],-z[1]
print 'H',-x[1],-y[1],z[1]
print 'H',-x[1],y[1],-z[1]
