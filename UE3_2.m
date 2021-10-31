clear all; close all; clc;
%% a - RE,CE und ne definieren
RE=1E6; %Ohm
CE=20E-12; %F
n=10;

%% b - C und R vom Tastkopf im abgeglichenen Zustand berechnen
RV=RE*(n-1);
CV0=CE/(n-1); % in Farad
CV1=1.1E-12; %F
CV2=3.3E-12; %F

%% c
w=linspace(0,1E6,1000)

%% d
vw0 = RE./(RE+RV*(1+1j*w*RE*CE./1+1j*w*RE*CV0))
vw1 = RE./(RE+RV*(1+1j*w*RE*CE./1+1j*w*RE*CV1))
vw2 = RE./(RE+RV*(1+1j*w*RE*CE./1+1j*w*RE*CV2))

%% e
plot(w,abs(vw0),w,abs(vw1),w,abs(vw2))