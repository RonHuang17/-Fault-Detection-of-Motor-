function out_put = FU_BPNN(p)

n = 24;


lear = 0.0001; % 學習率


for i=1:1:24
   c(i,:) = normaliz(p(i,:)); % 範圍調整到0~1
end



for d = 1:1:50
    
    w1=rands(n,n);
    b1=rands(n,1);
    
    w2=rands(1,n);
    b2=rands(1,1);
    
    ss1 = zeros(1,400);
    ss2 = zeros(1,400);
    ee1 = zeros(1,400);
    ee2 = zeros(1,400);
    
    F1 = zeros(n,n);
 
    zo1 = [c(:,(1:25)+d-1) c(:,(101:125)+d-1) c(:,(201:225)+d-1) c(:,(301:325)+d-1)];
       
    
    f = randperm(100);
    
    
    for i = 1:1:100 
        
        p = zo1(:,f(i));
        if f(i)<=25
            t = 0;
        elseif f(i)>25 && f(i)<=50
            t = 0;
        elseif f(i)>50 && f(i)<=75
            t = 1;
        elseif f(i)>75 && f(i)<=100
            t = 1;    
        end
        
        
        for tim=1:1:250
            
            a1 = hardlim(w1*p+b1);

            a2 = satlin(w2*a1+b2);

            ss2(1,i)=a2;
            e2=t-a2;
            ee2(1,i) = e2*e2;
        %-----------------------------------------------------
            s2 = -1*1*e2;

            for j = 1:1:n
                F1(j,j) = a1(j,1)*(1-a1(j,1));
            end

            w2 = w2 - lear * s2 * a1';
            b2 = b2 - lear * s2;

            s1 = F1*w2'*s2;

            w1 = w1 - lear * s1 * p';
            b1 = b1 - lear * s1;
        end
        
    end
    
%     save('C:\Users\Michael\Desktop\發電機偏移\S轉換\辨識率\新增資料夾\w1','w1')
%     save('C:\Users\Michael\Desktop\發電機偏移\S轉換\辨識率\新增資料夾\w2','w2')
%     save('C:\Users\Michael\Desktop\發電機偏移\S轉換\辨識率\新增資料夾\b1','b1')
%     save('C:\Users\Michael\Desktop\發電機偏移\S轉換\辨識率\新增資料夾\b2','b2')
    
    
    ss1 = zeros(1,n);
    ss2 = zeros(1,n);
    ee2 = zeros(1,n);
    
    err1 = 0;
    err2 = 0;
    err3 = 0;
    err4 = 0;
    
    
    zo2 = [c(:,(1:50)+d-1) c(:,(101:150)+d-1) c(:,(201:250)+d-1) c(:,(301:350)+d-1)];
         for i=1:1:200 
        
        p = zo2(:,i);
        if i<=50
            t = 0;
        elseif i>50 && i<=100
            t = 0;
        elseif i>100 && i<=150
            t = 1;
        elseif i>150 && i<=200
            t = 1;            
        end
        
        a1 = hardlim(w1*p+b1);

        a2 = satlin(w2*a1+b2);

        ss2(1,i)=a2;

        e2=t-a2;
        ee2(1,i) = e2*e2 ;
    end
    
    
    
    
    
    for i = 1:1:200
        if i<=50 && ss2(1,i)<0.75 %&& ss2(2,i)<0.5 % (0,0)
            err1 = err1+1;
        elseif i>50 && i<=100 && ss2(1,i)<0.75 %&& ss2(2,i)>0.5 % (0,1)
            err2 = err2+1;
        elseif i>100 && i<=150 && ss2(1,i)>0.25 %&& ss2(2,i)>0.5 % (1,1)
            err3 = err3+1;   
        elseif i>150 && i<=200 && ss2(1,i)>0.25 %&& ss2(2,i)>0.5 % (1,1)
            err4 = err4+1;
        end
    end
    
    
    
    err = err1+err2+err3+err4;
    
    kind1 = err1/50;
    kind2 = err2/50;
    kind3 = err3/50;
    kind4 = err4/50;
    
    
    
    
    tota(1,d) = err/200; %200
    k1(1,d)=kind1;
    k2(1,d)=kind2;
    k3(1,d)=kind3;
    k4(1,d)=kind4;
end

dd = sum(tota)/d;
dd1 = sum(k1)/d;
dd2 = sum(k2)/d;
dd3 = sum(k3)/d;
dd4 = sum(k4)/d;

disp('bpnn：')
fprintf('0：%.2f%%\n',dd1*100);
fprintf('1：%.2f%%\n',dd2*100);
fprintf('2：%.2f%%\n',dd3*100);
fprintf('3：%.2f%%\n',dd4*100);
fprintf('total：%.2f%%\n',dd*100);

 out_put = dd;