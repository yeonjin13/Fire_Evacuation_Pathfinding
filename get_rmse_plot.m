

% 특정 group에서 L,w에 관하며 rmse를 plotting하는 기본적인 방법



close all;
clear all;


rmse_value = csvread('rmse_by_t_L_w_1.csv');

value_l = rmse_value(2:end, 1);
value_w = rmse_value(1, 2:end);

choice = 1; % 1 = L is constant, 2 = w is constant

num_L = size(value_l);
num_w = size(value_w);

switch choice
    case 1  % L is constant
        for i= 1:num_L(1,1)
           figure(i);
           plot(3.6*value_w, rmse_value(i+1, 2:end), 'x', 'color', 'r', 'MarkerFaceColor', 'r');
           hold on;
           plot(3.6*value_w, rmse_value(i+1, 2:end), 'g--');
           %axis([30 190 0 200]); %축정해주기 [min_x max_x min_y max_y]
           title(['rmse value when L=', num2str(value_l(i,1))]);
           saveas(figure(i),['rmse_constant_L_',num2str(value_l(i,1)),'_group_1.png']);
        end
        
    case 2  % w is constant
        for i= 1:num_w(1,2)
           figure(i);
           plot(value_l', rmse_value(2:end, i+1)', 'x', 'color', 'r', 'MarkerFaceColor', 'r');
           hold on;
           plot(value_l', rmse_value(2:end, i+1)', 'g--');
          % axis([90 280 0 200]); %축정해주기
           title(['rmse value when w=', num2str(3.6*value_w(1,i))]);
           saveas(figure(i),['rmse_constant_w_',num2str(3.6*value_w(1,i)),'_group_1.png']);
        end    
end


clear all;
close all;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




rmse_value = csvread('rmse_by_t_L_w_1.csv');

value_l = rmse_value(2:end, 1);
value_w = rmse_value(1, 2:end);

choice = 2; % 1 = L is constant, 2 = w is constant

num_L = size(value_l);
num_w = size(value_w);

switch choice
    case 1  % L is constant
        for i= 1:num_L(1,1)
           figure(i);
           plot(3.6*value_w, rmse_value(i+1, 2:end), 'x', 'color', 'r', 'MarkerFaceColor', 'r');
           hold on;
           plot(3.6*value_w, rmse_value(i+1, 2:end), 'g--');
           %axis([30 190 0 200]); %축정해주기 [min_x max_x min_y max_y]
           title(['rmse value when L=', num2str(value_l(i,1))]);
           saveas(figure(i),['rmse_constant_L_',num2str(value_l(i,1)),'_group_1.png']);
        end
        
    case 2  % w is constant
        for i= 1:num_w(1,2)
           figure(i);
           plot(value_l', rmse_value(2:end, i+1)', 'x', 'color', 'r', 'MarkerFaceColor', 'r');
           hold on;
           plot(value_l', rmse_value(2:end, i+1)', 'g--');
         %  axis([90 280 0 200]); %축정해주기
           title(['rmse value when w=', num2str(3.6*value_w(1,i))]);
           saveas(figure(i),['rmse_constant_w_',num2str(3.6*value_w(1,i)),'_group_1.png']);
        end    
end


clear all;
close all;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



rmse_value = csvread('rmse_by_t_L_w_2.csv');

value_l = rmse_value(2:end, 1);
value_w = rmse_value(1, 2:end);

choice = 1; % 1 = L is constant, 2 = w is constant

num_L = size(value_l);
num_w = size(value_w);

switch choice
    case 1  % L is constant
        for i= 1:num_L(1,1)
           figure(i);
           plot(3.6*value_w, rmse_value(i+1, 2:end), 'x', 'color', 'r', 'MarkerFaceColor', 'r');
           hold on;
           plot(3.6*value_w, rmse_value(i+1, 2:end), 'g--');
          % axis([30 190 0 200]); %축정해주기 [min_x max_x min_y max_y]
           title(['rmse value when L=', num2str(value_l(i,1))]);
           saveas(figure(i),['rmse_constant_L_',num2str(value_l(i,1)),'_group_2.png']);
        end
        
    case 2  % w is constant
        for i= 1:num_w(1,2)
           figure(i);
           plot(value_l', rmse_value(2:end, i+1)', 'x', 'color', 'r', 'MarkerFaceColor', 'r');
           hold on;
           plot(value_l', rmse_value(2:end, i+1)', 'g--');
          % axis([90 280 0 200]); %축정해주기
           title(['rmse value when w=', num2str(3.6*value_w(1,i))]);
           saveas(figure(i),['rmse_constant_w_',num2str(3.6*value_w(1,i)),'_group_2.png']);
        end    
end


clear all;
close all;




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


rmse_value = csvread('rmse_by_t_L_w_2.csv');

value_l = rmse_value(2:end, 1);
value_w = rmse_value(1, 2:end);

choice = 2; % 1 = L is constant, 2 = w is constant

num_L = size(value_l);
num_w = size(value_w);

switch choice
    case 1  % L is constant
        for i= 1:num_L(1,1)
           figure(i);
           plot(3.6*value_w, rmse_value(i+1, 2:end), 'x', 'color', 'r', 'MarkerFaceColor', 'r');
           hold on;
           plot(3.6*value_w, rmse_value(i+1, 2:end), 'g--');
         %  axis([30 190 0 200]); %축정해주기 [min_x max_x min_y max_y]
           title(['rmse value when L=', num2str(value_l(i,1))]);
           saveas(figure(i),['rmse_constant_L_',num2str(value_l(i,1)),'_group_2.png']);
        end
        
    case 2  % w is constant
        for i= 1:num_w(1,2)
           figure(i);
           plot(value_l', rmse_value(2:end, i+1)', 'x', 'color', 'r', 'MarkerFaceColor', 'r');
           hold on;
           plot(value_l', rmse_value(2:end, i+1)', 'g--');
         %  axis([90 280 0 200]); %축정해주기
           title(['rmse value when w=', num2str(3.6*value_w(1,i))]);
           saveas(figure(i),['rmse_constant_w_',num2str(3.6*value_w(1,i)),'_group_2.png']);
        end    
end


clear all;
close all;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%


rmse_value = csvread('rmse_by_t_L_w_3.csv');

value_l = rmse_value(2:end, 1);
value_w = rmse_value(1, 2:end);

choice = 1; % 1 = L is constant, 2 = w is constant

num_L = size(value_l);
num_w = size(value_w);

switch choice
    case 1  % L is constant
        for i= 1:num_L(1,1)
           figure(i);
           plot(3.6*value_w, rmse_value(i+1, 2:end), 'x', 'color', 'r', 'MarkerFaceColor', 'r');
           hold on;
           plot(3.6*value_w, rmse_value(i+1, 2:end), 'g--');
          % axis([30 190 0 200]); %축정해주기 [min_x max_x min_y max_y]
           title(['rmse value when L=', num2str(value_l(i,1))]);
           saveas(figure(i),['rmse_constant_L_',num2str(value_l(i,1)),'_group_3.png']);
        end
        
    case 2  % w is constant
        for i= 1:num_w(1,2)
           figure(i);
           plot(value_l', rmse_value(2:end, i+1)', 'x', 'color', 'r', 'MarkerFaceColor', 'r');
           hold on;
           plot(value_l', rmse_value(2:end, i+1)', 'g--');
          % axis([90 280 0 200]); %축정해주기
           title(['rmse value when w=', num2str(3.6*value_w(1,i))]);
           saveas(figure(i),['rmse_constant_w_',num2str(3.6*value_w(1,i)),'_group_3.png']);
        end    
end


clear all;
close all;




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



rmse_value = csvread('rmse_by_t_L_w_3.csv');

value_l = rmse_value(2:end, 1);
value_w = rmse_value(1, 2:end);

choice = 2; % 1 = L is constant, 2 = w is constant

num_L = size(value_l);
num_w = size(value_w);

switch choice
    case 1  % L is constant
        for i= 1:num_L(1,1)
           figure(i);
           plot(3.6*value_w, rmse_value(i+1, 2:end), 'x', 'color', 'r', 'MarkerFaceColor', 'r');
           hold on;
           plot(3.6*value_w, rmse_value(i+1, 2:end), 'g--');
          % axis([30 190 0 200]); %축정해주기 [min_x max_x min_y max_y]
           title(['rmse value when L=', num2str(value_l(i,1))]);
           saveas(figure(i),['rmse_constant_L_',num2str(value_l(i,1)),'_group_3.png']);
        end
        
    case 2  % w is constant
        for i= 1:num_w(1,2)
           figure(i);
           plot(value_l', rmse_value(2:end, i+1)', 'x', 'color', 'r', 'MarkerFaceColor', 'r');
           hold on;
           plot(value_l', rmse_value(2:end, i+1)', 'g--');
          % axis([90 280 0 200]); %축정해주기
           title(['rmse value when w=', num2str(3.6*value_w(1,i))]);
           saveas(figure(i),['rmse_constant_w_',num2str(3.6*value_w(1,i)),'_group_3.png']);
        end    
end


clear all;
close all;

