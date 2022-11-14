function y = f(x)
    global fcalls
    y = 8*x(1)^2+4*x(1)*x(2)+5*x(2)^2;
    fcalls = fcalls + 1;
end