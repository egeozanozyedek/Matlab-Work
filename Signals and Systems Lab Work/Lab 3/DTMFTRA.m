function [x] = DTMFTRA(Number)

    num_length = length(Number);
    
    t = [0:1/16384:0.25];
    
    t = t(1:end - 1);
    
    x = zeros(1, num_length * length(t));
    
    freq = [ 941 697 697 697 770 770 770 852 852 852;
             1336 1209 1336 1477 1209 1336 1477 1209 1336 1477];
    
    for n = 1:num_length

        num = Number(n);
            
        num_freq = [freq(1,num + 1) freq(2,num + 1)]';
        x(1, (n - 1) * length(t) + 1: n * length(t) ) = cos(2 * pi * num_freq(1) .* t) + cos(2 * pi * num_freq(2) .* t);
       
    end
end
