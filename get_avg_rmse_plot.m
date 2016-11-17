



% 각 group마다 x축이 L일 때와, w일 때 각각 하나씩 밖에 안 나옴 => 총 6개의 그래프
% 한 시점에서의 rmse가 아니라 그 때의 모든 rmse의 평균으로 그래프를 그림
% rmse가 L과 w와 비례/반비례의 관계가 있다고 결론을 내린다





close all;
clear all;

rmse_value = csvread('rmse_by_t_L_w_1.csv');

value_l = rmse_value(2:end, 1);
value_w = rmse_value(1, 2:end);

num_L = size(value_l);
num_w = size(value_w);

fixed_L_sum_rmse = 0;
fixed_w_sum_rmse = 0;
fixed_L_avg_rmse = 0;
fixed_w_avg_rmse = 0;

for a = 1:num_L(1,1)
    fixed_L_sum_rmse = 0;
    for b = 1:num_w(1,2)
        fixed_L_sum_rmse = fixed_L_sum_rmse + rmse_value(a+1, b+1);
    end
    fixed_L_avg_rmse(1,a) = fixed_L_sum_rmse / num_w(1,2);
end

for a = 1:num_w(1,2)
    fixed_w_sum_rmse = 0;
    for b = 1:num_L(1,1)
        fixed_w_sum_rmse = fixed_w_sum_rmse + rmse_value(b+1, a+1);
    end
    fixed_w_avg_rmse(1, a) = fixed_w_sum_rmse / num_L(1,1);
end

figure(1);
plot(value_l, fixed_L_avg_rmse, 'x', 'color', 'r', 'MarkerFaceColor', 'r');
hold on;
plot(value_l, fixed_L_avg_rmse, 'g--');
%axis([80 280 0 150]);
title(['rmse value with fixed L']);
saveas(figure(1),['rmse_fixed_w_average_L_group_1.png']);

figure(2);
plot(value_w, fixed_w_avg_rmse, 'x', 'color', 'r', 'MarkerFaceColor', 'r');
hold on;
plot(value_w, fixed_w_avg_rmse, 'g--');
%axis([20 200 0 150]);
title(['rmse value with fixed w']);
saveas(figure(2),['rmse_fixed_L_average_w_group_1.png']);







close all;
clear all;

rmse_value = csvread('rmse_by_t_L_w_2.csv');

value_l = rmse_value(2:end, 1);
value_w = rmse_value(1, 2:end);

num_L = size(value_l);
num_w = size(value_w);

fixed_L_sum_rmse = 0;
fixed_w_sum_rmse = 0;
fixed_L_avg_rmse = 0;
fixed_w_avg_rmse = 0;

for a = 1:num_L(1,1)
    fixed_L_sum_rmse = 0;
    for b = 1:num_w(1,2)
        fixed_L_sum_rmse = fixed_L_sum_rmse + rmse_value(a+1, b+1);
    end
    fixed_L_avg_rmse(1,a) = fixed_L_sum_rmse / num_w(1,2);
end

for a = 1:num_w(1,2)
    fixed_w_sum_rmse = 0;
    for b = 1:num_L(1,1)
        fixed_w_sum_rmse = fixed_w_sum_rmse + rmse_value(b+1, a+1);
    end
    fixed_w_avg_rmse(1, a) = fixed_w_sum_rmse / num_L(1,1);
end

figure(1);
plot(value_l, fixed_L_avg_rmse, 'x', 'color', 'r', 'MarkerFaceColor', 'r');
hold on;
plot(value_l, fixed_L_avg_rmse, 'g--');
%axis([80 280 0 150]);
title(['rmse value with fixed L']);
saveas(figure(1),['rmse_fixed_w_average_L_group_2.png']);

figure(2);
plot(value_w, fixed_w_avg_rmse, 'x', 'color', 'r', 'MarkerFaceColor', 'r');
hold on;
plot(value_w, fixed_w_avg_rmse, 'g--');
%axis([20 200 0 150]);
title(['rmse value with fixed w']);
saveas(figure(2),['rmse_fixed_L_average_w_group_2.png']);





close all;
clear all;

rmse_value = csvread('rmse_by_t_L_w_3.csv');

value_l = rmse_value(2:end, 1);
value_w = rmse_value(1, 2:end);

num_L = size(value_l);
num_w = size(value_w);

fixed_L_sum_rmse = 0;
fixed_w_sum_rmse = 0;
fixed_L_avg_rmse = 0;
fixed_w_avg_rmse = 0;

for a = 1:num_L(1,1)
    fixed_L_sum_rmse = 0;
    for b = 1:num_w(1,2)
        fixed_L_sum_rmse = fixed_L_sum_rmse + rmse_value(a+1, b+1);
    end
    fixed_L_avg_rmse(1,a) = fixed_L_sum_rmse / num_w(1,2);
end

for a = 1:num_w(1,2)
    fixed_w_sum_rmse = 0;
    for b = 1:num_L(1,1)
        fixed_w_sum_rmse = fixed_w_sum_rmse + rmse_value(b+1, a+1);
    end
    fixed_w_avg_rmse(1, a) = fixed_w_sum_rmse / num_L(1,1);
end

figure(1);
plot(value_l, fixed_L_avg_rmse, 'x', 'color', 'r', 'MarkerFaceColor', 'r');
hold on;
plot(value_l, fixed_L_avg_rmse, 'g--');
%axis([80 280 0 150]);
title(['rmse value with fixed L']);
saveas(figure(1),['rmse_fixed_w_average_L_group_3.png']);

figure(2);
plot(value_w, fixed_w_avg_rmse, 'x', 'color', 'r', 'MarkerFaceColor', 'r');
hold on;
plot(value_w, fixed_w_avg_rmse, 'g--');
%axis([20 200 0 150]);
title(['rmse value with fixed w']);
saveas(figure(2),['rmse_fixed_L_average_w_group_3.png']);



