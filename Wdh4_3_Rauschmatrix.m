close all; clear all; clc;
%% a
M=4;
N=10000;
%[mR]=MatGen(M,N)
mR=rand(M,N)

%% b
figure
histogram(mR,50)
%% c - Summe der jeweiligen Spalten der matrix
y=sum(mR)
figure
%% d
for M=2:10
    histogram(y,M)
    M=M+2
end
%% e
figure
for M=2:100
    histogram(y,M)
    M=M+2;
end