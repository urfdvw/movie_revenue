function [ out ] = R2( t,th )
%Preformance of estimation
%t: the real target value
%th: the estimated target value

N=length(t);
Rr=1/N*sum((t-th).^2);
t_=sum(t)/N;
Rt=1/N*sum((t-t_).^2);

out=1-Rr/Rt;
end

