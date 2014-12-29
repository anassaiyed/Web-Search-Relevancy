act_new=test*w_new;
y_new=zeros(1500,10);
exp_act_new=exp(act_new);
sum_act_new=sum(exp_act_new,2);

for m=1:1500
    for n=1:10
        y_new(m,n)=exp_act_new(m,n)./sum_act_new(m);
    end
end

res_new=zeros(1500,10);

[max_val,max_pos]=max(y_new,[],2);
for i=1:1500
    for j=1:10
        if (max_pos(i)==j)
            res_new(i,j)=1;
        else
            res_new(i,j)=0;
        end
            
    end
end
res_new;

ct=0;
for i=1:1500
    for j=1:10
        if res_new(i,j)==1 && res_test(i,j)==1
            ct=ct+1;
            break;
        end
    end
end

ct