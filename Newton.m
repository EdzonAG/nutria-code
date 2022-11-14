function L= Newton(fun,P,error)
%Método para hallar raíces
%x_(n+1)=x_n-(f(x_n)/f'(x_n))
%Ingresar la funcion como string

format long;
h=0.01;

%Transforma la funcion de un string a una funcion
%Hace que exista una funcion f
eval(sprintf('f=@(x) %s;', fun))

%Derivada numerica de la funcion
df = (f(P+h)-f(P-h))/(2*h);

%Evaluar la funcion
fev=f(P);

%contador
cont=1;

while fev>error
    fev=f(P);
    dfev = (f(P+h)-f(P-h))/(2*h);
    PN=P-(fev/dfev);
    fprintf('La iteración %d es %4.8f \n', cont,PN)
    P=PN;
    cont=cont+1;
end %while
end %function