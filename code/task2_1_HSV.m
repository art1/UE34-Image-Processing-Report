clear all, clc, clear all;

Nlines = 513;
Ncols = 800;

I = zeros(Nlines,Ncols,3);

for l = 1 : Nlines
    for c = 1 : Ncols
       I(l,c,1) = c/Ncols;
       I(l,c,2) = l/Nlines;
    end
end
I(:,:,3) = 1;


H = hsv2rgb(I);
%colormap('hsv')
imshow(H)