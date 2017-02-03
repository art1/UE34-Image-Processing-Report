clear all; close all;

Nlines=512;
Ncolumns=1024;
greymatrix=zeros(Nlines,Ncolumns,1);

for k = 1:Nlines
    for i = 1:Ncolumns
        greymatrix(k,i,1)= i/Ncolumns;
    end
end

for k=230:282
    for i = 1:Ncolumns
        greymatrix(k,i,1)= 0.5;
    end
end

figure
imshow(greymatrix)


%%%%%Now flags %%%%%%%%%%%%%%%%%%%

Nlines=300;
Ncolumns=500;
flag=zeros(Nlines,Ncolumns,3);

for k = 1:100
        flag(k,:,:)=0 ;
end
for k = 100:200
        flag(k,:,1)=1 ;
end
for k = 200:300
        flag(k,:,1)=250 ;
        flag(k,:,2)=215 ;
end


figure
imshow(flag);

%%%%%%%%%%%%%%%%% Do HSV %%%%%%%%%%%%%%%%%%%%%%%%
Nlines=512;
Ncolumns=750;

map=zeros(Nlines,Ncolumns,3);

for k = 1:Nlines
    for i = 1:Ncolumns
        map(k,i,1)= i/Ncolumns;
        map(k,i,2)= k/Nlines;
        map(k,i,3) = 1;
    end
end

map=hsv2rgb(map);
figure
imshow(map)

%%%%%%%%%%%%%%%%%%%%%Colour wheel %%%%%%%%%%%%%%%%%%%%%%%%%

Nlines=500;
Ncolumns=500;

totalradius=sqrt((((Nlines/2)-100)^2)+(((Ncolumns/2)-100)^2));

hsvmap=zeros(Nlines,Ncolumns,3);

for k= 1:Nlines;
    for i= 1:Ncolumns;

        R=sqrt(((k-(Nlines/2))^2)+((i-(Ncolumns/2))^2));
    
        alpha =atan2(((Nlines/2)-k),(i-(Ncolumns/2)));
      
        if alpha<0
           alpha=2*pi+alpha;
        end

        h=alpha/(2*pi);
        s=R/totalradius;
   
        hsvmap(k,i,1)= h;
        hsvmap(k,i,2)= s;
        hsvmap(k,i,3) = 1;
    
        if(R>totalradius)
        hsvmap(k,i,3) = 0; 
        end
   end
end


map=hsv2rgb(hsvmap);
figure
imshow(map)


%%%%%%%%%%%%%%%%% High res - BW / Low Res - Color %%%%%%%

close all; clear all;
Gre = imread('Ipan_hr.png');
Pan = imread('Ihyp_lr.png');

YCBCR = rgb2ycbcr(Pan);

YCBCR_res = imresize(YCBCR,[size(Gre,1) size(Gre,2)]);

YCBCR_res(:,:,1) = Gre(:,:,1);

result = ycbcr2rgb(YCBCR_res);
figure, imshow(result)


