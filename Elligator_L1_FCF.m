p:=2^255-19;
q:=(p-1) div 2;
F:= FiniteField(p);
u:=F!2;
l:=F!4;
Ex:=[];
Ey:=[];

r:=F!(Random(1, p-1));
v:=(l+1)/(1+u*r^2);
v1:=v*(v-1)*(v-l);
e:=v1^q;
x:=e*v+(1-e)*(l+1)/2;
x1:=x*(x-1)*(x-l);
y1:=SquareRoot(x1);
if 1 le Integers()!y1 and Integers()!y1 le 2^254-9 then
	y2:=y1;
else
	y2:=-y1;
end if;
y:=-e*y2;

e1:=(-x*u*(x-l-1))^q;
if e1 eq 1 then
	if 1 le Integers()!y and Integers()!y le 2^254-9 then
		r1:=SquareRoot(-x/((x-l-1)*u));
	else
		r1:=SquareRoot(-(x-l-1)/(x*u));
	end if;
else
	print "Exception";
end if;
if (r eq r1) or (r eq p-r1) then
	print "Success";
end if;

if (r ne r1) and (r ne p-r1) then
	print "Exception";
end if;

print "end program";	


