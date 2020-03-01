function [ k ] = Ker( x,x_ )
% equivalent kernel function

%% kernel 1 reciprocal kernel
% % global power
% power=4;  %comment this line for parameter test
% k=x*0;
% for j=1:length(x)
%     k(j)=1./sum(abs((x(j,:)-x_))).^power;
% end

%% kernel 2 Gauss kernel (Better)
% global sigma
sigma=0.13; %comment this line for parameter test
k=x*0;
for j=1:length(x)
    k(j)=exp(-norm(x(j,:)-x_).^2./(2.*sigma.^2));
end

end

