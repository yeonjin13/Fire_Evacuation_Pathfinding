close all;
clear all;


dynamics = csvread('centered_temp_per_node.csv');%('medium_raw_data_temperature.csv');
time = dynamics(2:end, 1);  %time %3.61~1436.4


rmse_result = [];
column = 1; % of rmse_result
row = 1; % of rmse_result
used_time = [];

%% predict_time, time_select, n 만 수정하면서 돌리면 됩니다.

predict_time = [0 10:3:52]; %predict_time = [0 n에 들어갈 벡터]
     
        
for time_to_use = 25:3:82 %25:3:76 %L
    time_to_use
    column = 1;
    for n = 10:3:52 %10:3:52 %w
        rmse_sum = 0;
        for time_select = time_to_use:time_to_use+19 %t
            sum_of_square_error = 0;
            for index = 1:47 %[7 8 41:47] %17:2:39 %[18:2:40 1:6 9:16]
                load(['simu_', num2str(time(time_select+n, 1)), '.mat']);
                centered_temp_of_real_clus = val(clustered_group(index));
                load(['simu_predict_t_', num2str(time(time_select, 1)),'_L_',num2str(time_to_use*3.6),'_w_',num2str(n*3.6),'.mat']);
                centered_temp_of_pred_clus = val(clustered_group(index));
                sum_of_square_error = sum_of_square_error + (centered_temp_of_pred_clus - centered_temp_of_real_clus)^2;
            end
            root_mean_square_error = sqrt(sum_of_square_error / 47); % 9 12 26
            rmse_sum = rmse_sum + root_mean_square_error;
        end
        rmse_average = rmse_sum / 20;
        rmse_result(row, column) = rmse_average;
        column = column+1;
        
    end
    used_time(row, 1) = time(time_to_use, 1);
    row = row+1;
end

rmse_result = [used_time rmse_result];
rmse_result = [predict_time; rmse_result];

csvwrite('rmse_by_t_L_w_all.csv', rmse_result);

figure(1);