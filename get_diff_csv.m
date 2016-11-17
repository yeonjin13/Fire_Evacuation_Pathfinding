close all;
clear all;

dynamics = csvread('centered_temp_per_node.csv');%('medium_raw_data_temperature.csv');
time = dynamics(2:end, 1);  %time %3.61~1436.4

diff = 0;

% NEW_DATA.csv 에서 n+2번째 줄의 시간 사용

diff_result = [];
column = 2;
row = 1;
used_time = [];

%% predict_time, time_select, n 만 수정하면서 돌리면 됩니다.

node = [0 0 1:47]; 

% L (time_to_use) 사용할 시간의 수
% t (time_select) 기준 시간
% w (n) 예측 시간

for time_to_use = 25:3:76 %L
    time_to_use %check
    for n=10:3:52 %w
        column = 1;        
        for index=1:47
            sum_diff = 0;        
            diff = 0;
            for time_select = time_to_use:time_to_use+19 %t
                load(['simu_',num2str(time(time_select+n, 1)),'.mat']);
                centered_temp_of_real_clus = val(clustered_group(index));
                load(['simu_predict_t_',num2str(time(time_select, 1)),'_L_',num2str(time_to_use*3.6),'_w_',num2str(n*3.6),'.mat']);
                centered_temp_of_pred_clus = val(clustered_group(index));            
                sum_diff = sum_diff+abs(centered_temp_of_pred_clus - centered_temp_of_real_clus);
                
                string = ['simu_predict_t_',num2str(time(time_select, 1)),'_L_',num2str(time_to_use*3.6),'_w_',num2str(n*3.6),'.mat']
            end
            diff = sum_diff/20;
            diff_result(row, column) = diff;
            column = column+1;
        end
                    
        used_time(row, 1) = time_to_use*3.6;
        used_time(row, 2) = n*3.6;
        row = row+1;
        
    end
end


diff_result = [used_time diff_result];
diff_result = [node; diff_result];

csvwrite('diff_result.csv', diff_result);

figure(1);
