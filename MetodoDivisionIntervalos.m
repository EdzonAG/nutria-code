format long
clc;
clear;

a = input('Limite inferior: ');
b = input('Limite superior: ');
e = input('Tolerancia: ');

fprintf('Función f(x)= ');
ftemp = input('','s');

eval(sprintf('f = @(x) %s;',ftemp))

L = b - a;
xm = (a+b)/2;

count = 1;

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
    L = b - a;
    fprintf('Iteracion %d:  Intervalo: (%f, %f)  Valor:  %f\n',count,a,b,xm);
    disp(L);
    count = count +1;
end