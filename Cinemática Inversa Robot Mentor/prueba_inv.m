%% Prueba de la función mentor_inv 

clear all
clc

%% Caso a

T=mentor_dir([20, -40, -20, 10, 10],'g')
q=mentor_inv(T,'a','g')

pause

%% Caso b

T=mentor_dir([-20, -95, 45, 45, 20],'g')
q=mentor_inv(T,'b','g')

pause

%% Caso c

T=mentor_dir([20, -80, -20, -10, 5],'g')
q=mentor_inv(T,'a','g')

pause

%% Caso d

T=mentor_dir([-20, -100, 5, 0, 0],'g')
q=mentor_inv(T,'b','g')
