function [ y,y2 ] = method2( x,t,x2 )
% method: linear regration with preprocession and normalization
% input ( x,t,x2 )
% output [ y,y2 ]

[x,x2]=pre_processing(t,x,x2);
[x,x2]=normalization(x,x2);

x=[x(:,1)*0+1 x];
w=(x'*x)^(-1)*x'*t;
y=x*w;
x2=[x2(:,1)*0+1 x2];
y2=x2*w;

y=y.*(y>0);
y2=y2.*(y2>0);
end

