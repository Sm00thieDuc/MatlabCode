clear all; close all; clc;

%% b - Erzeugung Parameter und normalverteiltes Signal 
dt=1e-3;
te=50e-3;

[xn,t,N] = myNoiseGen('n',dt,te);

 
 %% e = Erzeugung gleichverteiltes Signal
 [xg,t,N]=myNoiseGen('g',dt,te);
 
%% f - Aufgabe wird im Nachinein auskommentiert, sonst Abbruch durch error
%[xg,t,N]=myNoiseGen('e',dt,te);

%% g 
figure
plot(t,xn,'o-',t,xg,'x-')
title('zuvallsverteilte Rauschsignale')
xlabel('{\itt}/s')
ylabel('Signalstärke')
legend('normalverteiltes Rauschen','gleichverteiltes Rauschen')
grid

%% i - error Meldung Test für dt oder te
%[xn,t,N]=myNoiseGen('g',-2,te)

%% j - Parameter anpassen
dt=1e-3;
te=5e-3;
s = settings;
s.matlab.editor.AllowFigureAnimation.PersonalValue = true;

%% k
while te<=1000s
    [xg,t,N]=myNoiseGen('g',dt,te); 
    [xn,t,N]=myNoiseGen('n',dt,te); 
    
    subplot(1,2,1)
    histogram(xg,50,'Normalization','probability')
    title("gleichverteiltes Rauschen mit Länge" + num2str(te)+"s")
    axis([-1 1 0 0.1])
    drawnow
    
    subplot(1,2,2)
    histogram(xn,50,'Normalization','probability')
    title("normalverteiltes Rauschenmit Länge" + num2str(te)+"s")
    axis([-5 5 0 0.1])
    drawnow
    te=3*te;
    pause(0.75)

end    

%% j, ToDo: k
% te=5e-3 %5ms
% while te < 1000
%     histogram(t2,xn,'o-',t2,xg,'x-')
% end
