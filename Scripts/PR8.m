%% Problema 8

clear all
clc

cTo=[0 1 0 0 ; 1 0 0 -2 ; 0 0 -1 5; 0 0 0 1]    % matriz de transformación homogénea del objeto respecto a la camera

cTr=[1 0 0 0 ; 0 -1 0 6 ; 0 0 -1 2; 0 0 0 1]    % matriz de transformación homogénea de la base del robot respecto a la camera


pause

%% a)

rTc=inv(cTr)        % calculo la matriz inversa de cTr para obtener la matriz de transformación homogénea de la camera con respecto al robot

rTo=rTc * cTo       % multiplico las dos matrices para obtener la matriz de transformación homogénea del objecto con respecto al robot

pause

%% b)

cTnc= rotx(pi) * transl(0,4,0) * transl(0,0,-2)         % matriz de transformación homogénea de la nueva camera con respecto a la camera anteriore

rTnc= rTc * cTnc                     % multiplico las dos matrices para obtener la matriz de transformación homogénea de la nueva camera con respecto al robot

pause

%% c)

oTno= rotz(pi/2) * transl(0,2,0)                        % matriz de transformación homogénea del nuevo objecto con respecto al objecto anterior

ncTno= (inv(cTnc)) * cTo * oTno       % multiplico las matrices para obtener la matriz de transformación homogénea del nuevo objecto con respecto a la nueva camera

