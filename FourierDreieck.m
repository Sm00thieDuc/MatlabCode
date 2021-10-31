%FourierDreieck erstellt ein approximiertes Dreieckssignal
%   A   Amplitude
%   f0  Grundfrequenz des Signals (in Hz angenommen)
%   t   Zeitvektor für (genau) eine Periode des Signals
%   N   von Null verschiedene Oberwellen
%   xNt Signal für approx. Dreieckssignal x_N (t)

%% d
function [xNt]= FourierDreieck(t,f0,A,N)

%Gleichanteil initialisieren
xNt = A/2;
for(n=1:N+1)
    %Summenbildung
    xNt = xNt + 4*A/pi^2*1/(2*n-1)^2*cos(2*pi*(2*n-1)*f0*t);
end
end

%xNt = A/2 + 4*A/pi^2*symsum(1/(2*n-1)^2*cos(2*pi*(2*n-1)*f0*t),n,1,N+1)