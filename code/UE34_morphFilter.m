close all; clear all;clc;

Im = imread('../images/images1.jpg');
se = strel('disk',40);
Im_open = imopen(Im,se);
Im_close = imclose(Im,se);

se = strel('disk',10);
Im_top = imtophat(Im,se);
Im_bot = imbothat(Im,se);

figure
% subplot(2,3,1), imshow(Im)
% subplot(2,3,2), imshow(Im_open)
% subplot(2,3,3), imshow(Im_close)
subplot(1,3,1), imshow(Im)
subplot(1,3,2), imshow(Im_top)
subplot(1,3,3), imshow(Im_bot)

set(gcf, 'PaperUnits', 'points');
set(gcf, 'PaperPosition', [0 0 900 250]);
saveas(gcf,'../images/morphFilter.png');

% Skeletonization
Im3 = imread('../images/Diplo1.jpg');
Im3_skelet = imread('../images/Diplo1.gif');
Im3_skelet = bwmorph(Im3_skelet,'skel',Inf);

figure,
subplot(1,2,1), imshow(Im3), title('original image')
subplot(1,2,2), imshow(Im3_skelet), title('skeletonized image')

set(gcf, 'PaperUnits', 'points');
set(gcf, 'PaperPosition', [0 0 900 250]);
saveas(gcf,'../images/morphSkelet.png');
