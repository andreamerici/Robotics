% denavit           Matriz de transformación homogénea.
%
% Devuelve la matriz de transformación homogénea 4 x 4 a partir 
% de los parámetros de Denavit-Hartemberg d, alfa, a y teta.

function dh=denavit(teta, d, a, alfa)

dh=[cos(teta)   -cos(alfa)*sin(teta)    sin(alfa)*sin(teta)     a*cos(teta);
    sin(teta)    cos(alfa)*cos(teta)   -sin(alfa)*cos(teta)     a*sin(teta);
            0              sin(alfa)              cos(alfa)               d;
            0                     0                      0               1];