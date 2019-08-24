function impulseResponse

h1 = [1 0 -1; 1 0 -1; 1 0 -1];

img = ReadMyImage('Part5.bmp');

y1 = DSLSI2D(h1,img);

subplot(2,2,1);
title('y1');
imshow(y1, []);


s1 = DSLSI2D(h1,img).^2;

subplot(2,2,2);
title('s1');
imshow(s1, []);


h2 = [1 1 1; 0 0 0; -1 -1 -1]

y2 = DSLSI2D(h2,img);

subplot(2,2,3);
title('y2');
imshow(y2, []);


s2 = DSLSI2D(h2,img).^2;

subplot(2,2,4);
title('s2');
imshow(s2, []);

end