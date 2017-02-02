clear all; close all; clc;

Im = imread('SpainBeach.png');
figure, imshow(Im)

[U,V,d] = size(Im) ;
Im = double(Im) ;

Training = [
    254 255 255 1;
    253 251 252 1;
    241 255 247 1;
    231 255 255 1;
%     104 109 102 2; % vegetation
%     109 128 108 2;
%     111 130 111 2;
%     108 122 109 2;
    16 44 65 2; % water
    12 47 66 2;
    12 54 68 2;
    5 51 64 2;
    169 121 99 3; % red shit
    196 136 108 3;
    251 148 113 3;
    141 92 77 3;];


NbData = size(Training, 1);
        
Pixels = Training(:,1:3) ;

Classes = Training(:,4) ;

MaskClasses = zeros(U,V) ;

for u = 1 : U
    for v = 1 : V
        r = Im(u,v,1);
        g = Im(u,v,2);
        b = Im(u,v,3);
        TabRGB = repmat([r g b],NbData,1) ;
        D2 = (TabRGB - Pixels).^2 ;
        [valmin,posmin] = min( sum(D2') ) ;
        MaskClasses(u,v) = Classes(posmin) ;
    end
end

figure, 
subplot(2,2,1), imshow(uint8(Im)) ; 
subplot(2,2,2), imshow(MaskClasses==1) ;
subplot(2,2,3), imshow(MaskClasses==2) ;
subplot(2,2,4), imshow(MaskClasses==3) ;      
             
%figure, imshow(MaskClasses==3) ;    
