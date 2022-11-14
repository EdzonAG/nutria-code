%%% METODO DEL DESCENSO CON MAXIMA PENDIENTE APLICANDO LA %%%
%%% CONDICION DE ARMIJO %%%

% Calcula el punto minimo de la funcion a partir de obtener la direccion de descenso que lleva al
% maximo decremento de la funcion objetivo.
% La condicion de Armijo se asegura que el tamaño de paso para hallar la
% direccion sea suficientemente bueno

% Ingresar la funcion como funcion anonima ( @(x) x(1)^2+x(2)^2    ->   x^2 + y^2  )
% Ingresa el punto inicial (x_0), el vector  ( [2 3] )


clear;
clc;

%Se trabaja con una variable simbolica para poder hallar la raiz
syms a

%Se ingresan la funciones como funciones anonima en terminos de una sola variable, cambiando 
% el indice (entre paréntesis)
f=input('Ingrese la función:  ');

%x_0 es un vector, se ingresa entre corchetes.
x0=input('Ingresa el punto x_0:   ');

%Error para la condición de paro
e=input('Ingresa el error:   ');


%Contador
    count=0;


%Ciclo while para repetir mientras x~=0
while norm(Gradiente(f,x0))>=e
%Calcular el gradiente
    grad=Gradiente(f,x0);

%Intervalo de alpha:
    intervalo_alpha = f(x0+((-grad).*a));

%Calculo de alpha:
    % double para pasar la variable de simbólica a numérica
    varwhatever=double(solve(intervalo_alpha,a));
    % real para tomar la parte real de esa variable, (1) para considerar la
    % primer entrada
    alpha=double(real(varwhatever(1)));

%Nuevo punto
    xnew=x0-(grad.*alpha);

    % CONDICION DE ARMIJO %
    c=1E-4;
        % Ciclo while para que el proceso se repita hasta obtener un buen alpha
    while cond
        %Condicion para asegurar que el ciclo se inicie
        xnew=x0-(grad.*alpha);
        if  f(xnew)<=f(x0)+(c*alpha*Gradiente(f,x0)'*grad)
            alpha=alpha;
            cond=false;
        else
            alpha=alpha*0.5;
            cond=true;
        end %if
    end %while
    

%Reasignar para calcular
    x0=xnew;

%Aumento del contador
count=count+1;
fprintf('%d\n', count);

end %while x~=0 / abs(Gradiente(f,x0))>e
fprintf('[%d,%d]',xnew);


%%% FUNCIONES %%%
    %%% GRADIENTE %%%
function r = Gradiente(f,v)
  h = 0.001; 
  n = length(v); %Tamaño del vector v, # de variables de la función ingresada
  r = zeros(1,n); %Creamos una matriz 1 x n, que en un principio solo tendra 0 como entradas, 
                  % esta matriz será la que nos devolvera el programa como resultado 
  a = h* eye(n); %Está matriz nos ayudara para que solo haya variación en la variable 
                 % correspondiente y no modifique las demás  
  
  var=1; %Representa la variable con la que se trabajara x(1), x(2), ..., x(n)
  for var= 1:n
    r(1,var) = (1/(2*h))*(f(v + a(var,:)) - f(v - a(var,:))); 
    %r(1,var) es cada una de las entradas del vector que vamos a devolver como resultado
    %Esta igualado a la formula centrada de tres puntos para aproximarse a la derivada evaluada en 
    % el punto dado, modificada ya que es una función de varias variables
  end
  %fprintf('\n Vector gradiente evaluado en el punto dado es: %4.6f',r);
end