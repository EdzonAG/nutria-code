function L=Biseccion(fun,a,b,error)
%p_n=1/2 (a_n +b_n)
%p_n aprox 0
%La funcion debe ser ingresada como texto

format long;
syms x;

%Funcion Simbolica
f=str2sym(fun);

%A & B son las evaluaciones de la funcion f en a&b
A=subs(f,a);
B=subs(f,b);


if (A==0)
    fprintf('Tu raiz está en %4.2f',a);
elseif (B==0)
    fprintf('Tu raiz está en %4.2f',b);
elseif (sign(A)==sign(B))
    %El metodo es aplicable solo si el signo de las funciones es distinto
    disp('Este metodo no es aplicable para esta funcion');
else
    %f evaluada en el punto medio del intervalo
    fev=subs(f,(0.5*(a+b)));
    contador=1;
    
    while (abs(fev)>error)
    PN=0.5*(a+b);
    fev=subs(f,PN);
    if (sign(fev)==sign(A))
        a=PN;
    elseif (sign(fev)==sign(B))
        b=PN;
    end % if 
    fprintf('Iteración %d: %4.6f Error:%2.8f  \n', contador,PN,abs(fev));
    contador=contador+1;
    end %while (abs(fev)>error)

end %if

end %function