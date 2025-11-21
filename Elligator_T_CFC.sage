p=2^251-9
q=(p-1)/2
w=(p+1)/4
F= GF(p)
s=F(2)
c=2/s^2
B=(c+1)*s
r=c+1/c
d=(c-1)^2/(c+1)^2
print("start")
cs=0;
cf=0
for m in range(0,100000):
    y=F(randint(0, p-2))
    x2=(y^2-1)/(1+d*y^2)
    e=x2^q
    if e == 1:
        x=x2^w
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
            t=(1-u)*t0
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
            x_=B*(X^2+X)*(x0-x1)*w1
            y_=(x0+x1)*Y*w1
            if (x == x_) and (y == y_):
                cs=cs+1
            if (x != x_) or (y != y_):
                cf=cf+1
print("Number total success=",cs)
print("Number total failure=",cf)
print("Success Occurs=", cs*100/(cs+cf),"%")
print("End program")


