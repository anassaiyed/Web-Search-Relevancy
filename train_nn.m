load('data.mat');
w1=rand(513,350);
y=zeros(19978,10);
i=1;
w2=rand(350,10);
pc2=0;pc1=0;
while (i<50)
    a=tr*w1;
    z=tanh(a);
    for i=1:19978
            y(i,:)=z(i,:)*w2;
            y(i,:)=exp(y(i,:));
            soft_max=sum(y(i,:));
            y(i,:)=y(i,:)/soft_max;
    end
    err=-1*sum(sum(res.*log(y)));
    d_v=(y-res);
    d_hor=(1-z.^2).*(w2*d_v')';
    dely_2=z'*d_v;
    dely_1=tr'*d_hor;
    step_2=0.05/max(max(dely_2));
    step_1=0.001/max(max(dely_1));
    w2=w2-step_2.*(dely_2)+0.5*pc2;
    w1=w1-step_1.*(dely_1)+0.5*pc1;
    pc2=step_2.*(z'*d_v);
    pc1=step_1.*(tr'*d_hor);
    i=i+1;
end

test_nn