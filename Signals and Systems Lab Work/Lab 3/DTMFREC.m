function DTMFREC
 
clear all;
 
number = [2 1 7 0 3 3 7 4];
omega=linspace(-16384*pi,16384*pi,16384*2.00+1);
omega=omega(1:end-1);
    for d = 1:8
    window = zeros(1, length(omega));
    window (4096 * (d - 1) + 1: d * 4096) = ones(1, 4096);
    x = DTMFTRA(number);
    x_digit = x .* window;
 
    X_digit = FT(x_digit);
 
 
    subplot(2,4,d);
    plot(omega/2/pi ,abs(X_digit));
    D = string(d);
    xlabel('f');
    ylabel(['|X' D '(œ)|']);
    title(['FT of digit' D]);
 
    end
end
