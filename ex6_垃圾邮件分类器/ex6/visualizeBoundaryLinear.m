function visualizeBoundaryLinear(X, y, model)
%VISUALIZEBOUNDARYLINEAR plots a linear decision boundary learned by the
%SVM
%   VISUALIZEBOUNDARYLINEAR(X, y, model) plots a linear decision boundary 
%   learned by the SVM and overlays the data on it

w = model.w;
b = model.b;
xp = linspace(min(X(:,1)), max(X(:,1)), 100); %%列出100个位于前一个数和后一个数之间的数
yp = - (w(1)*xp + b)/w(2); %%不懂啥意思
plotData(X, y); %% plotData函数用于，不同的类分别映射在坐标系上
hold on;
plot(xp, yp, '-b'); 
hold off

end
