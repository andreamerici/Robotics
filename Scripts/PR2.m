%% Problema 2

clear all
clc

mTb=[0 -1 0 0 ; 1 0 0 60 ; 0 0 1 0; 0 0 0 1]        % matriz de transformación homogénea del barco respecto al muelle

eTb=[0 1 0 -40 ; -1 0 0 20 ; 0 0 1 0; 0 0 0 1]      % matriz de transformación homogénea del barco respecto a la escotilla

pause

%% a)

bTe=inv(eTb)        % calculo la matriz inversa de eTb para obtener la matriz de transformación homogénea de la escotilla con respecto al barco

mTe= mTb * bTe      % multiplico las dos matrices para obtener la matriz de transformación homogénea de la escotilla con respecto al muelle

pause

%% b)

cTm=[1 0 0 -70 ; 0 1 0 -160 ; 0 0 1 -50; 0 0 0 1]


bTnb= transl(60,0,0) * rotz(-pi/2) * transl(50,0,0)     % matriz de transformación homogénea del nuevo barco con respecto al barco anterior

cTe= (inv(cTm)) * mTb * bTnb * bTe      % multiplico las matrices para obtener la matriz de transformación homogénea de la escotilla con respecto a la cinta

% % En este caso, el grano no caerá por la escotilla ya que la cuarta
% columna de la matriz cTe indica una traslación de la escotilla con
% respecto a la cinta