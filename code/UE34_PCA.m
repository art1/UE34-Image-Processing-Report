clear all; close all; clc;

Im = double(imread('SpainBeach.png'));
X = reshape(Im,size(Im,1)*size(Im,2),3);

c = pca(X);
Im_new = X*c;

Ipc1 = reshape(Im_new(:,1),size(Im,1),size(Im,2));
Ipc2 = reshape(Im_new(:,2),size(Im,1),size(Im,2));
Ipc3 = reshape(Im_new(:,3),size(Im,1),size(Im,2));
figure, imshow(Ipc1,[]);
figure, imshow(Ipc2,[]);
figure, imshow(Ipc3,[]);