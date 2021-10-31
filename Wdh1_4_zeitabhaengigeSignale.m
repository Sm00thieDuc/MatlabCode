clear all; close all; clc;
%s(t)=sin(2*pi*50*t)

%% a
t=(0:25E-3:0.1)
%% b
st=sin(2*pi*50*t)
plot(t,st);
%% c 
% geplottete Funktion ist nicht sinusförmig, sondern zickzackförmig, da zu
% wenig Stützpunkte vorhanden sind
% ML: 
% Die Schrittweite in t ist größer als die Periodendauer von s(t) (T=00ms) dadurch entsteht
% in der Darstellung ein Signal der Frequenz f=10Hz statt f=50Hz, wie es in der Gleichung 1 
% angegeben ist. Das Abtastgesetz um FORDERT, dass die Schrittweite von t kleiner als 10ms
% gewählt werden muss. Für eine glatte Darstellung muss dieser Wert jedoch ca. noch um den
% Faktor 100 kleiner gewählt werden,
%% d
t1=(0:25E-6:0.1)
st1=sin(2*pi*50*t1)
hold on
plot(t,st)
plot(t1,st1)
hold off

%% f
figure
st2= exp(10*t1).*(sin(2*pi*5*t1)).^2 %elementwise Multiplikation vor Sinus und beim quadrieren
plot(t1,st2)