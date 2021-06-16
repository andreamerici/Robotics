% mentor_dir           Cinemática directa.
%
% Devuelve la matriz de transformación del primer sistema de coordenadas
% al último en función del vector q de los ángulos de las articulaciones
% del robot de acuerdo con el formato definido como el segundo parámetro.

function A05 = mentor_dir(q,formato)
%% 1 - Conversión de unidades en los ángulos de las articulaciones

a1=(255-128)/(105-0); % Calculamos a1 y b1
b1=128-a1*0;

a2=(155-20)/(0+90); % Calculamos a2 y b2
b2=20+a2*90;

a3=(255-128)/(115-0); % Calculamos a3 y b3
b3=128-a3*0;

a4=(255-128)/(160-0); % Calculamos a4 y b4
b4=128-a4*0;

a5=(255-128)/(160-0); % Calculamos a5 y b5
b5=128-a5*0;

%% Los datos se han introducido en grados

if formato == 'g'
    
 qg=q   % como los datos se han introducido en grados, qg=q
 
 qr=qg*pi/180   % muestra el valor de qr en el command window
 
 qw(1)=qg(1)*a1+b1;
 qw(2)=qg(2)*a2+b2;
 qw(3)=qg(3)*a3+b3;
 qw(4)=qg(4)*a4+b4;
 qw(5)=qg(5)*a5+b5;
 
 qw=round(qw)   % redondea y muestra el valor de qw en el command window
 
end

%% Los datos se han introducido en radianes

if formato == 'r'
 
 qr=q   % como los datos se han introducido en radianes, qr=q
 
 qg=qr*180/pi   % muestra el valor de qg en el command window
 
 qw(1)=qg(1)*a1+b1;
 qw(2)=qg(2)*a2+b2; 
 qw(3)=qg(3)*a3+b3;
 qw(4)=qg(4)*a4+b4; 
 qw(5)=qg(5)*a5+b5;
 
 qw=round(qw) % redondea y muestra el valor de qw en el command window
 
end

%% Los datos se han introducido en walli

if formato == 'w'

 qw=q   % como los datos se han introducido en walli, qw=q
 
 qg(1)=(1/a1)*qw(1)-(b1/a1);
 qg(2)=(1/a2)*qw(2)-(b2/a2);  
 qg(3)=(1/a3)*qw(3)-(b3/a3);   
 qg(4)=(1/a4)*qw(4)-(b4/a4);    
 qg(5)=(1/a5)*qw(5)-(b5/a5);
 
 qg    % muestra el valor de qg en el command window 
 
 qr=qg*pi/180   % muestra el valor de qr en el command window

end

%% 2 - Cálculo de las matrices A

% Parámetros Denavit-Hartenberg del robot
l1=185;
l2=165;
l3=150;
l4=195;

teta = [pi/2-qr(1)   pi/2+qr(2)     qr(3)   -pi/2+qr(4)     -pi/2+qr(5)];
d = [           l1            0         0             0              l4];
a = [            0           l2        l3             0               0];
alfa = [      pi/2            0         0         -pi/2               0];

% Matrices de transformación homogénea entre sistemas de coordenadas consecutivos
A01 = denavit(teta(1), d(1), a(1), alfa(1));
A12 = denavit(teta(2), d(2), a(2), alfa(2));
A23 = denavit(teta(3), d(3), a(3), alfa(3));
A34 = denavit(teta(4), d(4), a(4), alfa(4));
A45 = denavit(teta(5), d(5), a(5), alfa(5));

% Matriz de transformación del primer al último sistema de coordenadas
A05 = A01 * A12 * A23 * A34 * A45;