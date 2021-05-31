function [error_max_list,error_l2_list] = error_analysis1(t_min,t_max,tau,x_min,x_max,h_list,phi,f,numerical_method,method_name)
%% 参数赋值
error_l2_list = [];
error_max_list = [];

%% 计算误差
for i = 1 : length(h_list)
    h = h_list(i);
    T = t_min : tau : t_max;
    %U = backward_difference(t_min,t_max,tau,x_min,x_max,h,phi,f);
    %U = forward_difference(t_min,t_max,tau,x_min,x_max,h,phi,f);
    U = numerical_method(t_min,t_max,tau,x_min,x_max,h,phi,f);
    U_true = analytical_solution1(t_min,t_max,tau,x_min,x_max,h);
    err = U - U_true;
    error_norm_max = zeros(length(T),1);
    error_norm_l2 = zeros(length(T),1);
    for j = 1 : length(T)
        error_norm_max(j) = norm(err(j,:),inf); %对每个离散时间层上的误差求最大模范数
        error_norm_l2(j) = norm(err(j,:),2); %对每个离散时间层上的误差求l2范数
    end
    error_max_list = [error_max_list error_norm_max];
    error_l2_list = [error_l2_list error_norm_l2];
end
%% 求收敛阶
order = zeros(size(error_max_list,1)-1,size(error_max_list,2)-1);
for i = 1 : size(order,1)
    for j = 1 : size(order,2)
        order(i,j) = log10(error_max_list(i,j+1)/error_max_list(i,j))/log10(h_list(j+1)/h_list(j));
    end
end
%% 画图
row_num = 10;%选择画某一层（行）的误差分析图
figure()
plot(log(h_list),log(error_l2_list(row_num,:)),'linewidth',2);
hold on
plot(log(h_list),2*log(h_list),'- ','linewidth',2);
xlabel('$log(h)$','interpreter','latex');
ylabel('$log(error)$','interpreter','latex');
title(strcat("Analysis of the Order of $l_{2}$-norm Error(",method_name,")"),'interpreter','latex');
legend('$Numerical$','$Theoretical$','interpreter','latex');
hold off
figure()
plot(log(h_list),log(error_max_list(row_num,:)),'linewidth',2);
hold on
plot(log(h_list),2*log(h_list),'- ','linewidth',2);
xlabel('$log(h)$','interpreter','latex');
ylabel('$log(error)$','interpreter','latex');
title(strcat("Analysis of the Order of $l_{\infty}$-norm Error(",method_name,")"),'interpreter','latex');
legend('$Numerical$','$Theoretical$','interpreter','latex');
hold off
%% 输出数值误差阶
disp(h_list);
disp(error_l2_list(row_num,:))
p = polyfit(log(h_list),log(error_l2_list(row_num,:)),1);
disp(strcat("The Numerical Order of l2-norm Error(",method_name,") = ",string(p(1))));
disp(h_list);
disp(error_max_list(row_num,:))
p = polyfit(log(h_list),log(error_max_list(row_num,:)),1);
disp(strcat("The Numerical Order of l_infty-norm Error(",method_name,") = ", string(p(1))));
end
