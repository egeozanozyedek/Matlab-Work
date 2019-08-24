function onlab

h = [0 1 10; -1 0 1; -10 -1 0];

img = ReadMyImage('Part1.bmp');

y1 = DSLSI2D(h,img);

title('y1');
imshow(y1, []);

end