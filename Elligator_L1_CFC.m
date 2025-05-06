p:=2^255-19;
q:=(p-1) div 2;
F:= FiniteField(p);

a2:=F!289;
b2:=F!515;
l:=a2^2/(a2^2-b2^2);
print "Lambda=",l;
u:=F!2;

cs:=0;
cf:=0;

for m:=1 to 100000 do
	x:=F!(Random(1, p-1));
	if x ne l+1 then
		f:=x*(x-1)*(x-l);
		e:=f^q;
		if e eq 1 then
			y:=SquareRoot(f);
			e1:=(-x*u*(x-l-1))^q;
			if e1 eq 1 then
				if 1 le Integers()!y and Integers()!y le 2^254-9 then
					r:=SquareRoot(-x/((x-l-1)*u));
				else
					r:=SquareRoot(-(x-l-1)/(x*u));
				end if;
				
				v:=(l+1)/(1+u*r^2);
				v1:=v*(v-1)*(v-l);
				e2:=v1^q;
				xn:=e2*v+(1-e2)*(l+1)/2;
				x1:=xn*(xn-1)*(xn-l);
				y1:=SquareRoot(x1);
				if 1 le Integers()!y1 and Integers()!y1 le 2^254-9 then
					y2:=y1;
				else
					y2:=-y1;
				end if;
				yn:=-e2*y2;
				
				if (x eq xn) and (y eq yn) then
					cs:=cs+1;
				end if;
				
				if (x ne xn) or (y ne yn) then
					cf:=cf+1;
				end if;
			end if;
			
		end if;
	end if;
	
end for;
print "Total number of success=",cs;
print "Total number of failure=",cf;

print "Success Occurs=", cs*100/(cs+cf),"%";

print "End program";	
