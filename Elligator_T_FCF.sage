p=2^251-9
q=(p-1)/2
w=(p+1)/4
F= GF(p)
s=F(885781217582490621939779951154416498242962263168949030445487048467222702855)
c=2/s^2
r=c+1/c
d=(c-1)^2/(c+1)^2
print("d=",d)
B=(c+1)*s
cs=0
cf=0

for m in range(1,100000):
    t=F(randint(2, p-2))
    u0=1-t
    u1=1/(1+t)
    u=u0*u1
    v0=u^2
    v=u*(v0+c^2)*(v0+1/c^2)
    e1=v^q
    e2=(u^2+1/(c^2))^q
    X=e1*u
    Y0=(v*e1)^w
    Y=Y0*e1*e2
    x0=r*X
    x1=(1+X)^2
    x2=Y*(x0-x1)
    w1=1/x2
    x=B*(X^2+X)*(x0-x1)*w1
    y=(x0+x1)*Y*w1
    f=-x^2+y^2-1-d*x^2*y^2
    if y+1 != 0:
        n0=(2*(y+1))
        n1=1/n0
        n=(y-1)*n1
        if ((1-n*r)^2-1)^q==1:
            x3=1-n*r
            x4=x3^2
            X=-x3+(x4-1)^w
            z=B*X*(1+X)*x*(X^2+1/c^2)
            e1=z^q
            u=e1*X
            t0=1/(1+u)
            t1=(1-u)*t0
            if (t == t1) or (t == p-t1):
                cs=cs+1
            if (t != t1) and (t != p-t1):
                cf=cf+1
        else:
            print("Failure2")
    else:
        print("Failure1")
 

print("Total number of success=",cs)
print("Total number of failure=",cf)
print("Success Occurs=", cs*100/(cs+cf),"%")
print("End program")
