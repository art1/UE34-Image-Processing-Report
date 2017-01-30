clear all, close all, clc ;

I = imread('SpainBeach.png') ;
figure, imshow(I) ;

[U,V,d] = size(I) ;
I = double(I) ;

DataBase = [ 161 119 97 1 ;
             171 117 89 1 ;
             164 116 96 1 ;
             255 193 149 1 ;
             210 140 104 1 ;
             255 168 128 1 ;
             255 175 135 1 ;
             141 104 88 1 ;
             110 86 76 1 ;
             91 82 67 1 ;
             79 87 89 2 ;
             99 109 98 2 ;
             98 100 95 2 ;
             67 76 83 2 ;
             116 134 112 2 ;
             94 100 100 2 ;
             90 82 89 2 ;
             108 123 116 2 ;
             92 94 84 2 ;
             107 107 99 2 ;
             19 48 66 3 ;
             26 41 62 3 ;
             28 92 101 3 ;
             17 61 72 3 ;
             27 95 99 3 ;
             244 246 243 3 ;
             251 255 255 3 ;
             20 70 77 3 ;
             65 94 98 3 ; 
             17 69 82 3 ; 
             141 156 153 3 ;
             71 118 124 3 ] ;

NbData = size(DataBase, 1) ;
        
Pixels = DataBase(:,1:3) ;

Classes = DataBase(:,4) ;

MaskClasses = zeros(U,V) ;

for u = 1 : U
    for v = 1 : V
        
           r = I(u,v,1) ;
           g = I(u,v,2) ;
           b = I(u,v,3) ;
           
           TabRGB = repmat([r g b],NbData,1) ;
           D2 = (TabRGB - Pixels).^2 ;
           [valmin,posmin] = min( sum(D2') ) ;
           MaskClasses(u,v) = Classes(posmin) ;
           
       
    end
end

figure, 
subplot(2,2,1), imshow(uint8(I)) ; 
subplot(2,2,2), imshow(MaskClasses==1) ;
subplot(2,2,3), imshow(MaskClasses==2) ;
subplot(2,2,4), imshow(MaskClasses==3) ;      
             
figure, imshow(MaskClasses==3) ;        
             
             
             
             
             

