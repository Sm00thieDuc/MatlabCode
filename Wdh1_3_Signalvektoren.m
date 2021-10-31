clear all; close all; clc;
%a
a=(0:100:1000)
%b
b=1000*ones(1,10)
b=repelem(1000,10)
%c
c=linspace(1000,0,21)
%d
d=zeros(10,1)
d=repelem(0,10)'
%e
e=[a b c d']
%f
f=[e e e e e] %repelem(e,5)
plot(f)
