a=1/2; 
Ts=1/60; 
t=[0:Ts:2-Ts]; 
x=0.2*cos(2*pi*20*t)+0.8*cos(2*pi*4*t+0.5); 
[XaZ, XaL, XaI] = SampleByA(x, Ts, a); 


for i = 1:3
    saveas(figure(i), ['Onlab - ' num2str(i) ' a = ' num2str(a) '.png']);
end