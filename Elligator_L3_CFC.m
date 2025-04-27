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
b:=(a1)^w;
l:=a2/a1;
print "Lambda=",l;



x:=F!(Random(1, p-1));
f:=x*(x-1)*(x-l);
e:=f^q;
if e eq 1 then
	y:=f^w;
	n:=1/(2*x*a1);
	d:=(1-n*r^2)^2-1;
	k:=d^q;
	if k eq 1 then
		X:=-(1-n*r^2)+((1-n*r^2)^2-1)^w;
		z:=(b^3*(1+X)^3*y*(X^2-1/c^2))^q;
		e:=-z^2+z+1;
		u:=e*X;
		t:=(1-u)/(1+u);
		u1:=(1-t)/(1+t);
		v1:=-u1^5+(r^2+2)*u1^3-u1;
		d:=v1^q;
		e1:=-d^2+d+1;
		f:=(u1^2-1/(c^2))^q;
		X1:=e1*u1;
		Y1:=(v1*e1)^w*e1*f;
		x2:=r^2*X1/(1+X1)^2;
		y2:=r^2*Y1/(1+X1)^3;
		x1:=x2/a1;
		y1:=y2/b^3;
		if (x eq x1) and (y eq y1) then
			print "Success";
		end if;
		if (x ne x1) or (y ne y1) then
			print "Success";
		end if;
	else
		print "Reject Encoding";
	end if;
else
	print "Reject x";
end if;	
	

print "end program";





				
					
				
					
	
