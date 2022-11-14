%Generar 2 matrices 10x10 con numeros aleatorios 0-100 y sumarlas

%Limpiar pantalla y el workspace para empezar
clc;
clear;

%Generar ambas matrices
A = randi([0,100],[10,10]);
disp('La matriz A generada es: ');
disp(A);
B = randi([0,100],[10,10]);
disp('La matriz B generada es: ');
disp(B);

%Sumar las matrices
C=A+B;
disp('Al sumar las matrices se genera la matriz C, que es:');
disp(C);