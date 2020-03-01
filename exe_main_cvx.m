clear
close all
clc

%% Initial set and data generation
% % comment this part after the first run
% T=200;
% parfor times=1:T
%     [xh(:,:,times),th(:,times),x2h(:,:,times),t2h(:,times)] = data_generation();
% end
% Method=0;
% save data.mat

%% start from here to use different methods but the same data
load data.mat
%% 02 linear regession with preprocessing and normalization
% Method=Method+1;
% parfor times=1:T
%     x=xh(:,:,times);
%     t=th(:,times);
%     x2=x2h(:,:,times);
%     t2=t2h(:,times);
%     [ y,y2] = method2( x,t,x2 );
%     [ R2(times),Per(times),Rmax(times) ] = Performance( t2,y2 );
% end
% R2m(Method)=mean(R2);
% Prem(Method)=mean(Per);
% Rmaxm(Method)=mean(Rmax);
%% 08 RVM to find Basis
% Method=Method+1;
% parfor times=1:T
%     x=xh(:,:,times);
%     t=th(:,times);
%     x2=x2h(:,:,times);
%     t2=t2h(:,times);
%     [ y,y2] = method8( x,t,x2 );
%     [ R2(times),Per(times),Rmax(times) ] = Performance( t2,y2 );
% end
% R2m(Method)=mean(R2);
% Prem(Method)=mean(Per);
% Rmaxm(Method)=mean(Rmax);
%% 09 linear regession with Basis
% Method=Method+1;
% parfor times=1:T
%     x=xh(:,:,times);
%     t=th(:,times);
%     x2=x2h(:,:,times);
%     t2=t2h(:,times);
%     [ y,y2] = method9( x,t,x2 );
%     [ R2(times),Pe(times),Rmax(times) ] = Performance( t2,y2 );
% end
% R2m(Method)=mean(R2);
% Prem(Method)=mean(Per);
% Rmaxm(Method)=mean(Rmax);
%% 12 Gradient descent
Method=Method+1;
parfor times=1:T
    x=xh(:,:,times);
    t=th(:,times);
    x2=x2h(:,:,times);
    t2=t2h(:,times);
    [ y,y2] = method12( x,t,x2 );
    [ R2(times),Per(times),Rmax(times) ] = Performance( t2,y2 )
    times% runtime indicator
end
R2m(Method)=mean(R2);
Prem(Method)=mean(Per);
Rmaxm(Method)=mean(Rmax);
%% Result display
R2m=R2m'
Prem=Prem'
Rmaxm=Rmaxm'
% save result.mat % uncomment this line if the simulation is on virtual
% % sinc site, in order to save the result if foced to log out when timeout.