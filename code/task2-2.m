clear all, clc, close all;

A = imread('cage.png');
% imshow(A)

figure
subplot(2,2,1)

% switch the channels because i can!
B = A;
B(:,:,1) = A(:,:,3);
B(:,:,2) = A(:,:,2);
B(:,:,3) = A(:,:,1);

% B = (0.2989*A(:,:,1) + 0.5870*A(:,:,2) + 0.1140*A(:,:,3));
imshow(A(:,:,1))
subplot(2,2,2)
imshow(A(:,:,2))
subplot(2,2,3)
imshow(A(:,:,3))
subplot(2,2,4)
imshow(B)