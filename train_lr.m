load('data.mat');
calc_res=0;
alpha=0.002;
y=tr*w_str;
y=exp(y);
s=sum(y,2);
for i=1:19978,
    y(i,:)=y(i,:)/s(i);
end
error=-sum(sum(res.*log(y)));
error=error;
e_old=inf;
e_new=error;
w_new=w_str;

i=1;
while i<60
    w_str=w_new;
    grad=tr'*tr*w_str-tr'*res;
    del_err=tr'*(y-res);
    step=0.03/max(max(del_err));
    w_new=w_str-(step*del_err);
    activation=tr*w_new;
    y=zeros(19978,10);
    exp_act=exp(activation);
    sum_activation=sum(exp_act,2);
    for m=1:19978
        for n=1:10
            y(m,n)=exp_act(m,n)./sum_activation(m);
        end
    end
    e_old=e_new;
    e_new=-1*sum(sum(res.*log(y)));
    e(i,1)=e_new;
    i=i+1;
end

test_lr;

