 function [output, out_value] = knn_class(train_input,train_target,input,k_value)
% clc;clear
% load('s');load('v');load('vv');
% train_input=v;
% train_target=s;
% input=vv;
% k_value=1;
class_number = max(train_target);
class_counter = zeros(class_number,size(input,2));

ed_distance = dist(input',train_input);
[dist_value,dist_indx] = sort(ed_distance,2);

clear dist_value

class_perm = train_target(dist_indx);

    
for oneout_iter = 1:k_value
    for total_iter = 1:size(input,2)
        class_counter(class_perm(total_iter,oneout_iter),total_iter) = ...
            class_counter(class_perm(total_iter,oneout_iter),total_iter)+1;
    end
end

[out_value, output] = max(class_counter);