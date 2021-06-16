%% Problema 6

clear all
clc

aTr1=[-1 0 0 5 ; 0 -1 0 -2 ; 0 0 1 0; 0 0 0 1]    % matriz de transformaci�n homog�nea del sistema de referencia r1 respecto al sistema de referencia a

r1To=[0 1 0 -4 ; -1 0 0 7 ; 0 0 1 0; 0 0 0 1]     % matriz de transformaci�n homog�nea del sistema de referencia o respecto al sistema de referencia r1

aTb=[0 -1 0 -1 ; 1 0 0 -6 ; 0 0 1 0; 0 0 0 1]     % matriz de transformaci�n homog�nea del sistema de referencia b respecto al sistema de referencia a

bTr2=[-1 0 0 1 ; 0 -1 0 -3 ; 0 0 1 0; 0 0 0 1]    % matriz de transformaci�n homog�nea del sistema de referencia r2 respecto al sistema de referencia b

pause

%% d)

oTr1=inv(r1To)              % matriz de transformaci�n homog�nea del sistema de referencia r1 respecto al sistema de referencia o

oTa= oTr1 * (inv(aTr1))     % matriz de transformaci�n homog�nea del sistema de referencia a respecto al sistema de referencia o

oTb= oTa * aTb              % matriz de transformaci�n homog�nea del sistema de referencia b respecto al sistema de referencia o

oTr2= oTb * bTr2            % matriz de transformaci�n homog�nea del sistema de referencia r2 respecto al sistema de referencia o

pause

%% e)

rTrn= rotz(-pi/2) * transl(3, 1, 0)         % matriz de transformaci�n homog�nea de los nuevos sistemas de referencias de los robots con respecto a los robots anteriores


aTr1n= aTr1 * rTrn             % matriz de transformaci�n homog�nea del nuevo sistemas de referencia r1 con respecto al sistema de referencia a

bTr1n= (inv(aTb)) * aTr1n      % matriz de transformaci�n homog�nea del nuevo sistemas de referencia r1 con respecto al sistema de referencia b

% El nuevo robot 1 no est� ni en el punto a ni en el punto b, ya que la cuarta columna de las matrices aTr1n y bTr1n indica una traslaci�n con respecto a estos puntos


bTr2n= bTr2 * rTrn             % matriz de transformaci�n homog�nea del nuevo sistemas de referencia r2 con respecto al sistema de referencia b

aTr2n= aTb * bTr2n             % matriz de transformaci�n homog�nea del nuevo sistemas de referencia r2 con respecto al sistema de referencia a

% El nuevo robot 2 est� ni en el punto b, ya que la cuarta columna de la matriz bTr2n indica una traslaci�n nula con respecto a esto punto
