function [valor] = Fase_acotamiento_intervalo(f,x0,delta)
%FUNCION PARA CALCULAR LA FASE DE ACOTAMIENTO DEL INTERVALO
%Arroja un intervalo A,B donde se encuentra el óptimo
%La funcion se ingresa como funcion anonima

%Se establece la condicion "cond" para que, en caso de que no se [...]
% cumpla la suposicion de unimodalidad, no arroje un intervalo erroneo


%Llamadas a la funcion funcalls
fcalls=0;

%Definir el signo de delta
if f(x0-abs(delta))>=f(x0) && f(x0)>=f(x0+abs(delta))
    cond=true;

elseif f(x0-abs(delta))<=f(x0) && f(x0)<=f(x0+abs(delta))
    delta=-delta;
    cond=true;

elseif f(x0-abs(delta))>=f(x0) && f(x0)<=f(x0+abs(delta))
    A=x0-abs(delta);
    B=x0+abs(delta);
    fprintf('[%4.6f, %4.6f]', A,B);
    cond=true;

else
    disp('No se cumple la suposición de unimodalidad');
    cond=false;
end %if


xbef=x0;
k=0;
x=xbef+(2^k)*delta;
k=1;
xaft=x+(2^k)*delta;

countiter=0;

while cond
    while f(xaft)<f(x)
        A=x;
        k=k+1;
        x=xaft;
        xaft=x+(2^k)*delta;
        countiter=countiter+1;
    end %while
    B=xaft;
    cond=false;

    fprintf('El intervalo es: [%4.6f, %4.6f]\n',  A,B);
end %while condicion

fprintf('\nLlamadas a la funcion: %d\n', fcalls);
fprintf('Iteraciones: %d\n', countiter)
end %function