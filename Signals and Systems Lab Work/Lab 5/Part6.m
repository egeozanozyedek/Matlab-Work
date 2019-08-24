clear all;
close all;

D = rem(21703374,4);
Ts=0.003*(D+2);
T=-2:Ts/1000:2-Ts/1000;
t=-2:Ts:2;
X=0.7*cos(3*pi*T+2*pi/5)+0.4*sin(2*pi*T+1/3)+0.5*cos(5*pi*T+0.8*exp(1));
Xn=0.7*cos(3*pi*t+2*pi/5)+0.4*sin(2*pi*t+1/3)+0.5*cos(5*pi*t+0.8*exp(1));
plot(T,X,'-b','Linewidth', 2, 'DisplayName', 'x(t)');
hold on;
newp = stem(t,Xn);
set(newp, 'Color', 'k', 'DisplayName', 'x[n]');
title(['Signal X, Ts =' num2str(Ts)]);
xlabel('t');
ylabel('X');
legend;

aT = [(0.003 * (D + 2)) (0.3 + 0.02 * D) 0.099];
aTitle = ["Zero - Hold" 'Linear' 'Ideal'];


for i = 1:3
    figure;
    for j = 1:3
        
        in = DtoA((j - 1), aT(i), 4, Xn);
        subplot(3,1,j);
        plot(linspace(-2,2,length(in)), in)
        title([aTitle(j) ' Interpolation with Ts = ' num2str(aT(i))]);
        xlabel('t');
        ylabel('Recovered Signal');
        
    end
     
    
end

for i = 1:4
saveas(figure(i), ['Part6-' num2str(i) '.png']);
end


