y_new = zeros(1500,10);
a_test = test * w1;
z_test = tanh(a_test);
for i=1:1500
	y_new(i,:) = z_test(i,:) * w2;
	y_new(i,:) = exp(y_new(i,:));
	soft_max_test = sum(y_new(i,:));
	y_new(i,:) = y(i,:) / soft_max_test;
end
res_test=zeros(1500,10);
for m = 1:10
    i = (m-1) * 150 + 1;
    j = m * 150;
    res_test(i:j,m) = 1;
end
res_test;
res_test_new = zeros(1500,10);    
[max_val,max_pos] = max(y_new,[],2);
for i=1:1500
    for j=1:10
        if (max_pos(i) == j)
            res_test_new(i,j) = 1;
        else
            res_test_new(i,j) = 0;
        end
            
    end
end

count = 0;

for i = 1:1500
    for j = 1:10
        if res_test_new(i,j) == 1 && res_test(i,j) == 1
			count = count + 1;
			break;
        end
    end
end
