clear
clc

load('Class_data.mat');
[ y,y_wang] = method12( Tr(:,2:8),Tr(:,1),New );
load('All_data.mat');
t=Y(2015:3014,1);
[ R2,Pre,Rmax ] = Performance( t,y_wang );
R2=R2'
Pre=Pre'
Rmax=Rmax'