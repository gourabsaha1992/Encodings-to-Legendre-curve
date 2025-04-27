p:=2^251-9;
q:=(p-1) div 2;
w:=(p+1) div 4;
F:= FiniteField(p);
s:=F!2;
c:=2/s^2;
r:=c+1/c;
d:=(c-1)^2/(c+1)^2;

y:=F!(Random(0, p-2));
x2:=(y^2-1)/(1+d*y^2);
e:=x2^q;
if e eq 1 then
	x:=x2^w;
	n:=(y-1)/(2*(y+1));
	if IsSquare((1-n*r)^2-1) eq true then
		X:=-(1-n*r)+((1-n*r)^2-1)^w;
		z:=(c+1)*s*X*(1+X)*x*(X^2+1/c^2);
		e1:=z^q;
		u:=e1*X;
		t:=(1-u)/(1+u);
		u1:=(1-t)/(1+t);
		v1:=u1^5+(r^2-2)*u1^3+u1;
		e2:=v1^q;
		f:=(u1^2+1/(c^2))^q;
		X1:=e2*u1;
		Y1:=((v1*e2)^w)*e2*f;
		x1:=(c+1)*s*X1*(X1+1)/Y1;
		y1:=(r*X1+(1+X1)^2)/(r*X1-(1+X1)^2);
		if (x ne x1) or (y ne y1) then
			print "Failure";
		end if;
		if (x eq x1) and (y eq y1) then
			print "Success";
		end if;
	else
		print "Reject Encoding";
	end if;
else
	print "Reject y";
end if;

print "end";
























