%Se ingresan la funciones como funciones anonima en terminos de una 
%sola variable, cambiando el indice (entre paréntesis)
f=input('Ingrese la función:  ');


%%%PRUEBA
%Obtener el numero de variables de la funcion
    %Extraer cada valor/variable
st = extractBetween(f,'(',')');
    %Convierte los strings en numeros
st = str2double(st);
    %Obtener el maximo de los numeros, para ver cuantas variables son
n = max(st);

%Intervalo de alpha:
intervalo_alpha=Fase_acotamiento_intervalo(f,zeros(1,n),0.005);