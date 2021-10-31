clear all; close all;clc;
%%a
a = (0:100:1000)
a = linspace(0,1000,11)
%%b
b = 1000*ones(1,10)
b2= 1000*repelem(1,10)
b3= repelem(1000,10)
%%c
c = linspace(0,1000,21)
%%d
d = 0*ones(1,10)
d2= repelem(0,10)
%%e hier fehlt c
e = [a b c d];
%%
f = repelem(e,5);
plot (f)