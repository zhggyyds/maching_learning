function out = mapFeature(X1, X2)
% MAPFEATURE Feature mapping function to polynomial features
%
%   MAPFEATURE(X1, X2) maps the two input features
%   to quadratic features used in the regularization exercise.
%
%   Returns a new feature array with more features, comprising of 
%   X1, X2, X1.^2, X2.^2, X1*X2, X1*X2.^2, etc..
%
%   Inputs X1, X2 must be the same size
%

degree = 6;
% 将输出值设置为一列1先，在后续循环中不断增加
out = ones(size(X1(:,1)));
for i = 1:degree
    for j = 0:i
    %end+1,表示在末尾增加一行
        out(:, end+1) = (X1.^(i-j)).*(X2.^j);
    end
end

end