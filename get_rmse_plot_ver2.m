close all;
clear all;


rmse_value = csvread('rmse_result_with_L_W.csv');

value_l = rmse_value(2:end, 1);
value_w = rmse_value(1, 2:end);

choice = 2; % 1 = L is constant, 2 = w is constant

num_L = size(value_l);
num_w = size(value_w);


switch choice
    case 1  % L is constant
        cc=hsv(num_L(1,1));
        figure(1);

        for i= 1:num_L(1,1)
           plot(value_w, rmse_value(i+1, 2:end), 'x', 'color', 'r', 'MarkerFaceColor', 'r');
           axis([10 90 0 300]);
           hold on;
%           hold on;
%           plot(value_w, rmse_value(i+1, 2:end), 'b--');
%           %axis([10 90 0 100]); %축정해주기 [min_x max_x min_y max_y]
%           title(['rmse value when L=', num2str(value_l(i,1))]);
%           saveas(figure(i),['rmse_constant_L_',num2str(value_l(i,1)),'.png']);
        end
        title(['rmse value when L =', num2str(value_l(1,1)), ' to ', num2str(value_l(num_L(1,1),1))]);
        saveas(figure(1), ['rmse value when L =', num2str(value_l(1,1)), ' to ', num2str(value_l(num_L(1,1),1)), '.png']);
    case 2  % w is constant
        figure(1);
        for i= 1:num_w(1,2)
%           plot(value_l', rmse_value(2:end, i+1)', 'g--');
           plot(value_l', rmse_value(2:end, i+1)', 'x', 'color', 'r', 'MarkerFaceColor', 'r')
           %axis([10 90 0 300]);
           hold on;           
           %figure(i);
           %plot(value_l', rmse_value(2:end, i+1)', 'x', 'color', 'r', 'MarkerFaceColor', 'r');
           %axis([90 900 0 100]); %축정해주기
           %title(['rmse value when w=', num2str(value_w(1,i))]);
           %saveas(figure(i),['rmse_constant_w_',num2str(value_w(1,i)),'.png']);
        end
        title(['rmse value when w =', num2str(value_w(1,1)), ' to ', num2str(value_w(num_w(1,1),1))]);
        saveas(figure(1), ['rmse value when L =', num2str(value_w(1,1)), ' to ', num2str(value_w(num_w(1,1),1)), '.png']);
end


