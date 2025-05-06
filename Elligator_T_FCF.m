p:=2^251-9;
q:=(p-1) div 2;
w:=(p+1) div 4;
F:= FiniteField(p);

s:=F!(1448573058369429308243345664660065188672521474273304514513418071481299370944);
c:=2/s^2;
r:=c+1/c;
d:=(c-1)^2/(c+1)^2;
print "d=",d;

cs:=0;
cf:=0;

for m:=1 to 100000 do
	t:=F!(Random(2, p-2));
	u:=(1-t)/(1+t);
	v:=u^5+(r^2-2)*u^3+u;
	e:=v^q;
	f:=(u^2+1/(c^2))^q;
	X:=e*u;
	Y:=((v*e)^w)*e*f;
	x:=(c+1)*s*X*(X+1)/Y;
	y:=(r*X+(1+X)^2)/(r*X-(1+X)^2);
	f:=-x^2+y^2-1-d*x^2*y^2;
	if y+1 ne 0 then
		n:=(y-1)/(2*(y+1));
		if IsSquare((1-n*r)^2-1) eq true then
			X1:=-(1-n*r)+((1-n*r)^2-1)^w;
			z:=(c+1)*s*X1*(1+X1)*x*(X1^2+1/c^2);
			e1:=z^q;
			u1:=e1*X1;
			t1:=(1-u1)/(1+u1);
			if (t eq t1) or (t eq p-t1) then
				cs:=cs+1;
			end if;
			if (t ne t1) and (t ne p-t1) then
				cf:=cf+1;
			end if;
		else
			print "Failure2";
		end if;
	else
		print "Failure1";
	end if;	
end for;
print "Total number of success=",cs;
print "Total number of failure=",cf;

print "Success Occurs=", cs*100/(cs+cf),"%";

print "End program";
