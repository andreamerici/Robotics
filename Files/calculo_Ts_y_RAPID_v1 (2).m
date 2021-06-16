
% Programa que a partir del fichero generado por la tableta,escalado y
% tratado (se han eliminado los puntos adyacentes que estén a menos de una 
% distancia en este caso 2mm, y las líneas en que la z=0 se han eliminado 
% todas las adyacentes y sólo se ha dejado una).
% Este fichero genera el código RAPID con los puntos x e y del fichero y la
% coordenada z que toca el papel se introduce al principio con z0.
% En los puntos en que no se toca el papel, se levanta el lápìz en el punto
% anterior y en el posterior.
% Se lee además el azimut y la inclinación y se crea el cuaternio
% correspondiente que también se introduce en el comando MovL.
clear
z0=-24.3; % Valor de z que toca el papel
% Matriz de transformación Homogénea que relaciona la tableta con la base
% del robot
R_T_T=transl([500 -150 z0])*rotz(pi/2);
% Se carga el fichero tratado para generar el código
filename='Andrea.mat';
load(filename, 'total_tratado')

% Se generan las string para generar los comandos de RAPID
comando='';
comando=strvcat(comando,'VAR num p0:=0; ! Altura para simulación. Si p0=0 => toca papel');
comando=strvcat(comando,' ');
str1='MoveL [[' ;% Primera parte del comando
% str2='),v50,fine,Boligrafo_Wacom\WObj:=wobj0;' % fin del comando % valor
% inicial
str2='],[-1,0,-1,0],[9E9,9E9,9E9,9E9,9E9,9E9]],v100,fine,boligrafo2\WObj:=wobj0;'; % fin del comando

% Se calcula cada punto y se genera su línea de código correspondiente
for n=1:length(total_tratado)
    if total_tratado(n,4)==1 % El punto toca el papel
        % Matriz que relaciona el lapiz con respecto a la tableta ( Son los
        % puntos generados por la tableta y que han sido tratados).
        T_T_L=transl([total_tratado(n,1) total_tratado(n,2) 0])*rotz(pi/2-total_tratado(n,5)*pi/180)*...
            roty(-pi/2-total_tratado(n,6)*pi/180);
        % Matriz del lápiz respecto a la base del robot
        R_T_L=R_T_T*T_T_L;
        R_Q_L=quaternion(R_T_L); % orientación del lápiz referida a la base del robot
        R_Q_L_dato=double(R_Q_L); % Se extraen las componentes del cuaternio
        
        % Se genera el código
        t = horzcat(str1,num2str(R_T_L(1,4), '%6.3f'),...
            ',',num2str(R_T_L(2,4), '%6.3f'),...
            ',',num2str(R_T_L(3,4), '%6.3f'),'+p0],[',...
                num2str(R_Q_L_dato(1), '%6.3f'),...
            ',',num2str(R_Q_L_dato(2), '%6.3f'),...
            ',',num2str(R_Q_L_dato(3), '%6.3f'),...
            ',',num2str(R_Q_L_dato(4), '%6.3f'),str2);
        comando=strvcat(comando,t);
    else % el punto no toca el papel, Hay que estar seguro de que sólo existte 
         % una sola linea consecutiva que no toque el papel.
        T_T_L=transl([total_tratado(n-1,1) total_tratado(n-1,2) 15])*rotz(pi/2-total_tratado(n-1,5)*pi/180)*...
            roty(-pi/2-total_tratado(n-1,6)*pi/180); % se le suma 15 a la z del punto anterior
        R_T_L=R_T_T*T_T_L;
        R_Q_L=quaternion(R_T_L);
        R_Q_L_dato=double(R_Q_L);

        t = horzcat(str1,num2str(R_T_L(1,4), '%6.3f'),...
            ',',num2str(R_T_L(2,4), '%6.3f'),...
            ',',num2str(R_T_L(3,4), '%6.3f'),'+p0],[',...
                num2str(R_Q_L_dato(1), '%6.3f'),...
            ',',num2str(R_Q_L_dato(2), '%6.3f'),...
            ',',num2str(R_Q_L_dato(3), '%6.3f'),...
            ',',num2str(R_Q_L_dato(4), '%6.3f'),str2);
        comando=strvcat(comando,t);
        
        T_T_L=transl([total_tratado(n+1,1) total_tratado(n+1,2) 15])*rotz(pi/2-total_tratado(n+1,5)*pi/180)*...
            roty(-pi/2-total_tratado(n+1,6)*pi/180); % se le suma 15 a la z del punto siguiente
        R_T_L=R_T_T*T_T_L;
        R_Q_L=quaternion(R_T_L);
        R_Q_L_dato=double(R_Q_L);

        t = horzcat(str1,num2str(R_T_L(1,4), '%6.3f'),...
            ',',num2str(R_T_L(2,4), '%6.3f'),...
            ',',num2str(R_T_L(3,4), '%6.3f'),'+p0],[',...
                num2str(R_Q_L_dato(1), '%6.3f'),...
            ',',num2str(R_Q_L_dato(2), '%6.3f'),...
            ',',num2str(R_Q_L_dato(3), '%6.3f'),...
            ',',num2str(R_Q_L_dato(4), '%6.3f'),str2);
        comando=strvcat(comando,t);
    end
end
save(filename, 'comando', '-append')
    

