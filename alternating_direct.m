function U = alternating_direct(t_min,t_max,tau,x_min,x_max,y_min,y_max,h,alpha,phi)
%ALTERNATING_DIRECT 此处显示有关此函数的摘要
%   此处显示详细说明
T = t_min : tau : t_max;
X = x_min : h : x_max;
Y = y_min : h : y_max;
U = zeros(length(Y),length(X),length(T)); %u_jk^n = U(k,j,n)
r = tau / alpha / (h * h);
%% 初值条件
for j = 1 : length(X)
    for k = 1 : length(Y)
        U(k,j,1) = phi(X(j),Y(k));
    end
end
%% 边值条件
for n = 2 : length(T)
    for k = 1 : length(Y)
        U(k,1,n) = 0;
        U(k,end,n)  = 0;
    end
end

%% 构造ADI差分格式
% 从第n层计算n+1/2层
A_temp1 = (1 + r) * eye(length(Y) - 2);
A_temp2 = diag(-0.5 * r * ones(length(Y) - 3,1),1);
A = A_temp1 + A_temp2 + A_temp2';
A(1,1) = 1 + 0.5 * r;
A(end,end) = 1 + 0.5 * r;
for n = 2 : length(T)
    U_temp = zeros(length(Y),length(X));
    for k = 2 : length(Y) - 1
        b_1 = 0.5 * r * (U(k - 1, 2 : length(X) - 1, n - 1)' + U(k + 1, 2 : length(X) - 1, n - 1)') + (1 - r) * U(k, 2 : length(X) - 1,n - 1)';
        temp1 = A\b_1;
        U_temp(k, 2 : end-1) = temp1';
    end
    U_temp(1, 2 : end-1) = U_temp(2, 2 : end-1);
    U_temp(end, 2: end-1) = U_temp(end-1, 2 : end-1);
    for j = 2 : length(X) - 1
        b_2 = 0.5 * r * (U_temp(2 : length(Y) - 1, j-1) + U_temp(2 : length(Y) - 1, j+1)) + (1 - r) * U_temp(2 : length(Y) - 1, j);
        temp2 = A\b_2;
        U(2 : end-1, j, n) = temp2;
    end
    U(1, 2 : end - 1, n) = U(2, 2 : end-1, n);
    U(end, 2 : end - 1, n) = U(end - 1, 2 : end-1, n);
end

end

