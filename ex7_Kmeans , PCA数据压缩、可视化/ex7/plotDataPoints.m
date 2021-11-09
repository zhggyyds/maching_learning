function plotDataPoints(X, idx, K)
%PLOTDATAPOINTS plots data points in X, coloring them so that those with the same
%index assignments in idx have the same color
%   PLOTDATAPOINTS(X, idx, K) plots data points in X, coloring them so that those 
%   with the same index assignments in idx have the same color

% Create palette
palette = hsv(K + 1);
%% 使每一个类的Point的颜色都一样,并且按照数据顺序进行颜色分配，在下面使用scatter中可以直接使用
colors = palette(idx, :); 

% Plot the data
scatter(X(:,1), X(:,2), 15, colors);

end
