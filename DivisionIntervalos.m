format long
clc;
clear;
global fcalls

%Ingresar los limites y el numero de iteraciones
a = input('Limite inferior: ');
b = input('Limite superior: ');
e = input('Tolerancia: ');


    tic;

%Calcular la longitud del intervalo y el numero de iteraciones
L = abs(b - a);
xm = (a+b)/2;

fcalls = 0;
iter = 1;

%Ciclo para repetir mientras no se alcance la precision
while L>e
    x1 = a + L/4;
    x2 = b - L/4;
    if f(x1) < f(xm)
        b = xm;
        xm = x1;
    elseif f(x2) < f(xm)
        a = xm;
        xm = x2;
    else
        a = x1;
        b = x2;
    end
    %Nueva distancia
    L = abs(b - a);
    fprintf('Iteracion %d:  Intervalo: (%f, %f)  Valor:  %f\n',iter,a,b,xm);
    disp(L);
        iter = iter +1;
end

valor_optimo=(a+b)/2;
evaluacion=f(valor_optimo);

fprintf(['Valor optimo: %4.7f \n ' ...
    'Funcion evaluada en el valor optimo: %4.8f\n'], valor_optimo, evaluacion);
fprintf('Número de llamadas a la función: %d\n',fcalls);
    toc;

function y = f(x)
    global fcalls
    y = 0.5*x^2-sin(x);
    fcalls = fcalls + 1;
end