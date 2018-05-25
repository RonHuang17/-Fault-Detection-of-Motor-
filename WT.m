clc
clear

for j=1:50
m = load(['D:\馬達故障分析(Fault Detection of Motor)\Experiement_Results\Cut\0\x',num2str(j),'']);
%m = load(['D:\馬達故障分析(Fault Detection of Motor)\Experiement_Results\Cut\0525_300W_Generator_Oringinal_Current_Data_Cut_Tony\D0\x',num2str(j),'']);

m = awgn(m,0,'measured');
[c,l] = wavedec(m,5,'sym4');
a5 = wrcoef('a',c,l,'sym4',5);
d5 = wrcoef('d',c,l,'sym4',5);
d4 = wrcoef('d',c,l,'sym4',4);
d3 = wrcoef('d',c,l,'sym4',3);
d2 = wrcoef('d',c,l,'sym4',2);
d1 = wrcoef('d',c,l,'sym4',1);

f_a5=abs(fft(a5));
f_d5=abs(fft(d5));
f_d4=abs(fft(d4));
f_d3=abs(fft(d3));
f_d2=abs(fft(d2));
f_d1=abs(fft(d1));

[amp_a5_max,L_a5_max]=max(f_a5(1:1000));
[amp_d5_max,L_d5_max]=max(f_d5(1:1000));
[amp_d4_max,L_d4_max]=max(f_d4(1:1000));
[amp_d3_max,L_d3_max]=max(f_d3(1:1000));
[amp_d2_max,L_d2_max]=max(f_d2(1:1000));
[amp_d1_max,L_d1_max]=max(f_d1(1:1000));

N_feature_max(:,j) = [amp_a5_max;amp_d5_max;amp_d4_max;amp_d3_max;amp_d2_max;amp_d1_max;L_a5_max;L_d5_max;L_d4_max;L_d3_max;L_d2_max;L_d1_max];

f_a5(L_a5_max,1)=0;
f_d5(L_d5_max,1)=0;
f_d4(L_d4_max,1)=0;
f_d3(L_d3_max,1)=0;
f_d2(L_d2_max,1)=0;
f_d1(L_d1_max,1)=0;

[amp_a5_sec,L_a5_sec]=max(f_a5(1:1000));
[amp_d5_sec,L_d5_sec]=max(f_d5(1:1000));
[amp_d4_sec,L_d4_sec]=max(f_d4(1:1000));
[amp_d3_sec,L_d3_sec]=max(f_d3(1:1000));
[amp_d2_sec,L_d2_sec]=max(f_d2(1:1000));
[amp_d1_sec,L_d1_sec]=max(f_d1(1:1000));

N_feature_sec(:,j) = [amp_a5_sec;amp_d5_sec;amp_d4_sec;amp_d3_sec;amp_d2_sec;amp_d1_sec;L_a5_sec;L_d5_sec;L_d4_sec;L_d3_sec;L_d2_sec;L_d1_sec];

figure(1)
subplot(6,1,1);plot(m);title('原始訊號');
subplot(6,1,2);plot(d1);title('d1');
subplot(6,1,3);plot(d2);title('d2');
subplot(6,1,4);plot(d3);title('d3');
subplot(6,1,5);plot(d4);title('d4');
subplot(6,1,6);plot(d5);title('d5');



end


for j=1:50
%m = load(['D:\馬達故障分析(Fault Detection of Motor)\Experiement_Results\Cut\1\x',num2str(j),'']);
m = load(['D:\馬達故障分析(Fault Detection of Motor)\Experiement_Results\Cut\0525_300W_Generator_Oringinal_Current_Data_Cut_Tony\D1\x',num2str(j),'']);
m = awgn(m,0,'measured');
[c,l] = wavedec(m,5,'sym4');
a5 = wrcoef('a',c,l,'sym4',5);
d5 = wrcoef('d',c,l,'sym4',5);
d4 = wrcoef('d',c,l,'sym4',4);
d3 = wrcoef('d',c,l,'sym4',3);
d2 = wrcoef('d',c,l,'sym4',2);
d1 = wrcoef('d',c,l,'sym4',1);

f_a5=abs(fft(a5));
f_d5=abs(fft(d5));
f_d4=abs(fft(d4));
f_d3=abs(fft(d3));
f_d2=abs(fft(d2));
f_d1=abs(fft(d1));

[amp_a5_max,L_a5_max]=max(f_a5(1:1000));
[amp_d5_max,L_d5_max]=max(f_d5(1:1000));
[amp_d4_max,L_d4_max]=max(f_d4(1:1000));
[amp_d3_max,L_d3_max]=max(f_d3(1:1000));
[amp_d2_max,L_d2_max]=max(f_d2(1:1000));
[amp_d1_max,L_d1_max]=max(f_d1(1:1000));

D1_feature_max(:,j) = [amp_a5_max;amp_d5_max;amp_d4_max;amp_d3_max;amp_d2_max;amp_d1_max;L_a5_max;L_d5_max;L_d4_max;L_d3_max;L_d2_max;L_d1_max];

f_a5(L_a5_max,1)=0;
f_d5(L_d5_max,1)=0;
f_d4(L_d4_max,1)=0;
f_d3(L_d3_max,1)=0;
f_d2(L_d2_max,1)=0;
f_d1(L_d1_max,1)=0;

[amp_a5_sec,L_a5_sec]=max(f_a5(1:1000));
[amp_d5_sec,L_d5_sec]=max(f_d5(1:1000));
[amp_d4_sec,L_d4_sec]=max(f_d4(1:1000));
[amp_d3_sec,L_d3_sec]=max(f_d3(1:1000));
[amp_d2_sec,L_d2_sec]=max(f_d2(1:1000));
[amp_d1_sec,L_d1_sec]=max(f_d1(1:1000));

D1_feature_sec(:,j) = [amp_a5_sec;amp_d5_sec;amp_d4_sec;amp_d3_sec;amp_d2_sec;amp_d1_sec;L_a5_sec;L_d5_sec;L_d4_sec;L_d3_sec;L_d2_sec;L_d1_sec];

figure(2)
subplot(6,1,1);plot(m);title('原始訊號');
subplot(6,1,2);plot(d1);title('d1');
subplot(6,1,3);plot(d2);title('d2');
subplot(6,1,4);plot(d3);title('d3');
subplot(6,1,5);plot(d4);title('d4');
subplot(6,1,6);plot(d5);title('d5');
end


for j=1:50
%m = load(['D:\馬達故障分析(Fault Detection of Motor)\Experiement_Results\Cut\2\x',num2str(j),'']);
m = load(['D:\馬達故障分析(Fault Detection of Motor)\Experiement_Results\Cut\0525_300W_Generator_Oringinal_Current_Data_Cut_Tony\D2\x',num2str(j),'']);
m = awgn(m,0,'measured');
[c,l] = wavedec(m,5,'sym4');
a5 = wrcoef('a',c,l,'sym4',5);
d5 = wrcoef('d',c,l,'sym4',5);
d4 = wrcoef('d',c,l,'sym4',4);
d3 = wrcoef('d',c,l,'sym4',3);
d2 = wrcoef('d',c,l,'sym4',2);
d1 = wrcoef('d',c,l,'sym4',1);

f_a5=abs(fft(a5));
f_d5=abs(fft(d5));
f_d4=abs(fft(d4));
f_d3=abs(fft(d3));
f_d2=abs(fft(d2));
f_d1=abs(fft(d1));

[amp_a5_max,L_a5_max]=max(f_a5(1:1000));
[amp_d5_max,L_d5_max]=max(f_d5(1:1000));
[amp_d4_max,L_d4_max]=max(f_d4(1:1000));
[amp_d3_max,L_d3_max]=max(f_d3(1:1000));
[amp_d2_max,L_d2_max]=max(f_d2(1:1000));
[amp_d1_max,L_d1_max]=max(f_d1(1:1000));

D2_feature_max(:,j) = [amp_a5_max;amp_d5_max;amp_d4_max;amp_d3_max;amp_d2_max;amp_d1_max;L_a5_max;L_d5_max;L_d4_max;L_d3_max;L_d2_max;L_d1_max];

f_a5(L_a5_max,1)=0;
f_d5(L_d5_max,1)=0;
f_d4(L_d4_max,1)=0;
f_d3(L_d3_max,1)=0;
f_d2(L_d2_max,1)=0;
f_d1(L_d1_max,1)=0;

[amp_a5_sec,L_a5_sec]=max(f_a5(1:1000));
[amp_d5_sec,L_d5_sec]=max(f_d5(1:1000));
[amp_d4_sec,L_d4_sec]=max(f_d4(1:1000));
[amp_d3_sec,L_d3_sec]=max(f_d3(1:1000));
[amp_d2_sec,L_d2_sec]=max(f_d2(1:1000));
[amp_d1_sec,L_d1_sec]=max(f_d1(1:1000));

D2_feature_sec(:,j) = [amp_a5_sec;amp_d5_sec;amp_d4_sec;amp_d3_sec;amp_d2_sec;amp_d1_sec;L_a5_sec;L_d5_sec;L_d4_sec;L_d3_sec;L_d2_sec;L_d1_sec];
figure(3)
subplot(6,1,1);plot(m);title('原始訊號');
subplot(6,1,2);plot(d1);title('d1');
subplot(6,1,3);plot(d2);title('d2');
subplot(6,1,4);plot(d3);title('d3');
subplot(6,1,5);plot(d4);title('d4');
subplot(6,1,6);plot(d5);title('d5');
end

for j=1:50
%m = load(['D:\馬達故障分析(Fault Detection of Motor)\Experiement_Results\Cut\3\x',num2str(j),'']);
m = load(['D:\馬達故障分析(Fault Detection of Motor)\Experiement_Results\Cut\0525_300W_Generator_Oringinal_Current_Data_Cut_Tony\D3\x',num2str(j),'']);
m = awgn(m,0,'measured');
[c,l] = wavedec(m,5,'sym4');
a5 = wrcoef('a',c,l,'sym4',5);
d5 = wrcoef('d',c,l,'sym4',5);
d4 = wrcoef('d',c,l,'sym4',4);
d3 = wrcoef('d',c,l,'sym4',3);
d2 = wrcoef('d',c,l,'sym4',2);
d1 = wrcoef('d',c,l,'sym4',1);

f_a5=abs(fft(a5));
f_d5=abs(fft(d5));
f_d4=abs(fft(d4));
f_d3=abs(fft(d3));
f_d2=abs(fft(d2));
f_d1=abs(fft(d1));

[amp_a5_max,L_a5_max]=max(f_a5(1:1000));
[amp_d5_max,L_d5_max]=max(f_d5(1:1000));
[amp_d4_max,L_d4_max]=max(f_d4(1:1000));
[amp_d3_max,L_d3_max]=max(f_d3(1:1000));
[amp_d2_max,L_d2_max]=max(f_d2(1:1000));
[amp_d1_max,L_d1_max]=max(f_d1(1:1000));

D3_feature_max(:,j) = [amp_a5_max;amp_d5_max;amp_d4_max;amp_d3_max;amp_d2_max;amp_d1_max;L_a5_max;L_d5_max;L_d4_max;L_d3_max;L_d2_max;L_d1_max];

f_a5(L_a5_max,1)=0;
f_d5(L_d5_max,1)=0;
f_d4(L_d4_max,1)=0;
f_d3(L_d3_max,1)=0;
f_d2(L_d2_max,1)=0;
f_d1(L_d1_max,1)=0;

[amp_a5_sec,L_a5_sec]=max(f_a5(1:1000));
[amp_d5_sec,L_d5_sec]=max(f_d5(1:1000));
[amp_d4_sec,L_d4_sec]=max(f_d4(1:1000));
[amp_d3_sec,L_d3_sec]=max(f_d3(1:1000));
[amp_d2_sec,L_d2_sec]=max(f_d2(1:1000));
[amp_d1_sec,L_d1_sec]=max(f_d1(1:1000));

D3_feature_sec(:,j) = [amp_a5_sec;amp_d5_sec;amp_d4_sec;amp_d3_sec;amp_d2_sec;amp_d1_sec;L_a5_sec;L_d5_sec;L_d4_sec;L_d3_sec;L_d2_sec;L_d1_sec];
figure(4)
subplot(6,1,1);plot(m);title('原始訊號');
subplot(6,1,2);plot(d1);title('d1');
subplot(6,1,3);plot(d2);title('d2');
subplot(6,1,4);plot(d3);title('d3');
subplot(6,1,5);plot(d4);title('d4');
subplot(6,1,6);plot(d5);title('d5');
end


feature400 = [N_feature_max N_feature_max D1_feature_max D1_feature_max D2_feature_max D2_feature_max D3_feature_max D3_feature_max;N_feature_sec N_feature_sec D1_feature_sec D1_feature_sec D2_feature_sec D2_feature_sec D3_feature_sec D3_feature_sec];
feature200 = [N_feature_max D1_feature_max D2_feature_max D3_feature_max;N_feature_sec D1_feature_sec D2_feature_sec D3_feature_sec];


for i=1:1:24
    aaa(i,:) = normaliz(feature400(i,:)); % 範圍調整到0~1
end
for i=1:1:24
    aa(i,:) = normaliz(feature200(i,:)); % 範圍調整到0~1
end

%save(['D:\馬達故障分析(Fault Detection of Motor)\Experiement_Results\WaveletTransform\aaa.txt'],['aaa']);
%save(['D:\馬達故障分析(Fault Detection of Motor)\Experiement_Results\WaveletTransform\aa.txt'],['aa']);
% 
bpnn = FU_BPNN(aa);
save(['D:\馬達故障分析(Fault Detection of Motor)\Experiement_Results\WaveletTransform\BPNN\bpnn.txt'],['bpnn']);
%knn = FU_KNN(aa);
%save(['D:\馬達故障分析(Fault Detection of Motor)\Experiement_Results\WaveletTransform\KNN\knn.txt'],['knn']);
% figure(1)
% subplot(6,1,1);plot(m);title('原始訊號');
% subplot(6,1,2);plot(d1);title('d1');
% subplot(6,1,3);plot(d2);title('d2');
% subplot(6,1,4);plot(d3);title('d3');
% subplot(6,1,5);plot(d4);title('d4');
% subplot(6,1,6);plot(d5);title('d5');
%subplot(7,1,7);plot(a5);title('a5');
% save('C:\Users\admin\Desktop\發電機偏移NEW\Final\WT\nor\d0','m');
% save('C:\Users\admin\Desktop\發電機偏移NEW\Final\WT\nor\d1','d1');
% save('C:\Users\admin\Desktop\發電機偏移NEW\Final\WT\nor\d2','d2');
% save('C:\Users\admin\Desktop\發電機偏移NEW\Final\WT\nor\d3','d3');
% save('C:\Users\admin\Desktop\發電機偏移NEW\Final\WT\nor\d4','d4');
% save('C:\Users\admin\Desktop\發電機偏移NEW\Final\WT\nor\d5','d5');
% save('C:\Users\admin\Desktop\發電機偏移NEW\Final\WT\nor\a5','a5');
% 
% 
% A = d1+d2+d3+d4+d5+a5
% 
% figure(2)
% subplot(3,1,1);plot(m);title('原始訊號');
% subplot(3,1,2);plot(A);title('重組訊號');
% subplot(3,1,3);plot(m-A);title('誤差訊號');

