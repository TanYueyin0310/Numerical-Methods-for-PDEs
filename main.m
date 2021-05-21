%% 参数赋值
tau = 1/5000;
h = 1/100;
phi = @(x)(cos(pi*x));
f = @(x)(sin(x));
t_min = 0;
t_max = 1;
x_min = 0;
x_max = 1;
X = x_min : h : x_max;
T = t_min : tau : t_max;

%% 求数值解和真解
%U = forward_difference(t_min,t_max,tau,x_min,x_max,h,phi,f);
U = backward_difference(t_min,t_max,tau,x_min,x_max,h,phi,f);
U_true = analytical_solution(t_min,t_max,tau,x_min,x_max,h);
%% 画图
figure(1)
Fig1 = mesh(X,T,U);%解的图像
xlabel('$x$','interpreter','latex');
ylabel('$t$','interpreter','latex');
zlabel('$u$','interpreter','latex');
title(strcat('Numerical Solution for Backward Finite Difference Method(r=',string(tau/(h*h)),')'),'Interpreter','latex')
figure(2)
Fig2 = mesh(X,T,U-U_true);%误差分布
xlabel('$x$','interpreter','latex');
ylabel('$t$','interpreter','latex');
zlabel('$Error$','interpreter','latex');
title(strcat('Numerical Error for Backward Finite Difference Method(r=',string(tau/(h*h)),')'),'Interpreter','latex')