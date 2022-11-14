%Hallar la primera y segunda derivada de un polinomio dado mediante
%el método de diferencias divididas

%Limpiar pantalla y el workspace para empezar
clc;
clear;

%Valores dados
x0 = 7;
%Punto inicial
y0 = 2;
h = 0.01;  %Incremento

fprintf('\nEl valor en el que se evaluará es  x0=%d \n',x0);
fprintf('El valor del incremento es h=%2.4f \n\n',h);

%Polinomio: 3x^3 + 4x^2 + 2x
p = [3 4 2 0];

%Primera derivada: [f(x0+h)-f(x0-h)]/(2h)
primera_derivada = (polyval(p,(x0+h))-polyval(p,(x0-h)))/(2*h);
fprintf('La primera derivada es: %4.4f\n',primera_derivada);