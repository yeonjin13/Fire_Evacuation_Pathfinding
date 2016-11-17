close all;
clear all;



dynamics = csvread('NEW_data.csv');
time = dynamics(2:end, 1);



% NEW_DATA.csv 에서 n+2번째 줄의 시간 사용
%time_select=L, n=w
time_select = 26; 
n=10;

rmse_result = [];
column = 1; % of rmse_result
row = 1; % of rmse_result
used_time = [];

%% predict_time, time_select, n 만 수정하면서 돌리면 됩니다.

predict_time = [0 36:3.6:2851.2]; %[0 36:3.6:2851.2] %predict_time = [0 n에 들어갈 벡터]

for time_select = 26:3:167 %26:900
    column=1;
    for n=10:82 %10:90
        sum_of_square_error = 0;
        for ii=1:47
            load(['simu_',num2str(time(time_select+n, 1)),'.mat']);
            centered_temp_of_real_clus = val(clustered_group(ii));
    
            load(['simu_predict_',num2str(time(time_select, 1)), '_', num2str(time(time_select+n, 1)),'.mat']);
            centered_temp_of_pred_clus = val(clustered_group(ii));
    
            sum_of_square_error = sum_of_square_error + (centered_temp_of_pred_clus - centered_temp_of_real_clus)^2;
        end
        root_mean_square_error = sqrt(sum_of_square_error/47);
        rmse_result(row, column) = root_mean_square_error;
        column = column+1;
        
        when = ['L is ',num2str(time(time_select, 1)), ' & w is ', num2str(time(time_select+n, 1)), ' == ', num2str(root_mean_square_error)]
    end
    used_time(row, 1) = time(time_select,1);
    row = row+1;    
end

rmse_result = [used_time rmse_result];
rmse_result = [predict_time; rmse_result];

csvwrite('rmse_result_with_L_W.csv', rmse_result);
figure(1); % 확인하려고 넣음
%    figure(1);
%    load(['simu_predict_',num2str(time(time_select, 1)), '_', num2str(time(time_select+n, 1)),'.mat']);
%    subplot(1,2,1);
%    im = imread('map.png');
%    imshow(im);
%    hold on;

%    cc=hsv(nbStates);
%for i=nbStates:-1:1 %nbStates=12 # of cluster=12
%    tmp_idx = find(clustered_group == i);
%    for j=1:length(tmp_idx)
%        tmp_node_id = tmp_idx(j);
%        %convt_x = 255/(17.2-0.8)*(org_x-0.8)+30;
%        %convt_y = 665/(0.8-50.2)*(org_y-0.8)+680;
        
%        plot(255/(17.2-0.8)*(node_info(tmp_node_id,2)-0.8)+30, 665/(0.8-50.2)*(node_info(tmp_node_id,3)-0.8)+680, 'o', 'color', cc(i,:), 'MarkerFaceColor', cc(i,:));
%    end
%    text((255/(17.2-0.8)*(transMu(1,i)*(max_X-min_X)+min_X)+1-0.8)+30, 665/(0.8-50.2)*(transMu(2,i)*(max_Y-min_Y)+min_Y-0.8)+680, [num2str(i),'(',num2str(round(transMu(4,i)*(max_T-min_T)+min_T)),')'], 'EdgeColor',cc(i,:));
%    %i:군의 번호  %location of center of each clustering
%end

%title('left: predict, right: real');

%load(['simu_predict_',num2str(time(time_select, 1)),'.mat']);
%subplot(1,2,2);

%im = imread('map.png');
%imshow(im);
%hold on;

%cc=hsv(nbStates);
%for i=nbStates:-1:1 %nbStates=12 # of cluster=12
%    tmp_idx = find(clustered_group == i);
%    for j=1:length(tmp_idx)
%        tmp_node_id = tmp_idx(j);
%        %convt_x = 255/(17.2-0.8)*(org_x-0.8)+30;
%        %convt_y = 665/(0.8-50.2)*(org_y-0.8)+680;        
%        plot(255/(17.2-0.8)*(node_info(tmp_node_id,2)-0.8)+30, 665/(0.8-50.2)*(node_info(tmp_node_id,3)-0.8)+680, 'o', 'color', cc(i,:), 'MarkerFaceColor', cc(i,:));
%    end
%    text((255/(17.2-0.8)*(transMu(1,i)*(max_X-min_X)+min_X)+1-0.8)+30, 665/(0.8-50.2)*(transMu(2,i)*(max_Y-min_Y)+min_Y-0.8)+680, [num2str(i),'(',num2str(round(transMu(4,i)*(max_T-min_T)+min_T)),')'], 'EdgeColor',cc(i,:));
%    %i:군의 번호  %location of center of each clustering
%end

%title(['rmse = ',num2str(root_mean_square_error),' uses ', num2str(time(time_select,1))]);


