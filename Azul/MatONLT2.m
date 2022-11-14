function [r] = MatONLT2(f,v)
  h = 0.01; 
  n = length(v);
  r = zeros(1,n);
  a =h*eye(n);
  
  k=1;
  for k= 1:n
    r(1,k) = (1/(2*h))*(f(v(1,n) + a(n,:)) - f(v(1,n) - a(n,:)));
    k=k+1;
    r
  end
end