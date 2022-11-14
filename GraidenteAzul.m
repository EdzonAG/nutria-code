%Ejecuta el programa e ingresa lo que se te pide

f = input('\n Ingresa tu función diferenciable f(x(1),x(2),x(3), ... ,f(n)):\n');
%Ingresa tu función de manera correcta para que Matlab la reconozca bien, iniciando con @(x) y llamando a las variables independientes como x(1), x(2), ..., x(n)

v = input('\n Ingresa el punto en el que sera evaluado tu función:\n');
%Ingresa el vector en forma de una matriz 1 x n 

MatONLT2(f,v); %Programa que calcula el vector gradiente de una función evaluado en un punto dado

function r = MatONLT2(f,v);
  h = 0.001; %Mientras más chico sea el valor de h, el resultado será más aproximado a las derivadas evaluadas en v 
  n = length(v); %Nos dará el tamaño del vector v, nos servira para saber de cuantas variables es la función ingresada
  r = zeros(1,n); %Creamos una matriz 1 x n, que en un principio solo tendra 0 como entradas, esta matriz será la que nos devolvera el programa como resultado 
  a = h* eye(n); %Está matriz nos ayudara para cuando se use la formula centrada de tres puntos solo haya variación en la variable correspondiente y no modifique las demás  
  
  k=1; %Representa la variable con la que se trabajara x(1), x(2), ..., x(n)
  for k= 1:n %Será el que controle respecto a que variable se está derivando
    r(1,k) = (1/(2*h))*(f(v + a(k,:)) - f(v - a(k,:))); 
    %r(1,k) es cada una de las entradas del vector que vamos a devolver como resultado
    %Esta igualado a la formula centrada de tres puntos para aproximarse a la derivada evaluada en el punto dado, modificada ya que es una función de varias variables
  end
  fprintf('\n Vector gradiente evaluado en el punto dado es\n');
  r %Resultado, vector gradiente evaluado en el punto dado
end