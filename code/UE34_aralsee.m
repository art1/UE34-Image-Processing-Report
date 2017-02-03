clear all; close all; clc;


he = imread('../images/aralsee250mperpixel.jpg');
resolution = 250; % one pixel is 250x250m



cform = makecform('srgb2lab');
lab_he = applycform(he,cform);

ab = double(lab_he(:,:,2:3));
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);

nColors = 3;
% repeat the clustering 3 times to avoid local minima
[cluster_idx, cluster_center] = kmeans(ab,nColors,'distance','sqEuclidean', 'Replicates',3);

pixel_labels = reshape(cluster_idx,nrows,ncols);
%figure, imshow(pixel_labels,[]), title('image labeled by cluster index');

segmented_images = cell(1,3);
rgb_label = repmat(pixel_labels,[1 1 3]);

for k = 1:nColors
    color = he;
    color(rgb_label ~= k) = 0;
    segmented_images{k} = color;
end

water = segmented_images{2};
seg2 = segmented_images{3};


water_bw = im2bw(water,0.011);
[r col] = size(water_bw);
water_bw_reshaped =reshape(water_bw,1,r*col);

cnt = 0;
for i=1:length(water_bw_reshaped)
   if water_bw_reshaped(i) > 0.4
       cnt = cnt +1;
   end
end

area = cnt * (resolution*resolution)



figure, 
subplot(1,2,1), imshow(uint8(he)), title('Aral sea - original');
%subplot(2,2,2), imshow(segmented_images{1}), title('objects in cluster 1');
subplot(1,2,2), imshow(water_bw), title('detected water');
%subplot(2,2,4), imshow(segmented_images{3}), title('objects in cluster 3');

set(gcf, 'PaperUnits', 'points');
set(gcf, 'PaperPosition', [0 0 900 500]);
saveas(gcf,'../images/aral_bw.png');

