function [ y,y2 ] = method8( x,t,x2 )
% method: control group
% input ( x,t,x2 )
% output [ y,y2 ]
[x,x2]=pre_processing(t,x,x2);
[x,x2]=normalization(x,x2);
x=phi_sel( x );
x2=phi_sel( x2 );

tmax=max(t);
t=t/tmax;

beta=rand;
alpha=rand(size(x,2),1);

for i=1:50
    if(isnan((diag(alpha)+beta*x'*x)^(-1)))
        break
    end
    sigma=(diag(alpha)+beta*x'*x)^(-1);
    m=beta*sigma*x'*t;

    for i=1:length(alpha)
        gamma(i)=1-alpha(i)*sigma(i,i);
    end
    alpha_=alpha*0;
    for i=1:length(alpha)
        alpha_(i)=gamma(i)/(m(i)^2);
    end
    beta_=((norm(t-x*m)^2)/(size(x,1)-sum(gamma)))^(-1);
    alpha=alpha_;
    beta=beta_;
end

y=x*m*tmax;
y2=x2*m*tmax;
y=y.*(y>0);
y2=y2.*(y2>0);
end