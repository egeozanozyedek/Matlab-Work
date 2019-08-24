function [y]= DTLTI(a,b,x,Ny)

y=zeros(1,Ny);
Nx = length(x);

for n = 0:Ny-1
    
    for l = 1:length(a)
        if n + 1 - l > 0
            y(n + 1)=y(n + 1)+a(l)*y(n + 1-l);
        end
    end
    
    for k = 1:length(b)
        if n + 1 - (k-1) > 0 && n + 1 - (k-1) <= Nx
            y(n + 1)=y(n + 1)+b(k)*x(n +1 -(k-1));
        end 
    end
    
end
