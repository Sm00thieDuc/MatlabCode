clear all; close all; clc;

%% a
t=0:10e-6:0.05;
%% b
x=sin(2*pi*400*t);
y=sin(2*pi*500*t);
%% c
z=x.*y;
%% d
plot(t,x,t,y,t,z)
legend('x','y','z')
%% e
xlim([0 0.01])
%% f
A=0.4
n0= rand(1,length(t));
n1= 2*A*(n0-0.5);
n = n1*ones;

%% g
figure
plot(t,n)

%% h
zn=z+n;
plot(t,zn)

% 
% N=length(xt);
% zt1=rand(1,N);
% ztn=2*(zt1-0.5);
% As=A/2;
% zt=As*ztn*ones; %Störsignal z(t)
% figure
% plot(zt)