%% Problema 5

clear all
clc

rTm=[0 -1 0 40 ; 1 0 0 70 ; 0 0 1 50; 0 0 0 1]    % matriz de transformaci�n homog�nea de la muneca respecto a la base

eTm=[-1 0 0 60 ; 0 -1 0 60 ; 0 0 1 0; 0 0 0 1]    % matriz de transformaci�n homog�nea de la muneca respecto al extremo

mTc=[1 0 0 0 ; 0 1 0 80 ; 0 0 1 -50; 0 0 0 1]     % matriz de transformaci�n homog�nea del cesto respecto a la muneca

pause

%% a)

rTc = rTm * mTc             % matriz de transformaci�n homog�nea del cesto respecto a la base

pause

%% b)

eTc = eTm * mTc             % matriz de transformaci�n homog�nea del cesto respecto al extremo

% En este caso, la pelota cae fuera del cesto ya que la cuarta columna de la matriz eTc indica que el cesto est� traslado
% con respecto al extremo a lo largo de los ejes x, y e z

pause

%% c)

cTm=inv(mTc)                % calculo la matriz inversa de mTc para obtener la matriz de transformaci�n homog�nea de la muneca con respecto al cesto

mTe=inv(eTm)                % calculo la matriz inversa de eTm para obtener la matriz de transformaci�n homog�nea del extremo con respecto a la muneca

eTen=rotz(pi/2) * transl(-20, -60, 0)

cTen = cTm * mTe * eTen     % matriz de transformaci�n homog�nea del nuevo extremo respecto al cesto

% En este caso, la pelota cae dentro del cesto ya que la cuarta columna de la matriz eTc indica que el nuevo extremo est� traslado
% con respecto al cesto solo a lo largo del eje z, quedando justo encima del cesto