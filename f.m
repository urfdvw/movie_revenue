function [ y ] = f(x,t, w )
    %% l2 norm
%     y=norm(x*w-t,2);
    %% l1 norm
%     y=sum(abs(x*w-t));
    %% l4 norm
%     y=norm(x*w-t,4);
    %% linf norm
%     y=max(abs(x*w-t));
    %% log barrier
%     u=x*w-t;
%     N=length(t);
%     y=0;
%     a=1;
%     for i=1:N
%         if(abs(u(i))>=a)
%             continue;
%         else
%             y=y-a^2*log(1-(u(i)/a)^2);
%         end
%     end
    %% huber
% % y=sum(huber(x*w-t));% This function only work with CVX tool box
% % Use the function below instead when running on virtual sinc site
r=x*w-t;
y=sum((abs(r).^2.*(abs(r)<=1))+((2*abs(r)-1).*(abs(r)>1)));
% y=sum(((r.*r).*(abs(r)<=1))+((2*abs(r)-1).*(abs(r)>1)));%same as above
    %% dead band
%     a=0.02;
%     r=x*w-t;
%     r=abs(r)-a;
%     r=r.*(r>0);
%     y=sum(r);
    %% l2 norm with restriction to y
%     y=norm(x*w-t,2)-1*sum((x*w).*((x*w)<0));

end

