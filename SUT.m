close all; clear all; clc;     

%% a Signaldarstellung
f0 = 20;
M=1001;
T0=1/f0;
%Zeitvektor
dt=1/(f0*M);
t=0:dt:T0;
%Signaldarstellung
x1t= -2/(2*pi*t*dt)*(sin(2*pi*t*dt/2)/(2*pi*t)-0.5*dt*cos(2*pi*t));
x2t= 2+sin(100*2*pi*t)-6*cos(200*2*pi*t)-2*cos(500*2*pi*t)+sin(500*2*pi*t);
figure
subplot(3,1,1)
plot(t,x1t,'b')
grid
hold on
plot(t,x2t,'r')
legend('Signal x1(t)','Signal x2(t)')

%% b Amplituden und Phasenspektrum darstellen
N=25;
T0=1/f0;
a=zeros(1,N+1); %Fourierkoeffizienten werden in 2 ZeilenVektoren gespeichert 
b=zeros(1,N+1); %Zeilenvektorenn werden hier initialisiert
%Gleichanteil
a01=2/T0*trapz(t,x1t);
a02=2/T0*trapz(t,x2t);
a1(1)=a01/2; %erster Koeffzient hier iniatilisiert
a2(1)=a02/2; %erster Koeffzient hier iniatilisiert

for n=1:N %10 Fourierkoeffizienten ohne Gleichanteil werden hier initialisiert und dann gespeichert
    a1(n+1)=2/(T0)*trapz(t,x1t.*cos(2*pi*n*f0*t)); %elementweise Multiplikation!!
    b1(n+1)=2/(T0)*trapz(t,x1t.*sin(2*pi*n*f0*t)); % immer nächstes Element wird generiert, da 1. Element in Zeile ...

    a2(n+1)=2/(T0)*trapz(t,x2t.*cos(2*pi*n*f0*t)); %elementweise Multiplikation!!
    b2(n+1)=2/(T0)*trapz(t,x2t.*sin(2*pi*n*f0*t)); % immer nächstes Element wird generiert, da 1. Element in Zeile ...
end

%Aplituden D mithilfe komplexer Fourierkoeefizient c
c1=a1-1j*b1;       % komplexe Fourierkoeffizienten
D1=abs(c1);       %alle Amplituden der komlexen Koeffzienten

%Amplitude Signal 2
c2=a2-1j*b2;       
D2=abs(c2);       

%Phasen beider Signale
phi_1=angle(c1)*180/pi; %.*(D>1e-10);   % korrigiertes Phasenspektrum  !!!!! siehe Kommentare in obiger Zeile
phi_2=angle(c2)*180/pi;

%Amplitudendarstellung beider Signale
f=(0:N)*f0;     %N*f0 ergeben Frequenzen, angefangen bei 0
subplot(3,1,2)
stem(f,D1,'b','x')       %x Achse bekommt Frequenzen und y Achse die Amplituden --> stem weil diskret, statt kontinuierliches Amplitudenspektrum
grid
hold on
stem(f,D2,'r','o')     % Phasenspektrum
legend('Amplitude x1(t)','Amplitude x2(t)')

%Phasen beider Signale
f=(0:N)*f0;     %N*f0 ergeben Frequenzen, angefangen bei 0
subplot(3,1,3)
stem(f,phi_1,'b','x')       %x Achse bekommt Frequenzen und y Achse die Amplituden --> stem weil diskret, statt kontinuierliches Amplitudenspektrum
grid
hold on
stem(f,phi_2,'r','o')     % Phasenspektrum
legend('Phasenwinkel x1(t)','Phasenwinkel x2(t)')

%% e alle Teilisgnale von x2t in einem Bild
t=0:dt:T0;
x21=ones(1,length(t))*2; %Konstante bei 2 via ones(1,Vektorlänge von t-Vektor) --> 2 wäre nur ein Skalar
x22=sin(100*2*pi*t);
x23=-6*cos(200*2*pi*t);
x24=-2*cos(500*2*pi*t);
x25=sin(500*2*pi*t);

figure
plot(t,x21,t,x22,t,x23,t,x24,t,x25)
grid
legend('Gleichanteil','1. Oberwelle','2.Oberwelle','5.Oberwelle gerader Anteil','5.Oberwelle ungerader Anteil')

%% g
P=3;
t=0:dt:T0;
t1=0:dt:3*T0;
%Signaldarstellung
x1t= 3*sin(100*2*pi*t1)+6*cos(160*2*pi*t1)-2*cos(400*2*pi*t1)-2*sin(400*2*pi*t1);
x2t= 2+sin(100*2*pi*t1)-6*cos(200*2*pi*t1)-2*cos(500*2*pi*t1)+sin(500*2*pi*t1);
figure
plot(t1,x1t,'b')
grid
hold on
plot(t1,x2t,'r')
legend('Signal x1(t)','Signal x2(t)')

