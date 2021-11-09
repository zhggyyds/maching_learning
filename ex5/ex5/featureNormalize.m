function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

mu = mean(X);
% bsxfun会根据所提供的方法对两个参数进行运算，并且当参数的维数不同时，低维补充为高
% 并且基本是 点运算（分别计算每个元素）
X_norm = bsxfun(@minus, X, mu); 

sigma = std(X_norm);
X_norm = bsxfun(@rdivide, X_norm, sigma);


% ============================================================

end
