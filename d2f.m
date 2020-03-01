function [ y ] = d2f(aa,bb, x,dx)
%second order derivitive of f
N=length(x);
y(N,N)=0;
for i=1:N
    for j=1:N
        d1=0*x;
        d1(i)=dx;
        d2=0*x;
        d2(j)=dx;
        a=(f(aa,bb,x+d1)-f(aa,bb,x))/dx;
        b=(f(aa,bb,x+d1-d2)-f(aa,bb,x-d2))/dx;
        y(i,j)=(a-b)/dx;
    end
end
end

