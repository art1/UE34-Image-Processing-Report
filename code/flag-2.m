clear all, clc, clear all;

Nlines = 513;
Ncols = 800;

Flag = zeros(Nlines,Ncols,3);

% red channel
Flag(Nlines/3:Nlines,:,1) = 1;
% Green channel
Flag(2*(Nlines/3):Nlines,:,2) = 1;
% Blue Channel (is already set to zero)

imshow(Flag)
