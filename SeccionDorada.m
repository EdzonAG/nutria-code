clc;
clear;
global fcalls

%Ingresar los limites y el numero de iteraciones
a = input('Limite inferior: ');
b = input('Limite superior: ');
e = input('Tolerancia: ');

    tic;
%Definir
t = (-1+sqrt(5))/2;
L = b - a;
x1 = b - t*L;
x2 = a + t*L;
n = 1;
fcalls = 0;
fprintf('\n%d: [%d,%d], L = %d, x1 = %d, x2 = %d\nf(x1) = %d, f(x2) = %d\n',n,a,b,L,x1,x2,f(x1),f(x2))

%Ciclo para repetir mientras no se alcance la precision
while L>e
    if f(x1) < f(x2)
        b = x2;
        x2 = x1;
        L = b - a;
        x1 = b - t*L;
    else
        a = x1;
        x1 = x2;
        L = b - a;
        x2 = a + t*L;
    end
    n = n + 1;
    fprintf('\nIteracion %d: [%d,%d], L = %d, x1 = %d, x2 = %d\nf(x1) = %d, f(x2) = %d\n',n,a,b,L,x1,x2,f(x1),f(x2))
end

valor_optimo=(a+b)/2;
evaluacion=f(valor_optimo);

fprintf(['Valor optimo: %4.6f \n ' ...
    'Funcion evaluada en el valor optimo: %4.6f'], valor_optimo, evaluacion);

fprintf('\nLlamadas a la funcion: %d\n',fcalls)
    toc;
