clear all; close all; clc;

%% a L,R,W definieren
L = 10E-3; %Henry
R = 1000; %Ohm 
wg=R/L;
N = 201; %Stützwerte bzw. Vektorgröße
wstart = 0.01*wg;
wend = 100*wg;
% Schrittweite mit exp ansteigenden Werten
% dw = (wend - wstart)/(N-1);
% w = wstart:dw:wend; %Omega = Vektor für unsere Omega Werte
% Vektor mit konst. Schrittweite (weil log. skaliert wird mit logspace)
w=logspace(log10(wstart),log10(wend),N);     %Vektor mit log. wachsender Schrittweite    %log10 = dek. log... log = log naturalis (log_e)

%% b,c |G(w)| und phi(w) darstellen im halblog. Maßstab (w-Achse log. darstellen)
%.^2 = Array Operator für quadrieren, um jedes einzelne Element in der Klammer zu quadrieren
%./ = Array Operator für elementweises dividieren
%Gwabs aus gw berechnen
Gw = (1./(1-1j*(wg./w)));  %ohne "1j" dann Warnung von Matlab
Gwabs = abs(Gw);
phi = angle(Gw);
phiw=180/pi*phi;

figure
subplot(2,1,1)
semilogx(w,Gwabs)
grid
xlabel('{\it \omega} /s^{-1}')
ylabel('|{\it G(\omega)}|_{dB}/dB')
title('Amplitudengang LC-Tiefpass, R=1k\Omega, L=10mH')

subplot(2,1,2)
semilogx(w, phiw,'k') %halblog. Darstellung
grid
xlabel('{\it \omega} /s^{-1}')
ylabel('{\it\phi(\omega)}/1\circ')
title('Phasengang')

%% d normierte Diagramme
figure
subplot(2,1,1)
semilogx(w/wg,20*log10(Gwabs)) %logarithmieren
grid
xlabel('{\it \omega} /\omega_g')
ylabel('|{\it G(\omega)}|_{dB}/dB')
title('Amplitudengang LC-Tiefpass, R=1k\Omega, L=10mH')

subplot(2,1,2)
semilogx(w/wg, phiw,'k') %halblog. Darstellung
grid
xlabel('{\it \omega} /\omega_g')
ylabel('{\it\phi(\omega)}/1\circ')
title('Phasengang')

%% e Ortskurve
figure
plot(real(Gw),imag(Gw))
xlabel('\Re\{{\itG(\omega)}\}')
ylabel('\Im\{{\itG(\omega)}\}')
grid
title('Orskurve des LC-Gliedes')


