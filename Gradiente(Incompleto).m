%Hallar el vactor gradiente aproximado numericamente
%Limpiar pantalla y el workspace para empezar
clc;
clear;

%Valores dados
x0 = 2;
y0=2;
h = 0.01;  %Incremento

fprintf('\nLos valores en los que se evaluará es  x0=%d, y0=%d\n',x0,y0);
fprintf('El valor del incremento es h=%2.4f \n\n',h);

%El usuario pone la función que quiere evaluar
fprintf('Para hallar derivadas parciales anote la funcion de la forma \n @(variables separadas por comas) (funcion a evaluar) \n');
f=input('Ingrese la funcion:  ');

%Para saber cuantas variables tiene la funcion
num_variables=nargin(f);
disp(num_variables);

%Ciclo for para que la derivada se repita para cada variable
for i=1:num_variables
    parcial_i=(feval(f,x0+h,y0)-feval(f,x0-h,y0))/(2*h);
end

%Derivada parcial de x
parcial_1 = (feval(f,x0+h,y0)-feval(f,x0-h,y0))/(2*h);
fprintf('\nLa derivada parcial respecto de x es:  %4.4f', parcial_1);

%Derivada parcial de y
parcial_2 = (feval(f,x0,y0+h)-feval(f,x0,y0-h))/(2*h);
fprintf('\nLa derivada parcial respecto de y es:  %4.4f', parcial_2);
