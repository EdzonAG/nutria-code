function xm = DivisionInt(f,x0)
    %ACOTAMIENTO DEL INTERVALO
   %Llamadas a la funcion funcalls
fcalls=0;

delta=1;

%Definir el signo de delta
if f(x0-abs(delta))>=f(x0) && f(x0)>=f(x0+abs(delta))
    delta=delta;
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

%DIVISION DE INTERVALOS
%Calcular la longitud del intervalo y el numero de iteraciones
L = abs(B-A);
xm = (A+B)/2;

fcalls = 0;
iter = 1;

%Ciclo para repetir mientras no se alcance la precision
while L>e
    x1 = A + L/4;
    x2 = B - L/4;
    if f(x1) < f(xm)
        B = xm;
        xm = x1;
    elseif f(x2) < f(xm)
        A = xm;
        xm = x2;
    else
        A = x1;
        B = x2;
    end
    
    xm
end

fprintf('Número de llamadas a la función: %d\n',fcalls);
end %function