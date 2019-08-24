dur = 4;
Ts = dur / 6;
hZ = generateInterp(0, Ts, dur);
hL = generateInterp(1, Ts, dur);
hI = generateInterp(2, Ts, dur);

t = -dur/2: Ts/1000: dur/2 - Ts/1000;

subplot(3,1,1); 
plot(t,hZ); 
title(['Zero-Hold Interpolation Response with Ts = 2/3']); 
xlabel('t'); 
ylabel('hZ(t)'); 
ylim([0 2]);

subplot(3,1,2); 
plot(t,hL); 
title('Linear Interpolation Response with Ts = 2/3'); 
xlabel('t'); 
ylabel('hL(t)'); 
ylim([0 2]);

subplot(3,1,3); 
plot(t,hI); 
title('Ideal Interpolation Response with Ts = 2/3'); 
xlabel('t'); 
ylabel('hI(t)'); 
ylim([0 2]);

figure(2);

dur = 7;
Ts = dur / 3;
hZ = generateInterp(0, Ts, dur);
hL = generateInterp(1, Ts, dur);
hI = generateInterp(2, Ts, dur);

t = -dur/2: Ts/1000: dur/2 - Ts/1000;

subplot(3,1,1); 
plot(t,hZ); 
title('Zero-Hold Interpolation Response with Ts = 7/3'); 
xlabel('t'); 
ylabel('hZ(t)'); 
ylim([0 2]);

subplot(3,1,2); 
plot(t,hL); 
title('Linear Interpolation Response with Ts = 7/3'); 
xlabel('t'); 
ylabel('hL(t)'); 
ylim([0 2]);

subplot(3,1,3); 
plot(t,hI); 
title('Ideal Interpolation Response with Ts = 7/3'); 
xlabel('t'); 
ylabel('hI(t)'); 
ylim([0 2]);

for i = 1:2
saveas(figure(i), ['Part3-' num2str(i) '.png']);
end
