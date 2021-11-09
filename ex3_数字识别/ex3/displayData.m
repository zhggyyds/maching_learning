function [h, display_array] = displayData(X, example_width)
% DISPLAYDATA Display 2D data in a nice grid
%   [h, display_array] = DISPLAYDATA(X, example_width) displays 2D data
%   stored in X in a nice grid. It returns the figure handle h and the 
%   displayed array if requested.

% Set example_width automatically if not passed in
% exist用于检查前者是否存在，第二个参数告知前者是一个变量，~表示取反，不存在返回true
% isempty检测元素是否为空，空则返回true

% 若不存在或为空，将其赋值为列数的根号的四舍五入
if ~exist('example_width', 'var') || isempty(example_width) 
	example_width = round(sqrt(size(X, 2)));
end

% Gray Image
colormap(gray);

% Compute rows, cols
% example_height == example_width  example是每一行的元素的pixel的长宽
[m n] = size(X);
example_height = (n / example_width);

% Compute number of items to display
% 得出整体行，列数，若有100个例子，得出10*10大小的真正方形
display_rows = floor(sqrt(m));
display_cols = ceil(m / display_rows);

% Between images padding
pad = 1;

% Setup blank display
% 计算出所需要的矩阵大小，每个点以及pad均为矩阵中的一个元素，生成全为1的矩阵
display_array = - ones(pad + display_rows * (example_height + pad), ...
                       pad + display_cols * (example_width + pad));

% Copy each example into a patch on the display array
curr_ex = 1;
for j = 1:display_rows
	for i = 1:display_cols
	% 当前案例id,超过预期案例总数,结束循环
		if curr_ex > m, 
			break; 
		end
		% Copy the patch
		
		% Get the max value of the patch
		max_val = max(abs(X(curr_ex, :)));

		% 将用作显示的矩阵替换为案例中各个数字的值
		display_array(pad + (j - 1) * (example_height + pad) + (1:example_height), ...
		              pad + (i - 1) * (example_width + pad) + (1:example_width)) = ...
						reshape(X(curr_ex, :), example_height, example_width) / max_val;
		curr_ex = curr_ex + 1;
	end
	if curr_ex > m, 
		break; 
	end
end

% Display Image，将像素点显示为图片
h = imagesc(display_array, [-1 1]);

% Do not show axis
% 不显示坐标轴
axis image off

drawnow;

end
