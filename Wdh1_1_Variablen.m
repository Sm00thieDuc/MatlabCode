clear all; close all; clc;
%%1 a
mMatrix= [7 2*10E-3 j; -2.6 2-4j -1; 45 9 -j];
%b
z=2*pi;
%c
mBig=[mMatrix mMatrix; mMatrix mMatrix ];
%d
zvBig = (1:4:200);
%e
svVektor=[3 4.5 9+2j -4]';
%f
zvVektor=[7 2.4 8j];
%g
mMatrix=[mMatrix; zvVektor];
mMatrix=[mMatrix svVektor];
mMatrix=[mMatrix; 3 7.5 -4 2+3j];
%h
mMatrix(:,3)=[];
mMatrix(4,:)=[];
%i
mMatrix(2,2)=pi;
%j
x=[-3:0.5:15];
%k
idx=(2:4:length(x))
y=x(idx)
%y=(x(2):)