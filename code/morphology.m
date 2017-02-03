clear all; close all;
se = strel('line',20,100);
Gre = imread('bloodBW.png');

%%%Erode image %%%%%
Greeroded=imerode(Gre,se);

figure
imshow(Greeroded);

%%%Dilate Image %%%%
Gredilated=imdilate(Gre,se);
figure
imshow(Gredilated);


%%%%%%Erode second example %%%%
Gre = imread('images1.jpg');

Greeroded=imerode(Gre,se);
figure
imshow(Greeroded);

%%%%%%%%%Dilate it %%%%%%%%%%%
Gredilated=imdilate(Gre,se);
figure
imshow(Gredilated);

%%%%%%%%%%%%%Erode and dilate %%%

Gredilatederoded=imdilate(Greeroded,se);
figure
imshow(Gredilatederoded);

%%%%%%%%%%%%%Dilate and erode%%%

Greerodeddilated=imerode(Gredilated,se);
figure
imshow(Greerodeddilated);


%%Distances from the sea for several points

Eu = imread('EuropeBW.bmp');
A=size(Eu);
map=zeros(A(1),A(2),101);
map(:,:,1)=Eu;
se = strel('disk',2);
 
for i=1:256
map(:,:,i+1) = imdilate(map(:,:,i),se);
for j=1:A(1)
    for k=1:A(2)
        if map(j,k,i+1)-map(j,k,i)==1
            mapnew(j,k)=i*256/150;
        end
    end
end
end
figure
imshow(Eu)
figure
imagesc(mapnew)%, colormap gray; 
colorbar

