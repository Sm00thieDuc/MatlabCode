close all; clear all; clc;

T0=1e-3;
dt=T0/100;

%% a Einzelne Zeitabschnitte in Zeitvektor tn definieren und in xn berechnen
% Abschnitt 1
t1 = 0:dt:(0.25*T0);
x1t = 1-8/T0*abs(t1-0.125*T0)
figure
p1 = plot(t1,x1t) 
hold off

% Abschnitt 2
t2 = (0.25*T0):dt:(0.75*T0);
x2t = zeros(length(t2))
hold on     %damit beide Graphen auf eine figure kommen
p2 = plot(t2,x2t) 
hold off

% Abschnitt 3
t3 = (0.75*T0):dt:(T0);
x3t = -1+8/T0*abs(t3-0.875*T0)
hold on     %damit beide Graphen auf eine figure kommen
p3 = plot(t3,x3t) 
hold off


%% a2
tneu=[t1 t2 t3]
xt=[x1t x2t x3t]
figure
%plot(tneu,xt)