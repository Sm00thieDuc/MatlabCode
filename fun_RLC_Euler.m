%FUN_RLC_EULER Summary of this function goes here
%   Detailed explanation goes here
function [Ue,UC, I, t] = fun_RLC_Euler(R,L,C,Uemax,UC0,I0,tstart,tstop,dt,TA)
%% b
Ue=0;
UC=0; 
I=0; 
t=0;
%% d
D=R/2*sqrt(C/L);
w0=1/sqrt(L*C);
fe=1/(2*pi)*w0.*(sqrt(1-D^2));

%% e Zeitvektor für exakte Lösung
t1=tstart:dt:tstop;
Ue=ones(1,length(t1));

%% f exakte Lsg in ABh. von t1 und plotten via -x- + Legende
UC_exakt=UC0+(Uemax-UC0)*(1-exp(-w0*D*t1)*1/sqrt(1-D^2).*sin(w0*(sqrt(1-D^2))*t1+acos(D)));

%plot(t1,UC_exakt,'x')
%legend('\itU_{C,exakt}')


%% g Übertragungsfunktion mit step() abbilden
%Variablen
b0=1;
a0=1;
a1=2*D/w0;
a2=1/w0^2;
h=Uemax-UC0;    %Sprunghöhe
offset=4;
%Übertragungsfunktion
G1s=tf(b0,[a2 a1 a0]);
UC_step= h*G1s + offset;
plot(t1,UC_exakt,'x', t, step(UC_step))
legend('{\itU_{C,exakt}}','\itU_{C,step}')
grid

%% h 
t=tstart:TA:tstop;      %Zeitvektor mit Schrittweite TA
Ue=Uemax*ones(1,length(t));
K=length(t)-1;        % Anzahl der Stützwerte 
UC=zeros(1,length(t));          % initialisiere UC 
    
UC(1)=UC0;	% Anfangswert uc(t=0)=0 
I(1)=I0;
for k=1:K
    I(k+1)=I(k)+TA/L*(Ue(k)-R*I(k)-UC(k));
    UC(k+1)=UC(k)+TA*I(k)/C;
end
hold on
plot(t,UC)
%legend('{\itU_{C,Euler}}')

% plot(t1,UC_exakt,'x', t, step(UC_step),t,UC)
% legend('{\itU_{C,exakt}}','\itU_{C,step}','\itU_{C,Euler}')
end
