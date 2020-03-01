function [ x,x2 ] = normalization( x,x2 )
% scalling the data to [0,1] according to the maximum
% normalize x and x2 according to x
% Normalization cannot improve the performance of prediction, but ca solve
% the problem of 'badly scaled matrix'

M=size(x,2);
max_x=max(x);
for m=1:M
    x(:,m)=x(:,m)/max_x(m);
    x2(:,m)=x2(:,m)/max_x(m);
end

