function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

n = size(theta,1);
% 求J
g = sigmoid(X * theta);
J = ((-y' * log(g)) - (1 .- y')*log(1 .- g)) / m + lambda * sum(theta(2:n) .^ 2) / (2*m);

% theta(1)单独计算，规定不算入正则表达式中
grad(1) = sum((g - y) .* X(:,1)) / m;

% 当 j>=2 时
l = size(X,2);
grad(2:n) = (sum((g - y) .* X(:,2:l))' + lambda .* theta(2:n))/m;  


% =============================================================

end
