clear all; close all; clc;

%% a Übertragungsfunktion abbilden
%Parameter
w0=5;
D=0.2;
%Variablen
b0=1;
a0=1;
a1=2*D/w0;
a2=1/w0^2;
%Übertragungsfunktion
G1s=tf(b0,[a2 a1 a0])

%% b G1S(s) plotten
% 1. Methode 
figure
bode(G1s)
grid

% 2. Methode
figure
wstart = 1E-2;
wend = 1E3;
N=1000;
w=logspace(log10(wstart),log10(wend),N);     %Vektor mit log. wachsender Schrittweite    %log10 = dek. log... log = log naturalis (log_e)
[Gabs,phi] = bode(G1s,w)

subplot(211)
semilogx(w,20*log10(squeeze(Gabs))) % squeeze: muss mit 20*log10 in dB umgerechnet werden
title('Amplitude der Übertragungsfunktion')
grid
subplot(212)
semilogx(w,squeeze(phi))
title('Phase der Übertragungsfunktion')
grid

%% c Ortskurve G1s(s)
figure
h=nyquistplot(G1s);
h.ShowFullContour='off';    % Darstellung nur für positive Kreisfrequenzen w>0
xlabel('{\it\Re}');
ylabel('{\it\Im}');
title('Ortskurve von {G_{1s}}')

%% d Signalvektor x(t)
T0=1;
dt=T0/50;

t1=0:dt:T0-1;
t2=T0:dt:5*T0;

x1t=2/T0*(sin(pi/T0.*t1)).^2;
x2t=0*ones(size(t2));

t=0:dt:5*T0;
xt=[x1t x2t]

% figure
% plot(t,xt)

%% e  
figure
subplot(3,1,1)                              % Unterteilung in drei Diagramme
% Sprungantwort
step(G1s)                % Plot wird durch die Funktion erstellt
grid

subplot(3,1,2)          % Unterteilung in drei Diagramme
[uci,t]=impulse(G1s);    % Funktion liefert die Systemantwort und den zugehörigen Zeitvektor
plot(t,uci)
grid

subplot(3,1,3)
ucl=lsim(Gs,xt,t);
subplot(3,1,3)
plot(t,ucl)
xlabel('{\itt}/s');title('Antwort auf ein beliebiges Eingangssignal')


%% f
figure
pzmap(G1s)



% 
% ucs=step(G1s,t);                 % Funktion liefert die Systemantwort zu den in t angegebenen Zeitpunkten 
% ucss=diff(ucs)./diff(t);        % =du_cs/dt -> Differenzieren der Sprungfunktion/-antwort ergibt Impulsfunktion/-antwort
% hold on
% subplot(3,1,3)
% plot(t(1:length(ucss)),ucss)    %geplotteter Zeitvektor ist um 1 verkürzt, daher uccs (siehe rechts im Workspace)
% grid
% legend('Impulsantwort durch Ableitung der Sprungantwort')






