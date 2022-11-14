format long
clc;
clear;
global fcalls

%Ingresar los limites y el numero de iteraciones
a = input('Limite inferior: ');
b = input('Limite superior: ');
e = input('Tolerancia: ');


%tic-toe mide el tiempo de ejecucion de la parte del codigo
% Desde tic hasta toe
    %tic;

%Calcular la longitud del intervalo y el numero de iteraciones
L = abs(b-a);
n = 2*(L/e);

%Definir
deltax=(b-a)/n;
x1=a;
x2=x1+deltax;
x3=x2+deltax;
contador=1;
fcalls = 0;
l1 = L;

%Ciclo para iterar mientras el numero de veces solicitadas
while (l1 > e)
    if (f(x1)>=f(x2))&&(f(x2)<=f(x3))
        fprintf('El minimo se encuentra en el intervalo (%4.6f,%4.6f)\n',x1,x3);
        %Si se cumple esta condicion, no se ejecuta el resto del while
        break;
    else
        x1=x2;
        x2=x3;
        x3=x3+deltax;
            if x3>b
                fprintf('El optimo es %4.2f o %4.2f\n',a,b);
            %Si se cumple esta condicion, no se ejecuta el resto del while
            break;
            end
    end
    contador=contador+1;
    l1 = abs(x3-x1);
end

fprintf('Número de iteraciones: %d\n',contador);
valor_optimo=(x1+x3)/2;
evaluacion=f(valor_optimo);

fprintf(['Valor optimo: %4.6f \n ' ...
    'Funcion evaluada en el valor optimo: %4.6f'], valor_optimo, evaluacion);
  
fprintf('Número de llamadas a la función: %d\n',fcalls);
    %toc;

function y = f(x)
    global fcalls
    y = sin(x)/(1+x^2);
    fcalls = fcalls + 1;
end
