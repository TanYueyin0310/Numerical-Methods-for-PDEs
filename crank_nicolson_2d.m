function U = crank_nicolson_2d(t_min,t_max,tau,x_min,x_max,y_min,y_max,h,alpha,phi)
%CRANK_NICOLSON_2D 此处显示有关此函数的摘要
%   此处显示详细说明
T = t_min : tau : t_max;
X = x_min : h : x_max;
Y = y_min : h : y_max;
U = zeros(length(X),length(Y),length(T)); %u_jk^n = U(k,j,n)
r = tau / alpha / (h * h);
knots_num = length(Y) * length(X);
A = sparse(eye(knots_num));
b = sparse(zeros(knots_num,1));
U_temp = sparse(zeros(knots_num,1));
%% 初值条件
for j = 1 : length(X)
    for k = 1 : length(Y)
        U(j,k,1) = phi(X(j),Y(k));
    end
end
%% 边值条件
for k = 1 : length(Y)
    idx_0k = k;
    idx_Jk = (length(X) - 1) * length(Y) + k;
    A(idx_0k,idx_0k) = 1;
    A(idx_Jk,idx_Jk) = 1;
%     b(idx_0k) = 0;
%     b(idx_Jk) = 0;
end
for j = 1 : length(X)
    idx_j0 = (j-1)*length(Y) + 1;
    idx_jK = j * length(Y); 
    A(idx_j0,idx_j0) = 1;
    A(idx_j0, idx_j0 + 1) = -1;
    A(idx_jK, idx_jK) = 1;
    A(idx_jK, idx_jK - 1) = -1;
end
%% 构造Crank Nicolson格式
for j = 2 : length(X) - 1
    for k = 2 : length(Y) - 1
        idx = (j-1) * length(X) + k;
        A(idx, idx) = 1 + 2 * r;
        A(idx, idx-1) = -0.5 * r;
        A(idx, idx+1) = -0.5 * r;
        A(idx, idx-length(X)) = -0.5 * r;
        A(idx, idx+length(X)) = -0.5 * r;
    end
end
for n = 2 : length(T)
    for j = 2 : length(X) - 1
        for k = 2 : length(Y) - 1
            idx = (j-1) * length(X) + k;
            b(idx) = 0.5 * r *(U(j+1,k,n-1) + U(j-1,k,n-1) + U(j,k+1,n-1) + U(j,k-1,n-1)) + (1-2*r)*U(j,k,n-1);
        end
    end
    U_temp = bicgstab(A,b,1e-4,500);
    for j = 1 : length(X)
        for k = 1 : length(Y)
            idx = (j-1) * length(X) + k;
            U(j,k,n) = U_temp(idx);
        end
    end
end
U = permute(U,[2 1 3]);      
end

