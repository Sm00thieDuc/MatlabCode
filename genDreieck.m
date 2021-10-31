%GENDREIECK erstellt ein ideales Dreieckssignal
%   A   Amplitude
%   f0  Grundfrequenz des Signals (in Hz angenommen)
%   t   Zeitvektor für (genau) eine Periode des Signals
%   x   Vektor mit den Werten des Dreieck-Signals

%% a
function [x] = genDreieck(A,f0,t)

T0 = 1/f0;  %Periode
dt = t(2)-t(1);

%for (t=0:T0/2) %for ist nicht korrekt
t1=0:dt:T0/2-dt; 
x1 = A*(1-2*t1/T0);

%for (t=T0/2:T0)
t2=T0/2:dt:T0-dt;
x2 = A*(2*t2/T0-1);

x=[x1 x2];     
end

% if (0 <= t) && (t<T0/2)
%     x = A*(1-2*t/T0)
% end    
% if (T0/2 <= t) && (t<T0)
%     x = A*(2*t/T0-1)
% end    