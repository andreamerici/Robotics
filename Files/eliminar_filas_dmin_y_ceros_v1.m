% Este programa en las zonas en las que z=0 (no toca el papel) sólo deja el
% primer y el último punto.
% A continuación en los puntos que tocan el papel deja sólo los puntos en
% los que la distancia con el punto siguiente es mayor que la distancia
% d_min.


filename='Andrea.mat';
load(filename, 'total')
total_bk=total;
[filas columnas]=size(total); % Se leen las filas y columnas del fichero


% Esta rutina donde hay varias filas consecutivas en la que la z es cero
% (no toca el papel), deja la primera y la última fila.
n=1;
while n<filas
    z1=total(n,4); % La cuarta columna es la que indica si se toca o no el papel
    z2=total(n+1,4);
    if (filas ==(n+1))
        z3=z2;
    else
        z3=total(n+2,4);
    end
    
    if (z1==0 & z2==0) % Si hay dos filas con Z=0, y la tercera no vale 
        %cero las deja las dos, en caso contrario elimina la del medio
        if (z3==0)
            total(n+1,:)=[];
            filas=filas-1;
        else
            n=n+1;
        end
    else 
        n=n+1;
    end
end



% rutina que elimina las filas en las que la distancia entre la fila
% actual y la siguiente sea menor que un valor. 

d_min=1.0; % Distancia mínima a dibujar

n=1;
while n<filas
    if (total(n,4)==0 || total(n+1,4)==0) % Si la fila actual o la siguiente
        %tienen z=0, no se tienen en cuenta a la hora de medir las distancias
        n=n+1;
    else
        x1=total(n,1);
        x2=total(n+1,1);
        y1=total(n,2);
        y2=total(n+1,2);
        d=sqrt((x2-x1)^2+(y2-y1)^2); % Calculo de la distancia con el punto siguiente
        if d<d_min % Si la distancia es menor que el valor seleccionado se elimina la fila
            total(n+1,:)=[];
            filas=filas-1;
        else % Si la distancia es mayor se pasa a la siguiente fila
            n=n+1;
        end
    end
end

total_tratado=total;
% Se añade la variable tratada al fichero original
save(filename, 'total_tratado', '-append')

% Se muestra el gráfico tal como se capturó de la tableta
subplot(211)
plot(total_bk(:,1),total_bk(:,2),'.-b')
title(['Original desde la tableta'])
hold on
for i=1:size(total_bk,1)
    if total_bk(i,4)==0,plot(total_bk(i,1),total_bk(i,2),'.r');end
end
hold off

% Se muestra el gráfico del fichero tratado
subplot(212)
plot(total_tratado(:,1),total_tratado(:,2),'.-b')
title(['Convertido con d > ',num2str(d_min),' mm'])
hold on
for i=1:size(total_tratado,1)
    if total_tratado(i,4)==0,plot(total_tratado(i,1),total_tratado(i,2),'.r');end
end