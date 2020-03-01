function [ y ] = GAU( x,u,sigma)
%not normalized Gaussian function max=1
%GAU( x,u,sigma) Mean=u Var=sigma^2 
y=x*0;
[A,B]=size(x);
for a=1:A
    for b=1:B
        y(a,b)=exp(-(x(a,b)-u).^2./(2.*sigma.^2));
    end
end
end

