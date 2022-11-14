function [y] = FBusquedayIntervalos(x)
global fcalls
    y = x^4+x^3-7*x^2-x+6;
    fcalls = fcalls + 1;
end