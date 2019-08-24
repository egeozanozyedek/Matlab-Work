function Question2

syms V(t) RC f

%% Part 1
A = 8;

eqn = diff(V, t, 1) * RC + V == A * cos(2 * pi * f * t); %define equation

gsol = dsolve(eqn); %find general soln

fprintf('\nGeneral Solution: ');
%disp(gsol);


%% Part 2

psol = dsolve(eqn, V(0) == 0); %particular solution with init cond

psol = simplify(subs(psol, RC, 5 * 10^-3)); %substitute in the value of RC

RC = 5 * 10^-3;

% f = 10Hz plot
figure(1);
psol1 = subs(psol, f, 10); 
subplot(2,1,1);
fplot(psol1, [0 3/10]);
ylim([-8 8]);
title('Voltage over the capacitor V(t), f = 10Hz'); 
xlabel('t');
ylabel('V(t)')
grid on;

VT = RC * diff(psol1,t,1) + psol1;
subplot(2,1,2);
fplot(VT, [0 (2 * 1 / 10)]);
title('Input voltage VT(t)'); 
xlabel('t');
ylabel('VT(t)')
grid on;

% f = 100Hz plot
figure(2);
psol1 = subs(psol, f, 100);
subplot(2,1,1);
fplot(psol1, [0 3/100]);
ylim([-8 8]);
title('Voltage over the capacitor V(t), f = 100Hz'); 
xlabel('t');
ylabel('V(t)')
grid on;


VT = RC * diff(psol1,t,1) + psol1;
subplot(2,1,2);
fplot(VT, [0 (2 * 1 / 100)]);
title('Input voltage VT(t)'); 
xlabel('t');
ylabel('VT(t)')
grid on;


% f = 10KHz plot
figure(3);
psol1 = subs(psol, f, 10^4);
subplot(2,1,1);
fplot(psol1, [0 3/10^4]);
ylim([-8 8]);
title('Voltage over the capacitor V(t), f = 10KHz'); 
xlabel('t');
ylabel('V(t)')
grid on;


VT = RC * diff(psol1,t,1) + psol1;
subplot(2,1,2);
fplot(VT, [0 (2 * 1 / 10^4)]);
title('Input voltage VT(t)'); 
xlabel('t');
ylabel('VT(t)')
grid on;



%% Part 3

RC = 5 * 10^-3;

eqn = diff(V, t, 1) * RC + V == 8; %%define the equation with V_dc

psol = dsolve(eqn, V(0) == 0); %%again solve with init cond

figure(4);

fplot(psol, [0 8 * RC]); %plot
title('Graph of V(t) with DC voltage'); 
xlabel('t');
ylabel('V(t)')
grid on;

%% Part 4

h = [RC (8/10 * RC) (5/10 * RC) (1/10 * RC)]; % array of step sizes


figure(5);

%plot the exact solution 
fplot(psol, [0 8 * RC], 'Linewidth', 2, 'DisplayName', 'The Exact Solution'); 
title('Exact solution and Eulers Method'); 
xlabel('t');
ylabel('V(t)')
grid on;

%hold on to plot all step sizes in the same figure
hold on;

%step size
n = 100;

%allocate memory
x = zeros(1, n);
y = zeros(1, n);

%initial conditions
x(1) = 0;
y(1) = 0;

%style array so that different graphs can be displayed differently
style = ["-*r" "-og" "-sk"];

%step size change
for j = 1:3
    %eulers method
    for i = 1:n

        F = (8 - y(i))/RC;
        y(i + 1) = y(i) + h(j) * F;
        x(i + 1) = x(i) + h(j);

    end
%plot
plot(x, y, style(j),'Linewidth',1,'DisplayName',['h = ' num2str(h(j))]);
legend;
xlim([0 0.04]);

end

%stop holding
hold off;

%for saving figures

% for i = 1:5
% saveas(figure(i),['Q2-' num2str(i) '.png'])
% end

end