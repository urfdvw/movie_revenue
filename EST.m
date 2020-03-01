function [ y,y2 ] = EST( x,t,x2 )
% method: nearity weighted method
% input ( x,t,x2 )
% output [ y,y2 ]
[x,x2]=normalization(x,x2);

y2=0*x2(:,1);
for i=1:size(x2,1)
    clear l
    k=Ker(x,x2(i,:));
    k=k/sum(k);
    y2(i)=k'*t;
end
y=t;
end

