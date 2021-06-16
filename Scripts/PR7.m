%% Problema 7

clear all
clc

mTb=[0 -1 0 0 ; 1 0 0 60 ; 0 0 1 0; 0 0 0 1]    % matriz de transformaci�n homog�nea del barco respecto al muelle

bTt=[0 -1 0 20 ; 1 0 0 40 ; 0 0 1 0; 0 0 0 1]   % matriz de transformaci�n homog�nea del turista respecto al barco


pause

%% a)

mTt= mTb * bTt       % multiplico las dos matrices para obtener la matriz de transformaci�n homog�nea del turista respecto al muelle

pause

%% b)

mTg=[1 0 0 70 ; 0 1 0 160 ; 0 0 1 50; 0 0 0 1]      % matriz de transformaci�n homog�nea del gaviota respecto al muelle

bTnb= transl(60, 0, 0) * rotz(-pi/2) * transl(50, 0, 0)         % matriz de transformaci�n homog�nea del nuevo barco con respecto al barco anterior

% nbTt = bTt porque el barco y el turista inm�vil son sistemas de referencia unidos

gTt= (inv(mTg)) * mTb * bTnb * bTt

% En este caso, el pescado caer� sobre el turista ya que la cuarta columna de la matriz gTt indica una traslaci�n del turista con respecto al gaviota solo en el eje z