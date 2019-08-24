clear all;
close all;

D5=mod(21703374,5);
a=0;
M=3+D5;
k=[0:M-1];
b=exp(-k / 3);
x=1;
n=[0:10];
Ny=length(n);
y=DTLTI(a,b,x,Ny);
stem(n,y, 'fill', 'Color', 'k');
title('Impulse Response for a = 0 b = e^{-k/3}');
xlabel('n');
ylabel('h[n]');

figure(2);

omega = -pi:0.001:pi;

H = 0;

for k = 0:6
    H = H + exp(-k * (j * omega + 1/3));
end
subplot(2,1,1)
plot(omega, abs(H),'-k');
title('Fourier Transform of Impulse Response');
xlabel('ω');
ylabel('|H(e^{jω})|');


%gain
subplot(2,1,2)

gain = 20 * log10(abs(H));
plot(omega/(2 * pi), gain,'-k');
ylim([(max(gain) - 3) (max(gain) )]);

title('The Gain of H(e^{jω})');
xlabel('f');
ylabel('dB');

figure(3);

L = [256 128 512];

for i = 1:3
    
    n = [0:L(i) - 1];
    func = exp(j * (pi / L(i)) * n.^2 );
    y = DTLTI(a, b, func, length(n));
    xaxis = linspace(0, 2 * pi, L(i));
    subplot(3,2,(2 * i - 1));
    plot(xaxis, abs(y));
    xlim([0 2*pi]);
    title(['Discreet - Time Chirp, Magnitude, L = ' num2str(L(i)) ]);
    xlabel('ω');
    ylabel('|Y(e^{jω}|');
    subplot(3,2,(2 * i));
    plot(xaxis, angle(y));
    xlim([0 2*pi]);
    title(['Discreet - Time Chirp, Phase, L = ' num2str(L(i)) ]);
    xlabel('ω');
    ylabel('phase of Y');

    
end

p1=(4+j*10)/((117)^(0.5));
p2=(5+j*9)/((107)^(0.5));
z1=(3+j*7)/((58)^(0.5));

figure(4);

omega = [0:0.001:2*pi];
filt = (exp(j .* omega) - z1)./((exp(j .* omega) - p1) .* (exp(j .* omega) - p2));
plot(omega ,abs(filt))
xlabel('ω')
ylabel('|H(e^{jω})|')
title('The Magnitude Response');

a = [(p1 + p2) (-p1 * p2)];
b = [1 -z1];

figure(5);

L = [256 128 512 2^20];

for i = 1:4
    if (i == 4)
        figure(6);
        n = [0:L(i) - 1];
        func = exp(j * (pi / L(i)) * n.^2 );
        y = DTLTI(a, b, func, length(n));
        xaxis = linspace(0, 2 * pi, L(i));
        subplot(2,1,1);
        plot(xaxis, abs(y));
        xlim([0 2*pi]);
        title(['Discreet - Time Chirp, Magnitude, L = ' num2str(L(i)) ]);
        xlabel('ω');
        ylabel('|Y(e^{jω}|');
        subplot(2,1,2);
        plot(xaxis, angle(y));
        xlim([0 2*pi]);
        title(['Discreet - Time Chirp, Phase, L = ' num2str(L(i)) ]);
        xlabel('ω');
        ylabel('phase of Y');
    else
        
    n = [0:L(i) - 1];
    func = exp(j * (pi / L(i)) * n.^2 );
    y = DTLTI(a, b, func, length(n));
    xaxis = linspace(0, 2 * pi, L(i));
    subplot(3,2,(2 * i - 1));
    plot(xaxis, abs(y));
    xlim([0 2*pi]);
    title(['Discreet - Time Chirp, Magnitude, L = ' num2str(L(i)) ]);
    xlabel('ω');
    ylabel('|Y(e^{jω}|');
    subplot(3,2,(2 * i));
    plot(xaxis, angle(y));
    xlim([0 2*pi]);
    title(['Discreet - Time Chirp, Phase, L = ' num2str(L(i)) ]);
    xlabel('ω');
    ylabel('phase of Y');
    end
end



for i = 1:6
saveas(figure(i), ['Figure' num2str(i) '.png'])
end


