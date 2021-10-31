close all; clear all; clc;

%% b
A = 3;
f0=10;
T0=1/f0;
dt=5e-4;
t=0:dt:T0-dt;

[xtideal] = genDreieck(A,f0,t);

%% c
figure
plot(t, xtideal);
xlabel('{\itt}/s');
ylabel('{\itx(t)}');
title('Amplitude und Frequenz des Zeitsignals');
ylim([0 A+0.1]);

%% e für N=1,3,5,7 
%function [xNt]= FourierDreieck(t,f0,A,N)
x1t = FourierDreieck(t,f0,A,1);
x3t = FourierDreieck(t,f0,A,3);
x5t = FourierDreieck(t,f0,A,5);
x7t = FourierDreieck(t,f0,A,7);

%% f je höher N, desto glatter die approximierte Kurve
figure
subplot(2,2,1)
%plot(t,x1t)
plot(t,x1t,'r',t,xtideal,'g')
xlabel('{\itt}/s');
ylabel('{\itx1(t)}');
title('Amplitude und Frequenz des Zeitsignals, N=1');
xlim([0 T0]);

subplot(2,2,2) 
plot(t,x3t,'r',t,xtideal,'g')
xlabel('{\itt}/s');
ylabel('{\itx1(t)}');
title('Amplitude und Frequenz des Zeitsignals, N=3');
xlim([0 T0]);

subplot(2,2,3)
plot(t,x5t,'r',t,xtideal,'g')
xlabel('{\itt}/s');
ylabel('{\itx1(t)}');
title('Amplitude und Frequenz des Zeitsignals, N=5');
xlim([0 T0]);

subplot(2,2,4)
plot(t,x7t,'r',t,xtideal,'g')
xlabel('{\itt}/s');
ylabel('{\itx1(t)}');
title('Amplitude und Frequenz des Zeitsignals, N=7');
xlim([0 T0]);

%% g
Nmax=20;
Tmax=1/((2*Nmax+1)*f0)  %Periodendauer der Harmonischen mit der höchstmöglichen Frequenz
dt=Tmax/10;             %10 Stützwerte pro Periode = neue Schrittweite bei max. Frequenz

t=0:dt:T0-dt;
[xideal]=genDreieck(A,f0,t);

%% h
N=1;
e=1;
while(e>=1e-5 && N<=Nmax)
    [xNt]=FourierDreieck(t,f0,A,N);
    e=(sum((xtideal-xNt).^2)/length(xNt)); 
    %oder mean((xtideal-xNt).^2)
    N=N+1;
end
N=N-1
fN=(2*N+1)*f0;

%% i
figure
plot(t,xtideal,'r',t,xNt,'b')
xlabel('{\itt}/s')
ylabel('\itx(t)')
legend('\itx_{ideal}(t)', ['\itx_{' num2str(N) '}(t)'])
title(['Approximation mit {\itN=}' num2str(N) ' Oberwellen und Fehlerwert {\ite= }' num2str(e)])
figure;
plot(t,cos(2*pi*fN*t));
xlabel('{\itt}/s')
ylabel([num2str(N) '-te Oberweille'])
xlim([0 1/fN])

%% j
for(N=0:20)
[xNt]=FourierDreieck(t,f0,A,N);
e(N+1)=sum((xtideal-xNt).^2)/length(xNt);
end
figure
plot((0:N),e,'x-')
xlabel('Anzahl Oberwellen \itN')

