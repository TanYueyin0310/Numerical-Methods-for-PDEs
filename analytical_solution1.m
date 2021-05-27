function U_true = analytical_solution1(t_min,t_max,tau,x_min,x_max,h)
%ANALYTICAL_SOLUTION 此处显示有关此函数的摘要
%   此处显示详细说明
T = t_min : tau : t_max;
X = x_min : h : x_max;
U_true = zeros(length(T),length(X));
for k = 1 : length(T)
    for j = 1 : length(X)
        U_true(k,j) = exp(-pi*pi*T(k))*cos(pi*X(j))+ 1 -cos(T(k));
    end
end

end

