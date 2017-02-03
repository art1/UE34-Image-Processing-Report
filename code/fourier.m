clear all; close all;

Nlines=500;
Ncolumns=500;
greymatrix=zeros(Nlines,Ncolumns,1);

for k = 245:255
        greymatrix(k,:,1)=1.0;
end

figure
imshow(greymatrix)

FFT=fftshift(fft2(greymatrix));
figure
shading flat
mesh((abs(FFT)));
colorbar

%%%%%%%%%%%%%%%Square %%%%%%%%%%%%%%%%%%%%%%

Nlines=500;
Ncolumns=500;
greymatrix=zeros(Nlines,Ncolumns,1);

for k = 245:255
    for i = 245:255
        greymatrix(k,i,1)=1.0;
    end
end

figure
imshow(greymatrix)

FFT=fftshift(fft2(greymatrix));
figure
shading flat
mesh((abs(FFT)));
colorbar

%%%%%%%%%%% Rectangle %%%%%%%%%%%%%%%%%

Nlines=500;
Ncolumns=500;
greymatrix=zeros(Nlines,Ncolumns,1);

for k = 240:260
    for i = 245:255
        greymatrix(k,i,1)=1.0;
    end
end

figure
imshow(greymatrix)

FFT=fftshift(fft2(greymatrix));
figure
shading flat
mesh((abs(FFT)));
colorbar

%%%%%%%%%% Circle %%%%%%%

Nlines=500;
Ncolumns=500;
greymatrix=zeros(Nlines,Ncolumns,1);

totalradius=10;

for k = 1:Nlines
    for i = 1:Ncolumns
        R=sqrt(((k-(Nlines/2))^2)+((i-(Ncolumns/2))^2));
        if (R<totalradius)
            greymatrix(k,i,1)=1.0;
        end
    end
end

figure
imshow(greymatrix)

FFT=fftshift(fft2(greymatrix));
figure
shading flat
mesh((abs(FFT)));
colorbar