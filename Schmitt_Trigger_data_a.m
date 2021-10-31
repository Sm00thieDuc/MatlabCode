clear all; close all; clc
%% c 
A=5;
f=20;
Us=1;
Ua=5;

%% d
%simOut = sim('Schmitt_Trigger_mod_a', 'StartTime','0')

%% f
N=300;
P=3;
tstop=P/f;
dt=1/(N*f);
simOut = sim('Schmitt_Trigger_mod_e', 'StartTime','0','StopTime',num2str(tstop), ...
    'SolverType','Fixed-Step','FixedStep',num2str(dt))

%% g
t=simOut.get('tout');
Uet=simOut.get('Uet');
Uat=simOut.get('Uat');



plot(t,Uet,t,Uat)
grid 
xlabel('{\itt}/s')
ylabel('{\itU}/V')
legend('Eingangssignal','Ausgangssignal')
%ylim(5.1,5.1)
title('Zeitverlauf der Schmitt Trigger Ein-und Ausgänge')

%% h
plot(Uet,Uat)

%% i
Us1=0;

%% j




