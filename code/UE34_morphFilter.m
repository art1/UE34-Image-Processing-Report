close all; clear all;clc;

Im = imread('../images/images1.jpg');
se = strel('disk',40);
Im_open = imopen(Im,se);
Im_close = imclose(Im,se);

se = strel('disk',10);
Im2 = imread('../images/images2.jpg');
Im2_top = imtophat(Im2,se);
Im2_bot = imbothat(Im2,se);

figure
subplot(2,3,1), imshow(Im)
subplot(2,3,2), imshow(Im_open)
subplot(2,3,3), imshow(Im_close)
subplot(2,3,4), imshow(Im2)
subplot(2,3,5), imshow(Im2_top)
subplot(2,3,6), imshow(Im2_bot)

set(gcf, 'PaperUnits', 'points');
set(gcf, 'PaperPosition', [0 0 900 600]);
saveas(gcf,'../images/morphFilter.png');