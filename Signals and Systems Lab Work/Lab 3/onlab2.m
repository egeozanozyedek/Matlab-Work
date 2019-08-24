function onlab2

clear all;

sig = 0.1;
digit = 1;



load on_lab_assignment_3.mat;

omega=linspace(-8192*pi,8192*pi,8192*2.5+1);
omega=omega(1:end-1);

sp = 1/8192;

t = [0:sp:2.5 - sp];

X = FT(on_lab_assignment_3);
    xn = zeros(1, length(t));
    t0 = (2 * digit - 1) * 0.25 ;
for s = 1:4096
    

    xn ( (digit - 1) * 2048 + s) = X( (digit - 1) * 2048 + s);


    
    
end

    g = Gaussian(sig, t0, t);

    output = FT(on_lab_assignment_3 .* g);
    subplot(1,1,1)
    plot(omega/2/pi, abs(output));
    xlabel('f');
    ylabel('output');
    title('output signal vs frequency');
end