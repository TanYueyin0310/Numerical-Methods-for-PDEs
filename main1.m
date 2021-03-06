%% 参数赋值
tau = 1/5000;
h = 1/100;
phi = @(x)(cos(pi*x)); %PDE1问题中的的边值条件
f = @(x)(sin(x)); %PDE1的问题中微分方程的右端项
t_min = 0;
t_max = 1;
x_min = 0;
x_max = 1;
X = x_min : h : x_max;
T = t_min : tau : t_max;
h_list = [1/2 1/5 1/10 1/16 1/40];
numerical_method = {@crank_nicolson @forward_difference @backward_difference};
method_name = ["Crank-Nicolson Method","Forward Finite Difference Method","Backward Finite Difference Method"];
%% 求数值解和真解
%U = forward_difference(t_min,t_max,tau,x_min,x_max,h,phi,f);
%U = backward_difference(t_min,t_max,tau,x_min,x_max,h,phi,f);
U = crank_nicolson(t_min,t_max,tau,x_min,x_max,h,phi,f);
U_true = analytical_solution1(t_min,t_max,tau,x_min,x_max,h);
%% 画图
figure()
Fig1 = mesh(X,T,U);%解的图像
xlabel('$x$','interpreter','latex');
ylabel('$t$','interpreter','latex');
zlabel('$u$','interpreter','latex');
title(strcat("Numerical Solution for ",method_name,"(r=",string(tau/(h*h)),")"),'Interpreter','latex')
figure()
Fig2 = mesh(X,T,U-U_true);%误差分布
xlabel('$x$','interpreter','latex');
ylabel('$t$','interpreter','latex');
zlabel('$Error$','interpreter','latex');
title(strcat("Numerical Error for ",method_name,"(r=",string(tau/(h*h)),")"),'Interpreter','latex')
%% 误差分析
for i = 1 : length(numerical_method)
    error_analysis1(t_min,t_max,tau,x_min,x_max,h_list,phi,f,numerical_method{i},method_name(i));
end
