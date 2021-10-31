clear all;close all;clc;

%% a Definitionen
L=100e-3;
C2=2.38e-3;
C1=1.7e-3;
R=30.5;
a0=1;
a1=R*C1;
a2=L*(C1+C2);
a3=R*L*C1*C2;
dt=1e-3;
tstart=0;
tstop=0.5;
uemax=10;

%% b Definition des Systems (Laplace-Transformierte der Übertragungsfunktion)
s=tf('s');
Gs=(a3*s^3+a2*s^2+a1*s+a0)^-1

%% c
t1=tstart:dt:tstop;
ua_chk= uemax * step(Gs,t1);

%% d
plot(t1,ua_chk)
grid
title('Sprungantwort')

%% e

%% f
res=sim('PT3_mod','StartTime','0','StopTime', num2str(tstop))  
t=res.get('tout');
ue=res.get('ue');
ua=res.get('ua');
plot(t,ue,t,ua,'-x',t1,ua_chk)

%% g
simOut=sim('PT3_mod','StartTime','0','StopTime', num2str(tstop),'SolverType','Fixed-Step')
t=simOut.get('tout');
ue=simOut.get('ue');
ua=simOut.get('ua');

%% h
subplot(2,1,1)
plot(t,ue,t,ua,'-x',t1,ua_chk)
title('Simulation mit default Schrittweite')

%% i
simOut=sim('PT3_mod','StartTime','0','StopTime', num2str(tstop),'SolverType','Fixed-Step','FixedStep','dt')
t=simOut.get('tout');
ue=simOut.get('ue');
ua=simOut.get('ua');
subplot(2,1,2)
plot(t,ue,t,ua,'-x',t1,ua_chk)
title('Simulation mit Schrittweite dt')

%% j
s1=0.9;
s2=0.1;
ylow=0;
yhigh=1;


%% l
figure
simOut=sim('rectgen_mod','StartTime','0','StopTime', num2str(tstop),'SolverType','Fixed-Step')
t=simOut.get('tout');
ua=simOut.get('ua');
uar=simOut.get('uar');
subplot(2,1,1)
plot(t,ua,t,uar)
title('Simulation mit default Schrittweite')

hold on
simOut=sim('rectgen_mod','StartTime','0','StopTime', num2str(tstop),'SolverType',...
    'Fixed-Step','FixedStep','dt')
t=simOut.get('tout');
ua=simOut.get('ua');
uar=simOut.get('uar');
subplot(2,1,2)
plot(t,ua,t,ua)
title('Simulation mit Schrittweite dt')

%% m 
%Durch den Schmitt-Trigger werden Eingangssignale auf definierte Pegel
%(ylow und yhigh) gepegelt. Dadurch entsteht ein Rechtecksignal mit
%ymax=yhigh und ymin=ylow)

% 
% figure
% simOut=sim('rectgen_mod','StartTime','0','StopTime', num2str(tstop),'SolverType',...
%     'Fixed-Step','FixedStep','6')
% t=simOut.get('tout');
% ua=simOut.get('ua');
% uar=simOut.get('uar');
% plot(t,ua,t,ua)
% title('Simulation mit Schrittweite dt')








