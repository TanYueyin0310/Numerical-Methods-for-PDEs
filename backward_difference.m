function U = backward_difference(t_min,t_max,tau,x_min,x_max,h,phi,f)
%BACKWORD 此处显示有关此函数的摘要
%   compute the numerical solution for the specific PDE systems mentioned
%   in README.md
%% 参数的赋值
T = t_min : tau : t_max;
X = x_min : h : x_max;
r = tau / (h * h);
U = zeros(length(T),length(X));
%% 求解U的数值解
U(1,:) = phi(X); %初值条件
A_temp1 = (2 * r + 1) * eye(length(X));
A_temp2 = diag(-r * ones(length(X)-1,1),1);
A = A_temp1 + A_temp2 + A_temp2';
A(1,2) = -2 * r;
A(end,end-1) = -2 * r; %构造系数矩阵
for k = 2 : length(T)
    b = tau * f(T(k)) * ones(length(X),1) + U(k-1,:)';
    U(k,:) = (A\b)';
end
end

