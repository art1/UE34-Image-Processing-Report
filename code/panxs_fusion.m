clear all, clc, close all;

Gre = imread('Ipan_hr.png');
Pan = imread('Ihyp_lr.png');

YCBCR = rgb2ycbcr(Pan);

YCBCR_res = imresize(YCBCR,[size(Gre,1) size(Gre,2)]);

YCBCR_res(:,:,1) = Gre(:,:);

result = ycbcr2rgb(YCBCR_res);
figure, imshow(result)