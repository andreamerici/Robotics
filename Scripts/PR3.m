%% Problema 3

clear all
clc

mTr=[1 0 0 60 ; 0 1 0 40 ; 0 0 1 0; 0 0 0 1]    % matriz de transformación homogénea del robot respecto a la mesa

pause

%% a)

rTnr1= transl(20, 0, 0) * transl(0, -20, 0) *  rotz(-pi/2) * transl(30, 0, 0) * transl(0, 10, 0)    % matriz de transformación homogénea del robot traslado respecto a el robot anterior

mTnr1=(mTr)*(rTnr1)               % matriz de transformación homogénea del robot traslado respecto a la mesa

% En este caso, el robot cae de la mesa ya que la traslación con respecto a la mesa en la coordenada y es negativa y el robot está fuera del área de la mesa

pause

%% b)

rTnr2= rotz(-pi/2) * transl(20, 0, 0) * transl(0, 30, 0) *  rotz(pi) * transl(30, 0, 0) * transl(0, 40, 0)    % matriz de transformación homogénea del robot traslado respecto a el robot anterior

mTnr2=(mTr)*(rTnr2)               % matriz de transformación homogénea del robot traslado respecto a la mesa

% En este caso, el robot no cae de la mesa ya que las traslaciones con
% respecto a la mesa en las coordenadas x e y son positivas y el robot está
% dentro del área de la mesa