function Question3

syms T(t)

%% Find exact solution

eqn = diff(T, t, 1) == -0.19 * (T - 70);

exact = dsolve(eqn, T(0) == 300);

%plot
subplot (2,2,1);
fplot(exact, [0 20], 'Linewidth', 2);
title('The Exact Solution');
xlabel('t');
ylabel('T(t)');
ylim([50 300]);

%% Runge Kutta Method

a = 0;
b = 20;
h = [0.1 0.01 0.001]; %step size array

style = ["-r" "-g" "-k"]; %style array so that the graphs show difference

k = zeros(1,4);

F = @(t, T) -0.19 * (T - 70);

for j = 1:3 %the step size selection
    N = (b - a)/h(j);
    y = zeros(1,N);
    x = zeros(1,N);
    y(1) = 300; %T
    x(1) = 0; %t
    for i = 1: N-1 %Runge Kutta Method
        
        k(1) = h(j) * F(x(i), y(i));
        k(2) = h(j) * F(x(i) + h(j) / 2, y(i) +  k(1) / 2);
        k(3) = h(j) * F(x(i) + h(j) / 2, y(i) +  k(2) / 2);
        k(4)= h(j) * F(x(i) + h(j), y(i) + k(3));
        y(i + 1) = y(i) + (k(1) + 2 * k(2) + 2 * k(3) + k(4) )/6;
        x(i + 1) = x(1) + i * h(j);
        
    end
    
    subplot(2,2,j+1);
    plot(x, y, style(j), 'Linewidth', 2);
    title(['Runge Kutta method with h = ' num2str(h(j))])
    xlabel('t');
    ylabel('T(t)');
    
end

saveas(figure(1),'Q3.png');

end
