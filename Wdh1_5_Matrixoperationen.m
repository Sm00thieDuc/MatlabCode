clear all; close all; clc;
%% a Matrixprodukt quadr. 
mA=[-3 3.5 10; 8 -3.4 -11; 2 1 1]
mB = [3 -2 -7; -1.5 -2.4 9; 1 0 2]
mC=mA*mB
%% b
mD=mA.*eye(3,3) %oder eye(3)
%% c
mADiv=[2 2;1 0]
vBDiv=[2;1]

c=mADiv\vBDiv
c2=inv(mADiv)*vBDiv

%% d rechte Division in c führt zum Fehler weil...
% mF1=vBDiv/mADiv
% führt zu Fehler, da vBDiv Spaltenvektor ist, die Inverse von mADiv
% jedoch eine 2x2-Matrix
% Die Multiplikation 2x[1 * 2]x2 führt zu einer Ungleichheit
% der inneren Matrix-Dimensionen

%% e LGS lösen: via \
%Faktoren
K=[ 2 3 -5; 
    -9 7 4; 
    3 -6 4]
%Lösungsvektor
y=[-30;-19;44]
% Lösung via linker Division
x=K\y
% Kontrolle: y= K*x ?
ykont=K*x

