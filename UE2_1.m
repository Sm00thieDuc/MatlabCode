
%%BELIEBTE KLAUSURAUFGABE, jedoch mit anderen Intervallgrenzen (z.B. +dt
%%statt -dt usw.)

clear all; close all;clc;

%xlabel('{\itI}/A')
%ylabel('{\itU}/V')

%% a Amplitude, Frequenz, Periodendauer
A = 3
f0 = 1E3
T0 = 1/f0

%% b Stützwerte, Zeitabstand dt
N0 = 90
dt = T0/N0

%% c Einzelne Zeitabschnitte in Zeitvektor tn definieren und in 
%% Abschnitt 1
t1 = 0:dt:(T0/6-dt);
x1t = 6*A/T0 * t1
hold on     %damit beide Graphen auf eine figure kommen
p1 = plot(t1,x1t,'g') %Alternativ:set(p1, 'color', 'green')%Farbe auf grün
stem(t1,x1t)
hold off
%% Abschnitt 2
t2 = (T0/6):dt:(T0/3-dt);
x2t = A*ones(size(t2))
hold on   
p2 = plot(t2,x2t,'g')
stem(t2,x2t)
hold off
%% Abschnitt 3
t3 = (T0/3):dt:(T0/2-dt);
x3t = 3*A*(1-2/T0*t3)
hold on     %damit beide Graphen auf eine figure kommen
plot(t3,x3t,'g')
stem(t3,x3t)
hold off
%% Abschnitt 4
t4 = (T0/2):dt:T0;
x4t = 0*ones(size(t4))
hold on
plot(t4,x4t,'g')
stem(t4,x4t)
hold off
%% Gesamt Figure
tP = 0:dt:T0;
xPt = [x1t x2t x3t x4t]
hold on
plot(tP,xPt,'g')
stem(tP,xPt)
xlabel('{\itt}/s')
ylabel('{\itx(t)}/A')
hold off

%% d Übung bis hierher geschafft
P = 3
xt = repmat....