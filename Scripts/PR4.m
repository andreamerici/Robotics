%% Problema 4

clear all
clc

r1Tr2=[1 0 0 8 ; 0 1 0 2 ; 0 0 1 0; 0 0 0 1]    % matriz de transformación homogénea del robot 2 respecto al robot 1

r2Te2=[0 -1 0 1 ; 1 0 0 6 ; 0 0 1 5; 0 0 0 1]   % matriz de transformación homogénea del extremo 2 respecto al robot 2

r1Te1=[0 1 0 1 ; -1 0 0 11 ; 0 0 1 8; 0 0 0 1]  % matriz de transformación homogénea del extremo 1 respecto al robot 1

pause

%% a)

e1Tr1=inv(r1Te1)                % calculo la matriz inversa de r1Te1 para obtener la matriz de transformación homogénea del robot 1 con respecto al extremo 1

e1Te2=e1Tr1 * r1Tr2 * r2Te2     % multiplico las matrices para obtener la matriz de transformación homogénea del extremo 2 con respecto al extremo 1

% La cuarta columna de la matriz e1Te2 indica que el extremo 2 està traslado
% con respecto al extremo 1 no se tocan

pause

%% b)

e2Te2n= rotz(pi/2) * transl(8, -3, 3)

e1Te2n=(e1Te2)*(e2Te2n)          % multiplico las matrices para obtener la matriz de transformación homogénea 
                                 % del extremo 2 nuevo con respecto al extremo 1
                                 
% La cuarta columna de la matriz e1Te2n indica que el extremo 2 nuevo no està traslado
% con respecto al extremo 1 y se tocan