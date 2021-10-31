clear all; close all;clc;

%% a t mit Schrittweite 25ms bis 0.1s
t = (0 : 25E-3 : 0.1)
%%b s(t)=sin(2pi*50t) in vektor st berechnen und plotten
st = sin(2*pi*50*t)
plot(t,st)
%% c Problem: Zickzack statt Sinuskurve wurde dargestellt
%%Lösung: Schrittweite feiner Auflösen. Nun mit E-6. 
%% d
t1 = (0 : 25E-6 : 0.1);
st1 = sin(2*pi*50*t1);
%% e Plot t und t1 in einer Grafik mit HOLD ON/OFF
hold on
plot(t,st)
plot(t1,st1)
hold off
%% f
ff = exp(-10*t1)
gg = sin(2*pi*5*t1)
st2 = exp(-10*t1)*sin(2*pi*5*t1)
plot(st2)