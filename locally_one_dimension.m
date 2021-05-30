function U = locally_one_dimension(t_min,t_max,tau,x_min,x_max,y_min,y_max,h,alpha,phi)
%LOCALLY_ONE_DIMENSION 此处显示有关此函数的摘要
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
%% 构造LOD差分格式
A_temp1 = (1 + r) * eye(length(Y) - 2);
A_temp2 = diag(-0.5 * r * ones(length(Y) - 3,1),1);
A = A_temp1 + A_temp2 + A_temp2';
A1 = A;
A1(1,1) = 1 + 0.5 * r;
A1(end,end) = 1 + 0.5 * r;
for n = 2 : 2 : length(T)
    U_temp1 = zeros(length(Y),length(X));
    U_temp2 = zeros(length(Y),length(X));
    for k = 2 : length(Y) - 1
        b_1 = 0.5 * r * (U( k - 1,2 : end - 1, n - 1)' + U( k + 1, 2 : end - 1,n - 1)') + (1 - r) * U(k ,2 : end - 1, n - 1)';
        temp1 = A\b_1;
        U_temp1(k, 2 : end-1) = temp1';
    end
    U_temp1(1, 2 : end-1) = U_temp1(2, 2 : end-1);
    U_temp1(end, 2: end-1) = U_temp1(end-1, 2 : end-1);
    for j = 2 : length(X) - 1
        b_2 = 0.5 * r * (U_temp1(2 : end - 1,j - 1) + U_temp1(2 : end - 1,j + 1)) + (1 - r) * U_temp1( 2 : end - 1,j);
        temp2 = A1\b_2;
        U(2 : end-1, j, n) = temp2;
    end
    U(1, 2 : end - 1, n ) = U(2, 2 : end-1, n);
    U(end, 2 : end - 1, n) = U(end - 1, 2 : end-1, n);
    for j = 2 : length(X) - 1
        b_3 = 0.5 * r * (U(2 : end - 1,j - 1,  n) + U( 2 : end - 1,j + 1, n)) + (1 - r) * U( 2 : end - 1, j,n);
        temp3 = A1\b_3;
        U_temp2(2 : end-1, j) = temp3;
    end
    U_temp2(1, 2 : end - 1) = U_temp2(2, 2 : end-1);
    U_temp2(end, 2 : end - 1) = U_temp2(end - 1, 2 : end-1);
    for k = 2 : length(Y) - 1
        b_4 = 0.5 * r * (U_temp2(k - 1,2 : end - 1)' + U_temp2( k + 1,2 : end - 1)') + (1 - r) * U_temp2(k, 2 : end - 1)';
        temp4 = A1\b_4;
        U(k, 2 : end-1, n+1) = temp4';
    end
    U(1, 2 : end - 1, n+1) = U(2, 2 : end-1, n+1);
    U(end, 2 : end - 1, n+1) = U(end - 1, 2 : end-1, n+1);
end
end

