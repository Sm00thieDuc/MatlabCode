clear all; close all; clc

%% a Variablen definieren
R= 10;
L= 100E-3;
C= 100E-6;
Uemax= 2;
UC0= 4;
I0= 0;
tstart= 0;
tstop= 0.1;
TA= 100e-6;
dt=100e-6;

%% c
[Ue,UC, I, t] = fun_RLC_Euler(R,L,C,Uemax,UC0,I0,tstart,tstop,dt,TA)
