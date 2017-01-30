clear all; close all;clc;

Im = imread('SpainBeach.png');

[row, column, d] = size(Im);


Input = [
    254 255 255;
    253 251 252;
    241 255 247;
    231 255 255;
    255 252 251;
    94 104 95; % class 2 from here
    139 136 129;
    12 48 64;
    10 49 66;
    169 121 99; % red shit
    196 136 108;
    251 148 113;
    141 92 77;
];
Targets = [1 1 1;1 1 1;1 1 1;1 1 1;1 1 1;0 0 0;0 0 0;0 0 0;0 0 0;0 0 0;0 0 0;0 0 0;0 0 0];

size(Input)
size(Targets)
size(Input(1,:))


net = feedforwardnet([10 3]) ;
net = train(net,Input,Targets) ;

x = net(Input);

plot(Input,x);





