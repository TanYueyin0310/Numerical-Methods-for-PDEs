%% 参数赋值
tau = 1/1600;
h = 1/40;
phi = @(x,y)(sin(pi*x) * cos(pi*y)); %PDE2问题中的的初值条件
t_min = 0;
t_max = 1;
x_min = 0;
x_max = 1;
y_min = 0; 
y_max = 1;
X = x_min : h : x_max;
T = t_min : tau : t_max;
Y = y_min : h : y_max;
% method_name = ["Locally One Dimension Method" "ADI Method" "Predictor Corrector Method"];
method_name = "Crank-Nicolson 2D";
alpha = 16;
%% 求数值解和真解
U = crank_nicolson_2d(t_min,t_max,tau,x_min,x_max,y_min,y_max,h,alpha,phi);
U_true = analytical_solution2(t_min,t_max,tau,x_min,x_max,y_min,y_max,h);
%% 画图
figure()
Fig1 = mesh(X,Y,U(:,:,end));%数值解的图像
xlabel('$x$','interpreter','latex');
ylabel('$y$','interpreter','latex');
zlabel('$u$','interpreter','latex');
title(strcat("Numerical Solution for ",method_name,"(r=",string(tau/(h*h)),")"),'Interpreter','latex')
figure()
Fig3 = mesh(X,Y,U(:,:,end)-U_true(:,:,end));%误差分布
xlabel('$x$','interpreter','latex');
ylabel('$y$','interpreter','latex');
zlabel('$Error$','interpreter','latex');
title(strcat("Numerical Error for ",method_name,"(r=",string(tau/(h*h)),")"),'Interpreter','latex')
%% 误差分析
h_list = [1/2 1/4 1/5 1/8 1/10];
% numerical_method = {@locally_one_dimension @alternating_direct @predictor_corrector};
numerical_method = {@crank_nicolson_2d};
for i = 1 : length(numerical_method)
    error_analysis2(t_min,t_max,tau,x_min,x_max,y_min,y_max,h_list,alpha,phi,numerical_method{i},method_name(i));
end