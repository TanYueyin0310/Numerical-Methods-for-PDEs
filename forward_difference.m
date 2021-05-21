function U = forward_difference(t_min,t_max,tau,x_min,x_max,h,phi,f)
%FORWARD_DIFFENCE 此处显示有关此函数的摘要
%       compute the numerical solution for the specific PDE systems
%       mentioned in README.md
%% 参数的赋值
T = t_min : tau : t_max;
X = x_min : h : x_max;
r = tau / (h * h);
U = zeros(length(T),length(X));
%% 求解U的数值解
U(1,:) = phi(X); %初值条件
for k = 1 : length(T) - 1
    for j = 1 : length(X)
        if j == 1
            U(k+1,j) = 2 * r * U(k,j+1) + (1 - 2 * r) * U(k,j) + tau * f(T(k+1));
        elseif j == length(X) 
            U(k+1,j) = 2 * r * U(k,j-1) + (1 - 2 * r) * U(k,j) + tau * f(T(k+1));
        else
            U(k+1,j) = r * U(k,j+1) + (1 - 2 * r) * U(k,j)+ r * U(k,j-1) + tau * f(T(k+1));
        end
    end
end         
        
end

