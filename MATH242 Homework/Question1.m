function Question1

syms x(t) k m a b omega %define symbolic variables

%% Part 1

eqn = diff(x, t, 2) == - k/m * x; %define the diff eqn
gsolution = dsolve(eqn); %solve the eqn
fprintf('\nThe General Solution: '); %display
disp(gsolution);

%% Part 2

Dx = diff(x); %define the first derivative of x for init cond

m = 2;
k = 4;

eqn = diff(x, t, 2) == - k/m * x;

conds = [x(0) == 0, Dx(0) == 5]; %the initial conditions

psol1 = simplify(dsolve(eqn, conds)); %solve the eqn with conds

%substitute k and m
%simplify to an understandable eqn
Dpsol1 = diff(psol1);

fprintf('\nThe Particular Solution (k = 2, m = 4): '); %display
disp(psol1);

%% Part 3

figure(1);


%plot the particular soln over 0 to 20
%i used fplot since you have more control over it unlike ezplot
%the plot function does not let the plotting of symbolic variables so thats
%not viable as well, fplot is the best choice
subplot(2,1,1);
fplot(psol1, [0 30]); 
title('Plot of the position of the mass'); 
xlabel('t');
ylabel('x(t)');
grid on;

subplot(2,1,2);
fplot(Dpsol1, [0 30]); 
title('Plot of the velocity of the mass'); 
xlabel('t');
ylabel('Dx(t)')
grid on;

%% Part 4

%define frequency

w = (k/m) ^(1/2);

b = 0.25;

%now define the new diff eqn
eqn = diff(x, t, 2) + b * diff(x, t, 1) + w^2 * x == 0; 

Dx = diff(x); %define the first derivative of x for init cond

conds = [x(0) == 0, Dx(0) == 5]; %the initial conditions

psol2 = simplify(dsolve(eqn, conds)); %solve the eqn with conds

Dpsol2 = diff(psol2);

%display
fprintf('\nThe Particular Solution (w/ linear perturbation term) (k = 2, m = 4, beta = 2)\n\n'); 
disp(psol2);

%plot 
figure(2);

subplot(2,1,1);
fplot(psol2, [0 30]); 
title('Plot of the position of the mass w/ perturbation'); 
xlabel('t');
ylabel('x(t)');
grid on;

subplot(2,1,2);
fplot(Dpsol2, [0 30]); 
title('Plot of the velocity of the mass w/ perturbation'); 
xlabel('t');
ylabel('Dx(t)')
grid on;

%% Part 5

a = 2;

omega = pi / 2;

%now define the new diff eqn
eqn = diff(x, t, 2) + b * diff(x, t, 1) + w^2 * x == a * cos(omega * t); 

Dx = diff(x); %define the first derivative of x for init cond

conds = [x(0) == 0, Dx(0) == 5]; %the initial conditions

psol3 = simplify(dsolve(eqn, conds)); %solve the eqn with cond


Dpsol3 = diff(psol3);

%display
fprintf('\nThe Particular Solution (w/ vibration term) (k = 2, m = 4, beta = 2 alpha = 1 omega = pi/2)\n\n'); 
disp(psol3);

%plot 
figure(3);

subplot(2,1,1);
fplot(psol3, [0 50]); 
title('Plot of the position of the mass w/ vibration term'); 
xlabel('t');
ylabel('x(t)');
grid on;

subplot(2,1,2);
fplot(Dpsol3, [0 50]); 
title('Plot of the velocity of the mass w/ vibration term'); 
xlabel('t');
ylabel('Dx(t)')
grid on;

%%for saving figures

% for i = 1:3
% saveas(figure(i),['Q1-' num2str(i) '.png'])
% end

end