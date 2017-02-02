clear all, close all, clc ;

%%%%%%%%%%%%%%
% (c) Emmaneul Zenou



%% Data

R = 1 ;
K = 1 ;
NbData = 200 ;

Im = imread('SpainBeach.png');

AllData = K * randn(NbData,2) ;

% save AllData ;
%load AllData ;

PosData = [] ;
NegData = [] ;
Target = [] ;
for i = 1 : NbData
    if norm(AllData(i,:),2) > R
        PosData = [PosData ; AllData(i,:)] ;
        Target = [Target ; 1] ;
    else
        NegData = [NegData ; AllData(i,:)] ;
        Target = [Target ; 0] ;
    end
end

figure, plot(PosData(:,1),PosData(:,2),'+b',NegData(:,1),NegData(:,2),'.r') ;
axis equal ;
axis([-4 4 -4 4]) ;
saveas(gcf,'AllData.png','png') ;

%% Apprentissage

net = feedforwardnet([10 3]) ;
net = train(net,AllData',Target') ;

%% Simulations

Res = [] ;
ResPos = [] ;
ResNeg = [] ;
for x = -4 : .2 : 4
    for y = -4 : .2 : 4
        zesim =  net([x y]') ;
        Res = [Res ; x y zesim] ;
        if zesim > .5
            ResPos = [ResPos ; x y] ;
        else
            ResNeg = [ResNeg ; x y] ;
        end
    end
end


figure, plot(ResPos(:,1),ResPos(:,2),'.c',ResNeg(:,1),ResNeg(:,2),'.m') ;
axis equal ;
% saveas(gcf,'SimData.png','png') ;

% Superposition

figure, plot(ResPos(:,1),ResPos(:,2),'.c',ResNeg(:,1),ResNeg(:,2),'.m',...
             PosData(:,1),PosData(:,2),'+b',NegData(:,1),NegData(:,2),'.r') ;
axis equal ;
% saveas(gcf,'SimAllData.png','png') ;