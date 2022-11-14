%%% METODO DEL DESCENSO CON MAXIMA PENDIENTE %%%

% Calcula el punto minimo de la funcion a partir de obtener la direccion de descenso que lleva al
% maximo decremento de la funcion objetivo

%Calculo del tamaño de paso: Division de intervalos

% Ingresar la funcion como funcion anonima ( @(x) x(1)^2+x(2)^2    ->   x^2 + y^2  )
% Ingresa el punto inicial (x_0), el vector  ( [2 3] )
%--------------------------------------------------------------------------------------------------
%   Definición:

%   f    = función objetivo
%   x0   = punto inicial
%   eps1 = tolerancia para la condición de paro,|(g(x)| < eps1
%   x,fx = punto final y su evaluación bajo f.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [x1,fx1,iter]=Steepest_Descent_Division(f,x0,eps1)
  global itern
  inf = input('Limite Inferior: ');
  sup = input('Limite Superior: ');
  iter = 0;
  h    = 0.001; % parámetro para las diferencias finitas
  fx0  = f(x0)
  gx0  = Gradiente(f,x0) %Calculo del gradiente
  eps2 = eps1; %Precision para el método de Newton
 
  while  norm(gx0) > eps1    
    nu     = -gx0               % Dirección de descenso.
    f_nu  = @(x) f(x0+x*nu)    % Composición de la funcion 
    fp_nu = @(x) DifFin1(f_nu,x,h)  %Se construye la derivada para sacarle su raíz
    alpha = DivisionInt(fp_nu,inf,sup) %Estimacion del tamaño de paso
    x1    = x0 + alpha*nu;
    fx1   = f(x1);
    x0    = x1;
    fx0   = fx1;
    gx0   = Gradiente(f,x0);
    iter  = iter + 1;
  end  %while
  fprintf('x^*: [%f,%f] \n f(x^*) : %f\n', x1(1),x1(2), fx1);
  fprintf('Iteraciones: %f\nIteraciones alpha: %f\nLlamadas a la funcion:',iter,itern);
end  %function 

% Método de Division de Intervalos  
%-------------------------------------------
function v = DivisionInt(f,A,B)
global itern

%DIVISION DE INTERVALOS
%Calcular la longitud del intervalo y el numero de iteraciones
L = abs(B-A);
xm = (A+B)/2;

itern = 0;

%Ciclo para repetir mientras no se alcance la precision
while L>1E-3
    itern = itern + 1;
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
    %Nueva distancia
    L = abs(B - A);
end

v=0.5*L;

end %function

% Aproximación de la derivada f' mediante Diferencias Finitas
%-------------------------------------------
function df = DifFin1(f,x,h)
  df=(f(x+h/2)-f(x-h/2))/h;
end

% Calculo del gradiente
%-------------------------------------------
function r = Gradiente(f,v)
  h = 1E-8; %Mientras más chico sea el valor de h, el resultado será más aproximado a las derivadas evaluadas en v 
  n = length(v); %Nos dará el tamaño del vector v, nos servira para saber de cuantas variables es la función ingresada
  r = zeros(1,n); %Creamos una matriz 1 x n, que en un principio solo tendra 0 como entradas, esta matriz será la que nos devolvera el programa como resultado 
  a = h* eye(n); %Está matriz nos ayudara para cuando se use la formula centrada de tres puntos solo haya variación en la variable correspondiente y no modifique las demás  
  
  k=1; %Representa la variable con la que se trabajara x(1), x(2), ..., x(n)
  for k= 1:n %Será el que controle respecto a que variable se está derivando
    r(1,k) = (1/(2*h))*(f(v + a(k,:)) - f(v - a(k,:))); 
    %r(1,k) es cada una de las entradas del vector que vamos a devolver como resultado
    %Esta igualado a la formula centrada de tres puntos para aproximarse a la derivada evaluada en el punto dado, modificada ya que es una función de varias variables
  end
end