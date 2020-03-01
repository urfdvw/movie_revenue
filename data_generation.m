function [ x,t,x2,t2 ] = data_generation(  )
% Generation of training data and test data
% input: void
% output: [ x,t,x2,t2 ]
% training data : x & t
% test data : x2 & t2

load Class_data.mat;% load the given data
[N,M]=size(Tr);% get the number of entries in the data
M=M-1;% the number of inputs
% Shuffling:
% this part change the order of the given entries at every simulation
cup=0*Tr(1,:);
for time=1:5000;
    a=round(rand(1,1)*(N-1)+1);
    b=round(rand(1,1)*(N-1)+1);
    cup=Tr(a,:);
    Tr(a,:)=Tr(b,:);
    Tr(b,:)=cup;
end
% end Shuffling part

Ntr=round((size(Tr(:,1))/(size(New(:,1))+size(Tr(:,1))))*N);% Ntr is the number of entries that is used in training
% divid Tr in to training data and test data
x=Tr(1:Ntr,2:M+1);
x2=Tr(Ntr+1:N,2:M+1);
t=Tr(1:Ntr,1);
t2=Tr(Ntr+1:N,1);
end

