function [ y,y2 ] = method9( x,t,x2 )
% method: linear regration with Basis
% input ( x,t,x2 )
% output [ y,y2 ]

[x,x2]=pre_processing(t,x,x2);
[x,x2]=normalization(x,x2);

x=phi_sel( x );
x2=phi_sel( x2 );

w=(x'*x)^(-1)*x'*t;

y=x*w;
y2=x2*w;
y=y.*(y>0);
y2=y2.*(y2>0);
end

