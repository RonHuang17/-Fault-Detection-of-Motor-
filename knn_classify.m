function results = knn_classify(train_data, test_data, num_neighbors, train_labels) 
% classify test_data using KNN classifier established from train_data 
% Input: 
% train_data - training data, TRAIN_NUM x D matrix 
% test_data - testing data, TEST_NUM x D matrix 
% num_neighbors - number of nearest neighbors 
% train_labels - training labels, TRAIN_NUM x 1 matrix 
% Output: 
% results - labels for testing data, TEST_NUM x 1 array 



[TRAIN_NUM, D] = size(train_data); 
[TEST_NUM, D2] = size(test_data); 

if D ~= D2 
error('Invalid Data...'); 
end 

results = zeros(TEST_NUM, 1); 
for i = 1:TEST_NUM 
[dists, neighbors] = find_top_K_neighbors(train_data, test_data(i,:), num_neighbors); 
results(i) = recog(train_labels(neighbors), max(train_labels)); 
end 