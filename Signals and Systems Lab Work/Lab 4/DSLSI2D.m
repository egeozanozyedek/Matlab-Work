function [y] = DSLSI2D(h,x)

    [hy,hx] = size(h);
    [xy,xx] = size(x);
    
    y = zeros(hy + xy - 1, hx + xx - 1);
    
    for m = 1:hy + xy - 1
        for n = 1:hx + xx - 1
            for k = 0:hy - 1
                for l = 0:hx - 1
                    if( m-k >0 & n -l > 0 & n -l <= xx & m-k <= xy)
                        
                        y(m,n) = y(m,n)+ h(k + 1,l + 1)*x(m - k ,n - l);
                        
                    end
                end
            end
        end
    end
end