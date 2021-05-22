function U = crank_nicolson(t_min,t_max,tau,x_min,x_max,h,phi,f)
%CRANK_NICOLSON 此处显示有关此函数的摘要
%   compute the numerical solution for the specific PDE systems mentioned
%   in README.md
%% 参数的赋值
T = t_min : tau : t_max;
X = x_min : h : x_max;
r = tau / (h * h);
U = zeros(length(T),length(X));
%% 求解U的数值解
U(1,:) = phi(X); %初值条件
A_temp1 = (r+1) * eye(length(X));
A_temp2 = diag(-0.5 * r * ones(length(X)-1,1),1);
A = A_temp1 + A_temp2 + A_temp2';
A(1,2) = -r;
A(end,end-1) = -r; %构造系数矩阵
for k = 2 : length(T)
    b = 0.5 * tau * (f(T(k-1)) + f(T(k))) * ones(length(X),1);
    b(2:end-1) = b(2:end-1) + 0.5 * r * (U(k-1,3:end) + U(k-1,1:end-2))';
    b(1) = b(1) + r * U(k-1,2);
    b(end) = b(end) + r * U(k-1,end-1);
    b = b + (1 - r) * U(k-1,:)'; %构造求解U需要求解的方程组的右端向量
    U(k,:) = (A\b)';
end
end

