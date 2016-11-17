
close all;
clear all;

dynamics = csvread('centered_temp_per_node.csv');
time = dynamics(2:end, 1);


     

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

string = 'make csv of all nodes'

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

rmse_result = [];
used_time = [];
column = 1;
row = 1;
predict_time = [];

tt=1;
for w = [0 1:3:52]
    predict_time(1, tt) = 3.6 * w;
    tt = tt + 1;
end


for L = 25:3:82
    
    string = ['all nodes :: L = ', num2str(L), ' (25:3:82)']
    
    column = 1;
    for w = 1:3:52
        rmse_sum = 0;
        for t = L:L+19
            sum_of_square_error = 0;
            for node = 1:47
                load(['simu_', num2str(time(t+w, 1)), '.mat']);
                centered_temp_of_real_clus = val(clustered_group(node));
                load(['simu_predict_t_', num2str(time(t, 1)),'_L_',num2str(L*3.6),'_w_',num2str(w*3.6),'.mat']);
                centered_temp_of_pred_clus = val(clustered_group(node));
                sum_of_square_error = sum_of_square_error + (centered_temp_of_pred_clus - centered_temp_of_real_clus)^2;
            end
            root_mean_square_error = sqrt(sum_of_square_error / 47); 
            rmse_sum = rmse_sum + root_mean_square_error;
        end
        rmse_average = rmse_sum / 20;
        rmse_result(row, column) = rmse_average;
        column = column+1;
        
    end
    used_time(row, 1) = time(L, 1);
    row = row+1;
end

rmse_result = [used_time rmse_result];
rmse_result = [predict_time; rmse_result];

csvwrite('rmse_all_L_25_82_w_1_52.csv', rmse_result);
        

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

string = 'making group...'

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


group = [];
group1 = 1;
group2 = 1;
group3 = 1;


for node = 1:47
    
    string = ['node ', num2str(node), ' grouping...']
    
    sum_diff = 0;
    diff = 0;
    
    for L = 25:3:82
        for w = 1:3:52
            for t = L:L+19
                load(['simu_', num2str(time(t+w, 1)), '.mat']);
                centered_temp_of_real_clus = val(clustered_group(node));
                load(['simu_predict_t_',num2str(time(t, 1)),'_L_',num2str(L*3.6),'_w_',num2str(w*3.6),'.mat']);
                centered_temp_of_pred_clus = val(clustered_group(node));  
                sum_diff = sum_diff+abs(centered_temp_of_pred_clus - centered_temp_of_real_clus);
            end
        end
    end
    
    diff = sum_diff / (20*18*20);
    
    if diff<30
        group(1, group1) = node;
        group1 = group1  + 1;
    elseif diff<60
            group(2, group2) = node;
            group2 = group2 + 1;
    else
        group(3, group3) = node;
        group3 = group3 + 1;
    end    
          
end     


group1 = group1 - 1;
group2 = group2 - 1;
group3 = group3 - 1;




csvwrite('group.csv', group);
     


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

string = 'make csv of group1'

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

rmse_result = [];
used_time = [];
column = 1;
row = 1;
predict_time = [];

tt=1;
for w = [0 1:3:52]
    predict_time(1, tt) = 3.6 * w;
    tt = tt + 1;
end




for L = 25:3:82
    
    string = ['group 1 :: L = ', num2str(L), ' (25:3:82)']
    
    column = 1;
    for w = 1:3:52
        rmse_sum = 0;
        for t = L:L+19
            sum_of_square_error = 0;
            for node = group(1, 1:group1)
                load(['simu_', num2str(time(t+w, 1)), '.mat']);
                centered_temp_of_real_clus = val(clustered_group(node));
                load(['simu_predict_t_', num2str(time(t, 1)),'_L_',num2str(L*3.6),'_w_',num2str(w*3.6),'.mat']);
                centered_temp_of_pred_clus = val(clustered_group(node));
                sum_of_square_error = sum_of_square_error + (centered_temp_of_pred_clus - centered_temp_of_real_clus)^2;
            end
            root_mean_square_error = sqrt(sum_of_square_error / group1); 
            rmse_sum = rmse_sum + root_mean_square_error;
        end
        rmse_average = rmse_sum / 20;
        rmse_result(row, column) = rmse_average;
        column = column+1;
        
    end
    used_time(row, 1) = time(L, 1);
    row = row+1;
end

rmse_result = [used_time rmse_result];
rmse_result = [predict_time; rmse_result];

csvwrite('rmse_group1_L_25_82_w_1_52.csv', rmse_result);



     

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

string = 'make csv of group2'

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

rmse_result = [];
used_time = [];
column = 1;
row = 1;
predict_time = [];

tt=1;
for w = [0 1:3:52]
    predict_time(1, tt) = 3.6 * w;
    tt = tt + 1;
end


for L = 25:3:82
    
    string = ['group 2 :: L = ', num2str(L), ' (25:3:82)']
    
    column = 1;
    for w = 1:3:52
        rmse_sum = 0;
        for t = L:L+19
            sum_of_square_error = 0;
            for node = group(2, 1:group2)
                load(['simu_', num2str(time(t+w, 1)), '.mat']);
                centered_temp_of_real_clus = val(clustered_group(node));
                load(['simu_predict_t_', num2str(time(t, 1)),'_L_',num2str(L*3.6),'_w_',num2str(w*3.6),'.mat']);
                centered_temp_of_pred_clus = val(clustered_group(node));
                sum_of_square_error = sum_of_square_error + (centered_temp_of_pred_clus - centered_temp_of_real_clus)^2;
            end
            root_mean_square_error = sqrt(sum_of_square_error / group2); 
            rmse_sum = rmse_sum + root_mean_square_error;
        end
        rmse_average = rmse_sum / 20;
        rmse_result(row, column) = rmse_average;
        column = column+1;
        
    end
    used_time(row, 1) = time(L, 1);
    row = row+1;
end

rmse_result = [used_time rmse_result];
rmse_result = [predict_time; rmse_result];

csvwrite('rmse_group2_L_25_82_w_1_52.csv', rmse_result);



     

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

string = 'make csv of group3'

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

rmse_result = [];
used_time = [];
column = 1;
row = 1;
predict_time = [];

tt=1;
for w = [0 1:3:52]
    predict_time(1, tt) = 3.6 * w;
    tt = tt + 1;
end


for L = 25:3:82
    
    string = ['group 3 :: L = ', num2str(L), ' (25:3:82)']
    
    column = 1;
    for w = 1:3:52
        rmse_sum = 0;
        for t = L:L+19
            sum_of_square_error = 0;
            for node = group(3, 1:group3)
                load(['simu_', num2str(time(t+w, 1)), '.mat']);
                centered_temp_of_real_clus = val(clustered_group(node));
                load(['simu_predict_t_', num2str(time(t, 1)),'_L_',num2str(L*3.6),'_w_',num2str(w*3.6),'.mat']);
                centered_temp_of_pred_clus = val(clustered_group(node));
                sum_of_square_error = sum_of_square_error + (centered_temp_of_pred_clus - centered_temp_of_real_clus)^2;
            end
            root_mean_square_error = sqrt(sum_of_square_error / group3); 
            rmse_sum = rmse_sum + root_mean_square_error;
        end
        rmse_average = rmse_sum / 20;
        rmse_result(row, column) = rmse_average;
        column = column+1;
        
    end
    used_time(row, 1) = time(L, 1);
    row = row+1;
end

rmse_result = [used_time rmse_result];
rmse_result = [predict_time; rmse_result];

csvwrite('rmse_group3_L_25_82_w_1_52.csv', rmse_result);
