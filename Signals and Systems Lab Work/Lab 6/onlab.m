wc = pi/3;

alpha = (1 - sin(wc))/ cos(wc);

a = alpha;
b = (1 - alpha) / 2;

n=[0:10];

x = 1;

h = DTLTI(a, [b b] , x, length(n));
stem(n, h, 'fill' ,'Color', 'k');

figure(2);

n = [0:4095];

x = cos( fix(n /32) * pi ./127 .* n);

h = DTLTI(a, [b b] , x, length(n));
stem(n, h, 'Color', 'r');
xlim([0 4200]);
% 
% saveas(figure(1), 'Onlab1.png');
% saveas(figure(2), 'Onlab2.png');