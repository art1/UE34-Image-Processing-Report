clear all, clc, close all;


N = 1024;
R = 500;

Ihsv = ones(N,N,3);

for u = 1 : N
    for v = 1 : N
        
        r = sqrt( (v-N/2)*(v-N/2) + (N-u-N/2)*(N-u-N/2) );
        alpha = atan2( (N-u-N/2) , (v-N/2)) + pi;
        
        % Hue
        Ihsv(u,v,1) = alpha / (2*pi);
        
        % Saturation
        if r < R
            Ihsv(u,v,2) = 0;
        else
            Ihsv(u,v,2) = 1 - (r / R);
        end
        %Ihsv();
    end
end

Irgb = hsv2rgb(Ihsv);
imshow(Irgb)

% r = linspace(0,1,100);
% theta = linspace(0, 2*pi, 100);
% lengthR = length(r);
% lengthTh = length(theta);
% 
% colormat = zeros(lengthR,lengthTh,3);
% %map = zeros(lengthR,lengthTh,3);
% 
% for l = 1 : lengthR
%    for c = 1 : lengthTh
%        colormat(l,c,1) = l / lengthR;
%        colormat(l,c,2) = c / lengthTh;
%    end
% end
% colormat(:,:,3) = 1;
% 
% [x y] = pol2cart(r,theta)
% map = zeros(length(x),length(y),3);
% %map = colormat;
% 
% imshow(map)

% 
% r = linspace(0,1,20);
% theta = linspace(-pi-pi/2, pi/2, 300);
% [rg, thg] = meshgrid(r,theta);
% 
% [x,y] = pol2cart(thg,rg);
% 
% pcolor(x,y,thg);
% %A = zeros(300,300);
% %A(:,:)= thg;
% 
% colormap(hsv);
% shading flat;
% axis off;
% axis equal;
% 
