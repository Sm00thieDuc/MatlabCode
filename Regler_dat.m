clear all;close all;clc;

%% a
%Parameter
w0=5;
D=0.2;
p1=-1;
p2=-0.5;
Kp=5;
%Variablen
b0=1;
a0=1;
a1=2*D/w0;
a2=1/w0^2;
%Übertragungsfunktion
G1s=tf(b0,[a2 a1 a0])
s=tf('s');
G2s=1/((s-p1)*(s-p2))
%P-Regler
GRs=Kp;

%% b
G0s=GRs*G1s*G2s;

%% c
figure
h=nyquistplot(G0s,linspace(0,10,1000))
h.showFullContour='off';

%% d
fak=1/0.68;
Kkrit=fak*5;
Kkrit=7.2; %durch probieren
Kp=Kkrit;

%% e Sprungantwort mit Übertragungsfunktion Gw 
GRs=Kp;
G0s=GRs*G1s*G2s;
Gw=minreal(G0s/(1+G0s));
figure
step(Gw)
figure
h2=nyquistplot(G0s)
h.showFullContour='off';

%% f
Tkrit=2; %2 Sekunden abgelesen durch data tip

%% g Pol Nullstellen Diagramm
figure
pzmap(Gw)

%% h
wkrit=3.32; %3.32i aus PZ Diagramm abgelesen
Tkrit= 2*pi/3.32; %a ns = 1.8925

%% i Ziegler-Nichols P Regler
KP=0.5*Kkrit;
GRp=KP;
G0s=GRp*G1s*G2s;
GWp=G0s/(1+G0s);
figure
step(GWp)
legend('P-Regler Sprungantwort')

%% j Ziegler-Nichols PI Regler
KP=0.45*Kkrit;
KI=1.2*KP/Tkrit;
GRs=KP+KI/s;
G0s=GRs*G1s*G2s;
GWpi=G0s/(1+G0s);
hold on
step(GWpi)
legend('PI-Regler Sprungantwort')


%% k Ziegler-Nichols PID Regler
T1=0.02;
KP=0.6*Kkrit;
KI=2*KP/Tkrit;
KD=0.125*Tkrit*KP;
GRs=KP + KI/s + KD*s/(1+T1*s);
G0s=GRs*G1s*G2s;
GWpid=G0s/(1+G0s);
hold on
step(GWpid)
legend('PID-Regler Sprungantwort')

%% l

%leider aus Zeitgründen nur bis k geschafft

% hätte G0s mit 3 "Transfer fcn" Blöcken aufgebaut mit Faktor KP, KI/s und
% KD/(1+T1*s) bzw. parametrisiert

% Eingang W(s), Ausgang X(s) und E(s) hätte ich mit einem "sum+-"-Block
% voneinander subtrahiert