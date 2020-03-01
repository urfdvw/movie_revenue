function [ y,y2 ] = method12( x,t,x2 )
% method: Gradient descent
% input ( x,t,x2 )
% output [ y,y2 ]

[x,x2]=pre_processing(t,x,x2);% Preprocessinf of input data
[x,x2]=normalization(x,x2);% normalization of input data

x=phi_sel( x );%Creat basis function matrix of training data
x2=phi_sel( x2 );%Creat basis function matrix of test data

tmax=max(t);
t=t/tmax;%normalization of the training target data

n=size(x,2);
wn(n,1)=0;%Predefination of the weight
e=0.0001;% 0.0001:The error boundary parfor stop criteria
dx=e/10;%Initialize the step parfor calculating the derivation
error_GD=e*10;%Initialization of the error of Gradient descent
n=1;%Record the number of iterations

while(error_GD>e)% This loop is the loop parfor Gradient descent
    up=1;%set the upper bound of Trisection
    low=-1;%set the lower bound of Trisection
	dir=df(x,t,wn,dx)/norm(df(x,t,wn,dx));%find the direction by the Gradient
%   dir=d2f(x,t,wn,dx)^(-1)*df(x,t,wn,dx);%find the direction by Newton
%   Method. However this is not a good chose because the length of setps is
%   much longer than Gradient descent.
    error_BC=e;%Initialization of the error of Trisection
    while(error_BC>e/10)% This loop is the loop parfor Trisection
        % Search the MIN along the direction by Trisection (Generalized Bisection)
        xu=up-(up-low)/3;% Set the upper section point of Trisection
        xl=low+(up-low)/3;% Set the lower section point of Trisection
        fxu=f(x,t,wn+dir*xu);% The value at the upper section point
        fxl=f(x,t,wn+dir*xl);% The value at the upper section point
        % Section:
        if(fxu==fxl)
            up=xu;
            low=xl;
        end
        if(fxu>fxl)
            up=xu;
        end
        if(fxu<fxl)
            low=xl;
        end
        n=n+1;%count the number of iterations
        error_BC=abs(fxu-fxl);% calculate the error of Trisection
    end
    wnp1=wn+dir*(xu+xl)/2;% acquire the result of Trisection
    error_GD=norm(f(x,t,wn)-f(x,t,wnp1));% calculate the error of descent
    dx=abs(0.01*error_GD);% Chang the accuracy of the derivation
    wn=wnp1;% Shift buffer
end
w=wnp1;% acquire the result of Gradient descent

y=x*w*tmax;% Predicting the training target(not very useful)
y2=x2*w*tmax;% Predicting the test target
% The coming 2 lines make sure the prediction is none-negative
y=y.*(y>0);
y2=y2.*(y2>0);
end

