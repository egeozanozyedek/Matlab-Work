function [xR] =DtoA(type, Ts, dur, Xn) 

p = generateInterp(type, Ts, dur); 

l=length(Xn)*1000+length(p); 

xR=zeros(1,l);

for x=1:length(Xn)
    xR(1+1000*(x-1):1000*(x-1)+length(p))=Xn(x)*p+xR(1+1000*(x-1):1000*(x-1)+length(p));
end 

xR= xR(500*length(Xn) + 1: end- 500*length(Xn));

end 