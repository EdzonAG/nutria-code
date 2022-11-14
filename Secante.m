function L=Secante(fun,a,b,error)
%x_n=x_(n-1)-((f(x_n-1)(x_n-2- x_n-1))/(f(x_n-2)-f(x_n-1))
%Ingresar la funcion como funcion anonima


%Evaluar funcion en el punto inicial
f1=fun(b);

%contador
cont=2;

while abs(f1)>error
    f1=fun(a);
    f2=fun(b);
    PN=b-((f2*(b-a))/(f2-f1));
    fprintf('P_%d : %4.6f , Error: %4.8f\n', cont,PN,abs(subs(fun,PN)));
    a=b;
    b=PN;
    cont=cont+1;
end %while
end %function