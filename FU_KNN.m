function out_put = FU_KNN(nt1)


label=[ones(1,50) ones(1,50)*2 ones(1,50)*3 ones(1,50)*4]; % ��
eigen=[nt1;label];

timer = 1;
for step = 1:10:50 % ��




    number_class = 1;
    place_data = 1:24; %�ƾڦ�m % ��
    place_label = 25;  %���Ҧ�m % ��
    % leng_data = 73;

    speed_num = 50; %�U��t���ƾڵ��� % ��
    data_length = 200; %�U��������ƪ��� % ��

    % eigen = [eigen(:,1:100) eigen(:,601:700) eigen(:,1201:1300) eigen(:,1901:2000)];

    eigen = [eigen(1:place_label-1,:); eigen(place_label,:)];  %���W��

    if step == 1
        train_series = [step+10:50];  %�U��t����C % ��
        test_series = [step:step+9];% ��
    elseif step == 81
        train_series = [1:step-1];  %�U��t����C
        test_series = [step:step+9];% ��
    else
        train_series = [1:step-1 step+10:50];  %�U��t����C % ��
        test_series = [step:step+9];% ��
    end





    %�V�m�δ��ն��s�@
    p = 1;
    q = 0;
    while p < data_length*number_class
        data_train(:,[1:length(train_series)]+q*length(train_series)) = ...
            [eigen(:,train_series+p-1)];
        data_test(:,[1:length(test_series)]+q*length(test_series)) =...
            [eigen(:,test_series+p-1)];
        p = p+speed_num;
        q = q+1;
    end


    %�V�m
    range_p = size(data_train,2);
    r = randperm(range_p);
    s = data_train(end,r);  %�ؼЭ�
    v = data_train(place_data,r);  %��J


    %����
    range_pp = size(data_test,2);
    % i = randperm(range_pp);
    i = [1:range_pp];
    ss = data_test(end,i);  %�ؼЭ�
    vv = data_test(place_data,i);  %��J



    k1 = 0;
    k2 = 0;
    k3 = 0;
    k4 = 0;

    [a, avalue] = knn_class(v,s,vv,3);


    for r = 1:range_pp
        if ss(r)==1 && a(r)==ss(r)
            k1 = k1+1;
        elseif ss(r)==2 && a(r)==ss(r)
            k2 = k2+1;
        elseif ss(r)==3 && a(r)==ss(r)
            k3 = k3+1;
        elseif ss(r)==4 && a(r)==ss(r)
            k4 = k4+1;
        end
    end
  
    outvalue(:,timer) = [k1; k2; k3; k4];
    timer = timer+1;
end


all_k = sum(outvalue,2)./5;
k1 = all_k(1);
k2 = all_k(2);
k3 = all_k(3);
k4 = all_k(4);

disp('knn�G')
fprintf('0�G%.2f%%\n',k1/10*number_class*100);
fprintf('1�G%.2f%%\n',k2/10*number_class*100);
fprintf('2�G%.2f%%\n',k3/10*number_class*100);
fprintf('3�G%.2f%%\n',k4/10*number_class*100);
fprintf('total�G%.2f%%\n',(k1+k2+k3+k4)/size(data_test,2)*100);

 out_put = (k1+k2+k3+k4)/size(data_test,2)*100;