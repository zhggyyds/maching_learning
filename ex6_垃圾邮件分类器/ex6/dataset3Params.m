function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
%% load('ex6data3.mat');
C = 1;
sigma = 0.1;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval)) 
%        predictions与yval不同则为1，反之为0，最后加和求平均得error rate

model = svmTrain(X,y,C,@(x1, x2) gaussianKernel(x1, x2, sigma));
predictions = svmPredict(model, Xval);
fprintf('when C = %f sigma = %f , the error rate = %f.\n',C, sigma, mean(double(predictions ~= yval)));

% =========================================================================

end
