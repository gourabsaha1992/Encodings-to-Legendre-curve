p=2^255-19
q=(p-1)/2
F=GF(p)
a2=F(289)
b2=F(515)
l=a2^2/(a2^2-b2^2)
print("Lambda=",l)
u=F(2)
A=(l+1)/2
cs=0
cf=0
for m in range(1,100000):
    r=F(randint(1,p-1))
    u0=u*r^2
    u1=1/(1+u0)
    u2=(l+1)*u1
    v=u2*(u2-1)*(u2-l)
    e2=v^q
    x=e2*(u2-A)+A
    v1=x*(x-1)*(x-l)
    y1=sqrt(v1)
    if 1<=Integer(y1) and Integer(y1)<= 2^254-9:
        y2=y1
    else:
        y2=-y1
    y=-e2*y2
    
    e1=(-x*u*(x-l-1))^q
    
    if e1 == 1:
        x0=x*(x-l-1)*u
        x1=1/x0
        if 1<=Integer(y) and Integer(y)<= 2^254-9:
            t0=x*x
            t1=-t0*x1
            r1=sqrt(t1)
        else:
            t0=(x-l-1)*(x-l-1)
            t1=-t0*x1
            r1=sqrt(t1)
    else:
        print("Exception")
    if (r == r1) or (r == p-r1):
        cs=cs+1
    if (r != r1) and (r != p-r1):
        cf=cf+1

print("Total number of success=",cs)
print("Total number of failure=",cf)
print("Success Occurs=", cs*100/(cs+cf),"%")
print("End program")	
