function [ phix2 ] = phi_sel( x )
%% OK R2=0.669
phix=x;
x=[x x(:,1)*0+1];
M=size(x,2);

for i=1:M-2
    for j=i:M-1
        for k=j:M
            x1=x(:,i).*x(:,j).*x(:,k);
            phix=[phix x1];
        end
    end
end
% phix2=phix;
phix2=[phix(:,1:2) phix(:,4) phix(:,6) phix(:,8:13) phix(:,15:22) ];
phix2=[phix2 phix(:,24) phix(:,26:27) phix(:,29) phix(:,32) phix(:,34:41) ];
phix2=[phix2 phix(:,43) phix(:,46:47) phix(:,49:52) phix(:,56:57) phix(:,60:67) ];
phix2=[phix2 phix(:,76:77) phix(:,81) phix(:,90) phix(:,94:95) phix(:,98) ];
phix2=[phix2 phix(:,105:106) phix(:,110) phix(:,112) ];

phix2(:,59)=[];
phix2(:,57)=[];
phix2(:,49:51)=[];
phix2(:,47)=[];
phix2(:,43:44)=[];
phix2(:,27)=[];
phix2(:,19)=[];
phix2(:,16)=[];
phix2(:,8)=[];

phix2(:,4)=[];

phix2(:,46)=[];
phix2(:,45)=[];
phix2(:,40)=[];

phix2(:,8)=[];

end

