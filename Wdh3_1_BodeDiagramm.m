clear all; close all; clc;
%Einheit für omega = s^-1
%% a - Variablen und Vektor definieren
L=10e-3;
R=1e3;
wg=R/L;
wstart=0.01*wg;
wend=100*wg;
N=201;
w=logspace(log10(wstart),log10(wend),N);

%% b - Amplitudengang und Phasengang
Gw=(1./(1-1j*(wg./w)));
Gwabs=abs(Gw)
phi=angle(Gw);
phiw=180/pi*phi;
subplot(2,1,1)
semilogx(w,Gwabs)
title('Amplitudengang')
xlabel('{\it\omega}/s^{-1}')
ylabel('|{\it G(\omega)}|_{dB}/dB')
grid

subplot(2,1,2)
semilogx(w,phiw)
title('Phasengang')
xlabel('{\it\omega}/s^{-1}')
ylabel('{\it\phi(\omega)}/1\circ')
grid

%% c - Beschriftung
%% d
figure
subplot(2,1,1)
semilogx(w/wg,20*log10(Gwabs))
title('Amplitudengang')
xlabel('{\it\omega}/\omega_g')
ylabel('|{\it G(\omega)}|_{dB}/dB')
grid

subplot(2,1,2)
semilogx(w/wg,phiw/pi*180)
title('Phasengang')
xlabel('{\it\omega}/\omega_g')
ylabel('{\it\phi(\omega)}/1\circ')
grid

%% e - Ortskurve
figure
plot(real(Gw),imag(Gw))
xlabel('\Re\{{\itG(\omega)}\}')
ylabel('\Im\{{\itG(\omega)}\}')
grid
title('Orskurve des LC-Gliedes')


