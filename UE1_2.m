clear all; close all;clc;
%%a Skalarprodukt von x und y
x =[1 2 0.5 -3 -1];
y =[2 0 -3 1/3 2]; 
sp1 = x * y' %Zeile mal Spalte  
sp2 = sum(x.*y) % punktweise Multiplikation mit .*
sp3 = dot(x,y)   
%% b
zva = [3 1 2 0.5 -3 -1 3 5 -2 0.3 -4 3];
zvb = zva.*(zva>=-2&&zva<=2)



 