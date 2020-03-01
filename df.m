function [ y ] = df(a,b, x,dx)
%first order derivitive of f
N=length(x);
y=0*x;
for i=1:N
    d=0*x;
    d(i)=dx;
    y(i)=(f(a,b,x+d)-(f(a,b,x)))/dx;
end
end

