function [rand_error_train,rand_error_val] = rand_error(X_poly, y, X_poly_val, yval, lambda)
%% 用于完成最后一个附加题随机抽取元素进行计算error，进行检查该模型是否合理

m = size(X_poly,1);
rand_error_val = zeros(m,1);
rand_error_train = zeros(m,1);
for i = 1:m
    for j = 1:50

        randindex = randperm(m);
        rand_X_poly = X_poly(randindex(1:i),:);
        rand_y = y(randindex(1:i));

        rand_X_val = X_poly_val(randindex(1:i),:);
        rand_y_val = yval(randindex(1:i));

        theta_r = trainLinearReg(rand_X_poly, rand_y, lambda);
        rand_error_train(i) += linearRegCostFunction(rand_X_poly, rand_y,theta_r,0);
        rand_error_val(i) += linearRegCostFunction(rand_X_val, rand_y_val,theta_r,0);

    end;

    rand_error_train(i) /= 50;
    rand_error_val(i) /= 50;

end;

end;