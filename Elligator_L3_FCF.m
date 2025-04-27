p:=2^251-9;
q:=(p-1) div 2;
w:=(p+1) div 4;
F:= FiniteField(p);
c:=F!(Random(2, p-2));
r:=c-1/c;
if IsSquare(-2+c+1/c) then
	a1:=-2+c+1/c;
	a2:=-2-c-1/c;
else
	a1:=-2-c-1/c;
	a2:=-2+c+1/c;
end if;
b:=SquareRoot(a1);
l:=a2/a1;
print "Lambda=",l;


t:=F!(Random(2, p-2));
u:=(1-t)/(1+t);
v:=-u^5+(r^2+2)*u^3-u;
d:=v^q;
e:=-d^2+d+1;
f:=(u^2-1/(c^2))^q;
X:=e*u;
Y:=(v*e)^w*e*f;
x1:=r^2*X/(1+X)^2;
y1:=r^2*Y/(1+X)^3;
x:=x1/a1;
y:=y1/b^3;
n:=1/(2*x*a1);
d:=(1-n*r^2)^2-1;
e1:=d^q;
if e1 eq 1 then
	X1:=-(1-n*r^2)+((1-n*r^2)^2-1)^w;
	z:=(b^3*(1+X1)^3*y*(X1^2-1/c^2))^q;
	e2:=-z^2+z+1;
	u1:=e2*X1;
	t1:=(1-u1)/(1+u1);
	if (t ne t1) and (t ne p-t1) then
		print "Failure";
	end if;
	if (t eq t1) or (t eq p-t1) then
		print "Success";
	end if;
else
	print "Exception";
end if;


print "end";





				
					
				
					
	
