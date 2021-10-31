clear all; close all; clc;
%% a
RE=1e6;
CE=20e-12;
n=10;

%% b
CV1=1.1e-12;
CV2=3.3e-12;
CV0=CE/(n-1);
RV=RE*(n-1);

%% c
w=linspace(0,1e6,1000);

%% d
vw0=RE./(RE+RV*(1+1j*w*RE*CE)./(1+1j*w*RV*CV0)); % je ./ da je jWRC ein Vektor, wegen omega w 
vw1=RE./(RE+RV*(1+1j*w*RE*CE)./(1+1j*w*RV*CV1));
vw2=RE./(RE+RV*(1+1j*w*RE*CE)./(1+1j*w*RV*CV2));

%% e
plot(w,vw0,w,vw1,w,vw2)
legend(['abgeglichen'],['überkompensiert'],['unterkompensiert'])
title("Betrrag der Verstärkungen in Abhängigkeit von \omega")
xlabel('{\it\omega}/s^{-1}')
ylabel('|{\it V(\omega)}|')

%% f
xlim([0 6e5])
legend(['abgeglichender Zustand C_V=' num2str(CV0)],...
['unterkompensierter Zustand C_V=' num2str(CV1)],...
['überkompensierter Zustand C_V=' num2str(CV2)])

%% g
CV=linspace(CV0/2,2*CV0,10);
w=logspace(3,7,1000);

%% h
figure
for m=1:length(CV)
  vw=RE./(RE+RV*(1+1j*w*RE*CE)./(1+1j*w*RV*CV(m)));   
  semilogx(w,20*log10(abs(vw)));
  hold all
end    


%% h Zusatz
hold off
% for m=1:length(CV)
% vw(m,:)=RE./(RE+RV*((1+j*w*RE*CE)./(1+j*w*RV*CV(m))));
% end
%oder unter Nutzung der impliziten Erweiterungen
vw=RE./(RE+RV*((1+j*w*RE*CE)./(1+j*w*RV.*CV')));
semilogx(w,20*log10(abs(vw)))

%% i
%legend(num2str(1e12*CV'))
%besser, weil es keinen Fehler bei unterschiedlicher Länge der Einträge gibt
legend(string(1E12*CV'))
grid
xlabel('{\it\omega}/s^{-1}')
ylabel('20\cdotlg|{\itv(\omega)}|')
title('Frequenzabhängiger Spannungsteiler in Abhängigkeit von C_V [pF]')