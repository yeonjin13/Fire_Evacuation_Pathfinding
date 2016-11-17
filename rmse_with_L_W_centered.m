close all;
clear all;



dynamics = csvread('centered_temp_per_node.csv');%('medium_raw_data_temperature.csv');
time = dynamics(2:end, 1);  %time %3.61~1436.4


sum_of_square_error = 0;


% NEW_DATA.csv 에서 n+2번째 줄의 시간 사용
%time_select=L, n=w
time_select = 26; 
n=10;

rmse_result = [];
column = 1; % of rmse_result
row = 1; % of rmse_result
used_time = [];

%% predict_time, time_select, n 만 수정하면서 돌리면 됩니다.

predict_time = [0 25:90]; %predict_time = [0 n에 들어갈 벡터]

for time_select = 25:106 %L
    time_select % check
    column=1;
    for n=25:90
        sum_of_square_error=0;
        for index=[1 2 3 12 13 14 15 16]
            load(['simu_',num2str(time(time_select+n, 1)),'.mat']);
            centered_temp_of_real_clus = val(clustered_group(index));
            load(['simu_predict_',num2str(time(time_select, 1)), '_', num2str(time(time_select+n, 1)),'.mat']);
            centered_temp_of_pred_clus = val(clustered_group(index));            
            sum_of_square_error = sum_of_square_error+(centered_temp_of_pred_clus - centered_temp_of_real_clus)^2;
        end
        root_mean_square_error = sqrt(sum_of_square_error / 8);
        rmse_result(row, column) = root_mean_square_error;
        column = column+1;
        %when = ['L is ',num2str(time(time_select, 1)), ' & w is ', num2str(time(n,1)),' == rmse is', num2str(root_mean_square_error)]
    end
    used_time(row, 1) = time(time_select,1);
    row = row+1;    
end

rmse_result = [used_time rmse_result];
rmse_result = [predict_time; rmse_result];

csvwrite('rmse_result_by_L_W_with_centered_temp_7.csv', rmse_result);

figure(1);
