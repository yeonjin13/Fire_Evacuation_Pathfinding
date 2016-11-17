


% Ư�� L, w �ð����� �ϳ��� plot�� �� group�� �׷����� ��� ��Ÿ��
% �� group������ rmse�� �ſ� �ٸ��ٴ� ���� ���� grouping�� �� �ʿ䰡 �ִٶ�� ����� ������


clear all;
close all;

rmse_value1 = csvread('rmse_by_t_L_w_1.csv');
rmse_value2 = csvread('rmse_by_t_L_w_2.csv');
rmse_value3 = csvread('rmse_by_t_L_w_3.csv');

value_l = rmse_value1(2:end, 1);
value_w = rmse_value1(1, 2:end);

choice = 1; % 1 = L is constant, 2 = w is constant

num_L = size(value_l);
num_w = size(value_w);

switch choice
    case 1  % L is constant
        for i= 1:num_L(1,1)
           figure(i);
           plot(3.6*value_w, rmse_value1(i+1, 2:end), 'x', 'color', 'r', 'MarkerFaceColor', 'r');
           hold on;
           plot(3.6*value_w, rmse_value2(i+1, 2:end), 'x', 'color', 'r', 'MarkerFaceColor', 'r');
           hold on;
           plot(3.6*value_w, rmse_value3(i+1, 2:end), 'x', 'color', 'r', 'MarkerFaceColor', 'r');
           hold on;
           plot(3.6*value_w, rmse_value1(i+1, 2:end), 'g--');
           hold on;
           plot(3.6*value_w, rmse_value2(i+1, 2:end), 'g--');
           hold on;
           plot(3.6*value_w, rmse_value3(i+1, 2:end), 'g--');
           hold on;
           
           axis([100 700 0 150]); %�������ֱ� [min_x max_x min_y max_y]
           title(['rmse value when L=', num2str(value_l(i,1))]);
           saveas(figure(i),['rmse_constant_L_',num2str(value_l(i,1)),'.png']);
        end
        
    case 2  % w is constant
        for i= 1:num_w(1,2)
           figure(i);
           plot(value_l, rmse_value1(2:end, i+1)', 'x', 'color', 'r', 'MarkerFaceColor', 'b');
           hold on;
           plot(value_l, rmse_value2(2:end, i+1)', 'x', 'color', 'r', 'MarkerFaceColor', 'b');
           hold on;
           plot(value_l, rmse_value3(2:end, i+1)', 'x', 'color', 'r', 'MarkerFaceColor', 'b');
           hold on;
           plot(value_l, rmse_value1(2:end, i+1)', 'g--');
           hold on;
           plot(value_l, rmse_value2(2:end, i+1)', 'g--');
           hold on;
           plot(value_l, rmse_value3(2:end, i+1)', 'g--');
           hold on;
           
           axis([80 280 0 150]); %�������ֱ�
           title(['rmse value when w=', num2str(3.6*value_w(1,i))]);
           saveas(figure(i),['rmse_constant_w_',num2str(3.6*value_w(1,i)),'_all_group.png']);
        end    
end

clear all;
close all;





clear all;
close all;

rmse_value1 = csvread('rmse_by_t_L_w_1.csv');
rmse_value2 = csvread('rmse_by_t_L_w_2.csv');
rmse_value3 = csvread('rmse_by_t_L_w_3.csv');

value_l = rmse_value1(2:end, 1);
value_w = rmse_value1(1, 2:end);

choice = 2; % 1 = L is constant, 2 = w is constant

num_L = size(value_l);
num_w = size(value_w);

switch choice
    case 1  % L is constant
        for i= 1:num_L(1,1)
           figure(i);
           plot(3.6*value_w, rmse_value1(i+1, 2:end), 'x', 'color', 'r', 'MarkerFaceColor', 'r');
           hold on;
           plot(3.6*value_w, rmse_value2(i+1, 2:end), 'x', 'color', 'r', 'MarkerFaceColor', 'r');
           hold on;
           plot(3.6*value_w, rmse_value3(i+1, 2:end), 'x', 'color', 'r', 'MarkerFaceColor', 'r');
           hold on;
           plot(3.6*value_w, rmse_value1(i+1, 2:end), 'g--');
           hold on;
           plot(3.6*value_w, rmse_value2(i+1, 2:end), 'g--');
           hold on;
           plot(3.6*value_w, rmse_value3(i+1, 2:end), 'g--');
           hold on;
           
           axis([100 700 0 150]); %�������ֱ� [min_x max_x min_y max_y]
           title(['rmse value when L=', num2str(value_l(i,1))]);
           saveas(figure(i),['rmse_constant_L_',num2str(value_l(i,1)),'.png']);
        end
        
    case 2  % w is constant
        for i= 1:num_w(1,2)
           figure(i);
           plot(value_l, rmse_value1(2:end, i+1)', 'x', 'color', 'r', 'MarkerFaceColor', 'b');
           hold on;
           plot(value_l, rmse_value2(2:end, i+1)', 'x', 'color', 'r', 'MarkerFaceColor', 'b');
           hold on;
           plot(value_l, rmse_value3(2:end, i+1)', 'x', 'color', 'r', 'MarkerFaceColor', 'b');
           hold on;
           plot(value_l, rmse_value1(2:end, i+1)', 'g--');
           hold on;
           plot(value_l, rmse_value2(2:end, i+1)', 'g--');
           hold on;
           plot(value_l, rmse_value3(2:end, i+1)', 'g--');
           hold on;
           
           axis([80 280 0 150]); %�������ֱ�
           title(['rmse value when w=', num2str(3.6*value_w(1,i))]);
           saveas(figure(i),['rmse_constant_w_',num2str(3.6*value_w(1,i)),'_all_group.png']);
        end    
end

clear all;
close all;