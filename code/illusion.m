clear all, clc, close all;

% Parameters

Nlines = 512;
Ncols = 2014;

I = zeros(Nlines,Ncols);

increment = 1/Ncols;
sc = 0;

b1 = Nlines/2 - 20;
b2 = Nlines/2 + 20;

% for l = 1 : Nlines
%     sc = 0;
%     for c = 1 : Ncols
%         if l < b1
%             sc = sc + increment;
%             I(l,c) = sc;
%         elseif (l >= b1 & l <= b2)
%             I(l,c) = 0.5;
%         elseif l > b2
%             sc = sc + increment;
%             I(l,c) = sc;
%         end
%             
%     end
% end

% more efficient way:
for c = 1 : Ncols
    I(:,c) = c / Ncols;
end

I(b1:b2,:) = .5;

figure, imshow(I);