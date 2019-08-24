function onlab

clear all;

load on_lab_assignment_3.mat;

omega=linspace(-8192*pi,8192*pi,8192*2.5+1);
omega=omega(1:end-1);

sp = 1/8192;

t = [0:sp:2.5];

X = FT(on_lab_assignment_3);

plot(omega/2/pi,abs(X))
xlabel('f');
ylabel('|X(omega)|');
title('X vs f');
end