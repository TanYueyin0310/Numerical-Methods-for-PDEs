function U_true = analytical_solution2(t_min,t_max,tau,x_min,x_max,y_min,y_max,h)
%ANALYTICAL_SOLUTION2 此处显示有关此函数的摘要
%   此处显示详细说明
T = t_min : tau : t_max;
X = x_min : h : x_max;
Y = y_min : h : y_max;
U_true = zeros(length(Y),length(X),length(T));
for n = 1 : length(T)
    for j = 1 : length(X)
        for k = 1 : length(Y)
            U_true(k,j,n) = sin(pi*X(j)) * cos(pi*Y(k)) * exp(-pi*pi/8*T(n));
        end
    end
end
end

