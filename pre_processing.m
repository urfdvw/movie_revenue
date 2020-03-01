function [ x_,x2 ] = pre_processing( t,x,x2 )
% pre processing of the input variables
% The main purpose of this function is to get rid of all the aspects in the
% data which dose not have numerical meaning. These aspects include the
% categorical input variables (x3 x6 x7), and the not given data in x5.
% There are also some other aspects in the input data which is not
% opsitively related to the target value which is also planned to be done
% in this function which includes the relationship between runtime and
% revenue.
Tr=[t,x];
N=length(Tr(:,1));
N2=size(x2,1);
%% x7
% For x3, x6 and x7, the goal of preprocessing is to replace the
% categorical inputs with continuout inputs which have numerical meaning. I
% say numerical means the numbers given in inputs can be compared by its
% value. For example, if I record 1 if I eat a hamburger but report 2 if I
% eat an apple, 1 and 2 are categorical inputs which can not be compared by
% the value 1 and 2, i.e. an apple is not twice a hamburger. However if I
% record 600 calorie if I eat a hamburger, and I record 150 calorie if I
% eat an apple, 600 and 150 has numerical meaning and can be compared: I
% can get almost the same amount of energy either I eat a hamburger or 4
% apples. 
% Same thing happends for movies. Instead of recording the category of a
% movie( month, type etc.), I would record the average revenue of movies of
% such a type.
x7_D=5;
x7(x7_D)=0;
x7n(x7_D)=0;
for i=1:N;
    for j=1:x7_D;
        if (Tr(i,8)==j-1);
            x7(j)=x7(j)+Tr(i,1);
            x7n(j)=x7n(j)+1;
        end
    end
end
x7=x7./x7n;
for i=1:N;
    for j=1:x7_D;
        if (Tr(i,8)==j-1);
            Tr(i,8)=x7(j);
        end
    end
end
for i=1:N2;
    for j=1:x7_D;
        if (x2(i,7)==j-1);
            x2(i,7)=x7(j);
        end
    end
end

%% x6
x6_D=12;
x6(x6_D)=0;
x6n(x6_D)=0;
for i=1:N;
    for j=1:x6_D;
        if (Tr(i,7)==j-1);
            x6(j)=x6(j)+Tr(i,1);
            x6n(j)=x6n(j)+1;
        end
    end
end
x6=x6./x6n;
for i=1:N;
    for j=1:x6_D;
        if (Tr(i,7)==j-1);
            Tr(i,7)=x6(j);
        end
    end
end
for i=1:N2;
    for j=1:x6_D;
        if (x2(i,6)==j-1);
            x2(i,6)=x6(j);
        end
    end
end

%% x3
x3_D=12;
x3(x3_D)=0;
x3n(x3_D)=0;
for i=1:N;
    for j=1:x3_D;
        if (Tr(i,4)==j);
            x3(j)=x3(j)+Tr(i,1);
            x3n(j)=x3n(j)+1;
        end
    end
end
x3=x3./x3n;
for i=1:N;
    for j=1:x3_D;
        if (Tr(i,4)==j);
            Tr(i,4)=x3(j);
        end
    end
end
for i=1:N2;
    for j=1:x3_D;
        if (x2(i,3)==j);
            x2(i,3)=x3(j);
        end
    end
end

%% x5
% For some missing information in an input, which is the runtime of a
% movie, I have two ways of dealing with.
% Firstly, if I am asked how long is a movie but I really need to guess, I
% would guess it is about 2 hours and I would be right most of the time.
% This intuition can be changed to the first method below. I would first
% calculate the average runtime of the movies, whenever the runtime is not
% given, I would say it has average runtime.
% But this kind of method might cause problem, because some kind of movie
% might be tybically longer than the other kinds. As most of the runtime is
% given leaving seval not given, we can estimate the not given one
% according to the given ones. The process is exactlly the same as the
% process we are going to use to estimate the revenue. The train dataset
% use the the entries which have the information of runtime, and we
% use x1~x4,x6,x7 as input and x5 as target. Then the rest as new data, and
% the input data is still x1~x4,x6,x7 of these entries.

%% x5 mean

% x5=0;
% x5n=0;
% for i=1:N
%     if(Tr(i,6)~=(-1))
%         x5=x5+Tr(i,6);
%         x5n=x5n+1;
%     end
% end
% x5=x5/x5n;
% for i=1:N
%     if(Tr(i,6)==(-1))
%         Tr(i,6)=x5;
%     end
% end
% for i=1:N2
%     if (x2(i,5)==(-1))
%         x2(i,5)=x5;
%     end
% end

%% X5 estimation
Tr_=Tr;
Tr(:,1)=[];
x5_1=Tr(1,:)*0;
x5=Tr(1,:)*0;
for i=1:N
    if(Tr(i,5)~=(-1))
        x5=[x5 ; Tr(i,:)];
    else
        x5_1=[x5_1 ; Tr(i,:)];
    end
end
for i=1:N2
    if(x2(i,5)~=(-1))
        x5=[x5 ; x2(i,:)];
    else
        x5_1=[x5_1 ; x2(i,:)];
    end
end
x5(1,:)=[];
x5_1(1,:)=[];
x=x5;
x(:,5)=[];
t=x5(:,5);
x2_=x5_1;
x2_(:,5)=[];


[ y,y2 ] = EST( x,t,x2_ );
k=1;
for i=1:N
    if(Tr(i,5)==(-1))
        Tr(i,5)=y2(k);
        k=k+1;
    end
end
for i=1:N2
    if(x2(i,5)==(-1))
        x2(i,5)=y2(k);
        k=k+1;
    end
end
clear x t x2_ y2 y k
Tr=[Tr_(:,1) Tr];

%% conclution
x_=Tr(:,2:8);


end

