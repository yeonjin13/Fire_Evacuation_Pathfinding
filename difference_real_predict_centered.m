close all;
clear all;


dynamics = csvread('centered_temp_per_node.csv');%('medium_raw_data_temperature.csv');
time = dynamics(2:end, 1);  %time %3.61~1436.4

diff = 0;

% NEW_DATA.csv 에서 n+2번째 줄의 시간 사용
%time_select=L, n=w
time_select = 25; 
n=25;

diff_result = [];
column = 2;
row = 1;
used_time = [];

%% predict_time, time_select, n 만 수정하면서 돌리면 됩니다.

node = [0 0 1:47]; 

for time_select = 25:57 %25:106 %58:83 %L
    for n=26:70 %25:90 %26:70
        
        diff = 0;
        column = 1;
        
        for index=1:47
            load(['simu_',num2str(time(time_select+n, 1)),'.mat']);
            centered_temp_of_real_clus = val(clustered_group(index));
            load(['simu_predict_',num2str(time(time_select, 1)), '_', num2str(time(time_select+n, 1)),'.mat']);
            centered_temp_of_pred_clus = val(clustered_group(index));            
            diff = abs(centered_temp_of_pred_clus - centered_temp_of_real_clus);
            diff_result(row, column) = diff;
            column = column+1;
        end
        
        used_time(row, 1) = time(time_select,1);
        used_time(row, 2) = time(n,1);
        row = row+1;
        
    end
    time_select
end

diff_result = [used_time diff_result];
diff_result = [node; diff_result];

csvwrite('diff_result_front.csv', diff_result);

figure(1);
