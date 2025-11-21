p=2^251-9
q=(p-1)/2
w=(p+1)/4
F= GF(p)
c=F(3016255663982594907118679103531389506550614986903176944456003858844575215723)
r=c-1/c
a1=-2+c+1/c
a2=-2-c-1/c
b=(a1)^w
l=a2/a1
print("Lambda=",l)
A=r^2/a1
B=r^2/b^3
cs=0
cf=0

for m in range(1,100000):
    t=F(randint(2, p-2))
    u0=1-t
    u1=1/(1+t)
    u=u0*u1
    v0=u^2
    v=-u*(v0-c^2)*(v0-1/c^2)
    d=v^q
    e1=-d^2+d+1
    X=e1*u
    Y0=(v*e1)^w
    e2=(u^2-1/(c^2))^q
    Y=Y0*e1*e2
    x0=1+X
    x1=x0^2
    y0=x1*x0
    w1=1/y0
    x=A*X*w1*x0
    y=B*Y*w1
    n0=2*x*a1
    n=1/n0
    n1=1-n*r^2
    d=n1^2-1
    k=d^q
    if k ==1:
        X=-n1+d^w
        x2=X^2-1/c^2
        z=(b*(1+X)*y*x2)^q
        e=-z^2+z+1
        u=e*X
        t0=1/(1+u)
        t1=(1-u)*t0
        if (t == t1) or (t == p-t1):
            cs=cs+1
        if (t != t1) and (t != p-t1):
            cf=cf+1
    else:
        print("Exception")


print("Total number of success=",cs)
print("Total number of failure=",cf)
print("Success Occurs=", cs*100/(cs+cf),"%")
print("End program")
