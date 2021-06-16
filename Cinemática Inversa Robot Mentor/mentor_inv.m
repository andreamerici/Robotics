% mentor_inv        cinem�tica inversa
%
% Devuelve el vector de coordenadas articulares correspondiente a la soluci�n cinem�tica inversa de la mano
% del manipulador en la posici�n y orientaci�n expresadas en la matriz T.
% codo = 'a' indica codo del robot arriba, es decir, que la articulaci�n 3 se
% sit�a por encima de la articulaci�n 2, mientras que codo = 'b' indica codo
% abajo, es decir que la articulaci�n 2 se sit�a por encima de la 3.
% formato = los angulos de las articulaciones se devuelven en: 'r'
% radianes, 'g' grados o 'w' walli.

function q = mentor_inv(T,codo,formato)
%% 1 - Datos geom�tricos y par�metros D-H

l1=185;
l2=165;
l3=150;
l4=195;

% Par�metros Denavit-Hartenberg del robot
tita_off_DH = [pi/2    pi/2    0    -pi/2   -pi/2];
d_DH =        [  l1       0    0        0      l4];
a_DH =        [   0      l2   l3        0       0];
alfa_DH =     [pi/2       0    0    -pi/2       0];

%% 2 - Determinaci�n de las coordenadas de la mu�eca del robot

% Posici�n de la mu�eca del manipulador
p = T(1:3,4)-l4*T(1:3,3); 
% El punto de la mu�eca es el punto del extremo del robot menos l4 por el vector director del eje z del extremo del robot

px=p(1);
py=p(2);
pz=p(3);

%% 3 - Cinem�tica inversa de las tres primeras articulaciones

% Soluci�n de la primera articulaci�n: q1
q1 = atan2(px,py);

% Se calcula el valor absoluto de q3
q3 = acos(((px)^2 + (py)^2 + (pz-l1)^2 - (l2)^2 - (l3)^2)/(2*l2*l3));

% en funci�n de si el codo est� arriba o abajo ponerle el signo a q3
if codo == 'a'      % Codo arriba
    q3 = -abs(q3);
else                % Codo abajo
    q3 = abs(q3);
end

% Se calculan los valores absolutos de alfa y beta
alfa = abs(atan((l3*sin(q3))/(l2 + l3*cos(q3))));
beta = abs(atan((pz - l1)/(sqrt((px)^2 + (py)^2))));

% Con los valores absolutos de alfa y beta y teniendo en cuenta si el
% codo est� arriba o abajo y si pz<l1 o pz >li se calcula q2
if codo == 'a' && pz >= l1
    q2 = -(pi/2 - beta - alfa);
elseif codo == 'a' && pz < l1
    q2 = -(pi/2 + beta - alfa);
elseif codo == 'b' && pz >= l1
    q2 = -(pi/2 - beta + alfa);        
elseif codo == 'b' && pz < l1
    q2 = -(pi/2 + beta + alfa);        
end

%% 4 - Determinaci�n de las coordenadas de las dos �ltimas articulaciones

% C�lculo de la matriz de transformaci�n A03
A01 = denavit(tita_off_DH(1)-q1, d_DH(1), a_DH(1), alfa_DH(1));
A12 = denavit(tita_off_DH(2)+q2, d_DH(2), a_DH(2), alfa_DH(2));
A23 = denavit(tita_off_DH(3)+q3, d_DH(3), a_DH(3), alfa_DH(3));
A03 = A01 * A12 * A23;

R03=A03(1:3,1:3); % Matriz de rotaci�n de las tres primeras articulaciones

R=T(1:3,1:3); % Matriz de rotaci�n que se desea obtener
R_i=R03'*R; % Producto de la inversa de la matriz R03 y de R, es la base
            % para calcular las dos �ltimas ecuaciones de acuerdo con las ecuaciones
            % vistas en clase

q4 = asin(R_i(2,3));
q5 = -asin(R_i(3,2));

% Vector de coordenadas articulares
q = [q1 q2 q3 q4 q5];

%% 5 - Conversi�n de datos y salida de la funci�n

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


qr=q
 
qg=qr*180/pi   % muestra el valor de qg en el command window
 
qw(1)=qg(1)*a1+b1;
qw(2)=qg(2)*a2+b2; 
qw(3)=qg(3)*a3+b3;
qw(4)=qg(4)*a4+b4; 
qw(5)=qg(5)*a5+b5;
 
qw % muestra el valor de qw en el command window


if formato == 'g' % los datos se devuelven en grados
q=qg; % Se asigna la salida de la funci�n en grados
end

if formato == 'r' % los datos se devuelven en radianes
q=qr; % Se asigna la salida de la funci�n en radianes
end

if formato == 'w' % los datos se devuelven en walli
q=qw; % Se asigna la salida de la funci�n en walli
end