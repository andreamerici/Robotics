%% PROBLEMA 1

clear all
clc

mTc=[1 0 0 -30 ; 0 1 0 40 ; 0 0 1 0; 0 0 0 1]       % matriz de transformación homogénea del cubo respecto a la mesa

mTp=[0 1 0 -50 ; -1 0 0 0 ; 0 0 1 50; 0 0 0 1]      % matriz de transformación homogénea de la pelota respecto a la mesa

pause

%% a)

cTm=inv(mTc)        % calculo la matriz inversa de mTc para obtener la matriz de transformación homogénea de la mesa con respecto al cubo

cTp=cTm*mTp         % multiplico las dos matrices para obtener la matriz de transformación homogénea de la pelota con respecto al cubo

% Si la pelota se cae en este momento, no caerá en el cubo ya que, observando la matriz cTp, la cuarta columna indica que el sistema Sp se traduce
% con respecto al sistema Sc en las coordenadas x e y.

pause

%% b)

pTnp= roty(-pi/2) * transl(0, 0, 40) * transl(0, 20, 0)

cTnp=(cTp)*(pTnp)                                                   % multiplico las matrices para obtener la matriz de transformación homogénea 
                                                                    % de la pelota traslada con respecto al cubo

% La cuarta columna de la matriz cTnp indica que el sistema Sp ahora està traslado con respecto al sistema Sc solo en el eje z, por lo que 
% si la pelota se cae en este momento, caerá en el cubo
