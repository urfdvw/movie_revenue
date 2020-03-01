function [ R2_,per,re_max ] = Performance( t,y )

R2_=R2(t,y);

Thr1=0;
Thr2=log10(2);
re=abs(log10(y./t));
re=sort(re);

No_all=length(re);
while(isnan(re(length(re))))
    re(length(re))=[];
end
while(re(length(re))==inf)
    re(length(re))=[];
end
while(re(1)==(-inf))
    re(1)=[];
end

re_max=max(re(length(re)),-re(1));

while(re(length(re))>Thr2)
    re(length(re))=[];
    if(isempty(re))
        break
    end
end
if(length(re))
    while(re(1)<Thr1)
        re(1)=[];
        if(isempty(re))
            break
        end
    end
end
No_after_error=length(re);

per=No_after_error/No_all;

end
% R2_=R2(t,y);
% 
% Thr1=0;
% Thr2=log10(2);
% re=abs(log10(y./t));
% re=sort(re);
% 
% No_all=length(re);
% while(isnan(re(length(re))))
%     re(length(re))=[];
% end
% while(re(length(re))==inf)
%     re(length(re))=[];
% end
% while(re(1)==(-inf))
%     re(1)=[];
% end
% 
% re_max=max(re(length(re)),-re(1));
% while(re(length(re))>Thr2)
%     re(length(re))=[];
% end
% while(re(1)<Thr1)
%     re(1)=[];
% end
% No_after_error=length(re);
% 
% per=No_after_error/No_all;