close all;
clear all;

dynamics = csvread('NEW_data.csv');
time = dynamics(2:end, 1);

result_data=[];
for time_select = 2:400
    time_select
    centered_temp_data=[];
    load(['simu_',num2str(time(time_select, 1)),'.mat']);
    for index=1:47
        centered_temp_data = [centered_temp_data; val(clustered_group(index))];
    end
    result_data=[result_data; centered_temp_data'];
end

time_used = time(2:400);  %괄호 안은 time_select 와 동일.
result_data = [time_used result_data];
result_data = [0:47; result_data];


csvwrite('centered_temp_per_node.csv', result_data);

