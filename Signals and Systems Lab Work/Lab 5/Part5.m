
clear all;

a=randi([2,6]);
Ts=1/(10*a);
Ts = 1/100
t=0:Ts:4 - Ts;
g=linspace(0,0,length(t));

g(1:1/Ts)=3*t(0/Ts+1:1/Ts)/2 - 1;
g(1/Ts+1:2/Ts)=1/2;
g(2/Ts+1:4/Ts)=(3-t(2/Ts+1:4/Ts))/2;

stem(linspace(0,4,length(t)), g, '-k');
title(['Stem Plot of g(nTs) for a = ' num2str(a)]);
xlabel('t');
ylabel('g(nTs)');

figure(2);

gZ = DtoA(0, Ts, 4, g);
subplot(3,1,1);
plot(linspace(0,4,length(gZ)), gZ, '-r', 'Linewidth', 1);
title(['Plot of Zero-Hold Interpolation, a = ' num2str(a)]);
xlabel('t');
ylabel('gZ(t)');

gL = DtoA(1, Ts, 4, g);
subplot(3,1,2);
plot(linspace(0,4,length(gL)), gL, '-r', 'Linewidth', 1);
title(['Plot of Linear Interpolation, a = ' num2str(a)]);
xlabel('t');
ylabel('gL(t)');
xlim([0 4-Ts]);

gI = DtoA(2, Ts, 4, g);
subplot(3,1,3);
plot(linspace(0,4,length(gI)), gI, '-r', 'Linewidth', 1);
title(['Plot of Ideal Interpolation, a = ' num2str(a)]);
xlabel('t');
ylabel('gI(t)');
xlim([0 4-Ts]);

for i = 1:2
saveas(figure(i), ['Part5-' num2str(i) '.png']);
end

