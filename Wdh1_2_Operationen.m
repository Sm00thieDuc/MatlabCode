clear all; close all; clc;
%a
x=[1 2 0.5 -3 -1]
y=[2 0 -3 1/3 2 ]
xdotym=x*y'     %Skalarprodukt via Matrixoperation (Zeile * Spalte)
xdotyf=sum(x.*y)%Skalarprodukt via Feldoperation (elementweise Multipliaktion)

%b 
zva=[3 1 2 0.5 -3 -1 3 5 -2 0.3 -4 3] %12 Elemente

uGrenze= -2*ones(1,12)  %zum Bestimmen von Werten >= -2
oGrenze= 2*ones(1,12)   %zum Bestimmen von Werten <= 2 
mask1= (uGrenze <= zva) & (zva <= oGrenze)  %Bitmaske für geg. Bedingung... Werte die >= -2 UND <= 2 sind
uvb = mask1.*zva % bitweise Multiplikation mit Bedingungs-Maske

mask2= (zva < uGrenze) | (oGrenze < zva)    % Werte die < -2 ODER > 2 sind
zvc = zva(mask2)    % "LOGISCHE INDIZIERUNG" via Eingangsvektor(Bitmaske)... Nur Werte aus input gespeichert, die Bedingung erfüllen

mask3 = abs(zva) == 3
zvd = zva.*mask3

mask4= abs(zva) ~= 3
zve = zva(mask4)

