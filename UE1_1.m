clear all; close all;clc;
%%a Matrix definieren
mMatrix =[7 2*10^-3 j; -2.6 2-4j -1; 45 9 -j]
%%b Wertzuweisung
z = 2*pi
%%c Matrix aus matrix
mBig = [
    mMatrix mMatrix;
    mMatrix mMatrix;
    ];
%%d Matrix mit Schrittweite 4 bis 200 als Endwert
zvBig = (1:4:200);
%%e Spaltenvektor
svVektor = [3 4.5 9+2j -4]'
%%f Zeilenvektor
zvVektor = [7 2.4 8j]
%%g Matrix um Zeile, Spalte und Zeile ergänzen
mMatrix = [mMatrix; zvVektor]
mMatrix = [mMatrix svVektor]
mMatrix = [mMatrix; 3 7.5 -4 2+3j]
%%h Spalte und Zeile löschen
mMatrix(:,3)=[] %3. Spalte löschen
mMatrix(4,:)=[] %4. Zeile löschen
%%i Wertzuweisung
mMatrix(2,2) = pi
%%j Matrix mit Schrittweite
x = (-3:0.5:15)
%%k 
len = length(x)
idx = (2:4:len)
y= x(idx)
% Hinweis zu Aufgabe k) bzw. Variable y:
% Definieren Sie zunächst einen Indexvektor idx (egal ob Zeilen- oder Spaltenvektor) mit dem
% Anfangswert 2, der Schrittweite 4 und der Anzahl der Elemente von x als Endwert. Obwohl idx ein
% Vektor ist, kann idx wie ein üblicher Index von x verwendet werden (s. Abschnitt 1.8 im Script), nur
% dass sich als Ergebnis keine einzelne Zahl, sondern ein Vektor mit der gleichen Länge wie idx ergibt.

