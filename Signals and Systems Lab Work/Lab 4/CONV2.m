function [y, M, N] = CONV2(x, h, Mx2, Nx2, Mh2, Nh2)

[Mx, Nx] = size(x);

[Mh, Nh] = size(h);



M = Mh2 + Mx2 - 1;
N = Nh2 + Nx2 -1;

y = zeros(Mx + Mh - 1, Nx + Nh - 1);

for k= 0:Mh-1
    for l= 0:Nh-1
        y(k+1:k+Mx,l+ 1 :l+Nx)=y(k+1:k+Mx,l+1:l+Nx)+h(k+1,l+1)*x; 
    end
end


end