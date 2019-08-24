function echoCancellation
clear all;

voice = audiorecorder(16384,16,1); 
recordblocking(voice,5);
x = getaudiodata(voice);
x = x';
x = x(1:81920);
audiowrite('Recorded.wav', x, 16384);

[x, samplerate] = audioread('Recorded.wav');
t= 0:1/16384:9-1/16384;

Ai = [0.75 0.5 0.4 0.25 0.2 0.1];

ti = [0.5 1 1.5 2 3 4];

syms n


h(1,1) = 1;
for n = 1:6
h(1, samplerate * ti(n)) = Ai(n);
end

y = conv(h,x);

Y = FT(y');

omega=linspace(-16384*pi,16384*pi,16384*9);
omega=omega(1:end-1);


H = FT(h);
Xe = Y(1:65536) ./ H;

xe = IFT(Xe');

subplot(1,1,1);
plot(xe);
xlabel('sample rate');
ylabel('xe(t), the estimated sound');
title('xe(t) vs sr');


end