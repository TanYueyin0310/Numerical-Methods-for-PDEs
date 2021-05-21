%% 参数赋值
tau = 1/20000;
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
U = forward_diffence(t_min,t_max,tau,x_min,x_max,h,phi,f);
U_true = analytical_solution(0,1,tau,0,1,h);
%% 画图
Fig = mesh(X,T,U);
xlabel('$x$','interpreter','latex');
ylabel('$t$','interpreter','latex');
zlabel('$u$','interpreter','latex');
title('Numerical Solution for Forward Finite Difference Method(r=0.5)','Interpreter','latex')
