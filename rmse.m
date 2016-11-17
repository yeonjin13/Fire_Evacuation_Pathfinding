
dynamics = csvread('NEW_data.csv');
time = dynamics(2:end, 1);

sum_of_square_error = 0;
for tt=41:50 %1:76
    time_select=23+3*tt; 
for temp=1:27 %1:27
    n=7+3*temp;% NEW_DATA.csv 에서 n+2번째 줄의 시간 사용
for i=1:47 %1:47
    
    load(['simu_',num2str(time(time_select, 1)),'.mat']);
    centered_temp_of_real_clus = centered_temp(clustered_group(i));
    
    load(['simu_predict_',num2str(time(time_select, 1)), '_', num2str(time(time_select+n, 1)),'.mat']);
    centered_temp_of_pred_clus = centered_temp(clustered_group(i));
    
    sum_of_square_error = (centered_temp_of_pred_clus - centered_temp_of_real_clus)^2;
end

root_mean_square_error = sqrt(sum_of_square_error / 47);


figure(time_select*1000+n);

load(['simu_',num2str(time(time_select, 1)),'.mat']);

subplot(1,2,1);
im = imread('map.png');
imshow(im);
hold on;

cc=hsv(nbStates);
for i=nbStates:-1:1 %nbStates=12 # of cluster=12
    tmp_idx = find(clustered_group == i);
    for j=1:length(tmp_idx)
        tmp_node_id = tmp_idx(j);
        %convt_x = 255/(17.2-0.8)*(org_x-0.8)+30;
        %convt_y = 665/(0.8-50.2)*(org_y-0.8)+680;
        
        plot(255/(17.2-0.8)*(node_info(tmp_node_id,2)-0.8)+30, 665/(0.8-50.2)*(node_info(tmp_node_id,3)-0.8)+680, 'o', 'color', cc(i,:), 'MarkerFaceColor', cc(i,:));
    end
    text((255/(17.2-0.8)*(transMu(1,i)*(max_X-min_X)+min_X)+1-0.8)+30, 665/(0.8-50.2)*(transMu(2,i)*(max_Y-min_Y)+min_Y-0.8)+680, [num2str(i),'(',num2str(round(transMu(4,i)*(max_T-min_T)+min_T)),')'], 'EdgeColor',cc(i,:));
    %i:군의 번호  %location of center of each clustering
end

title('left: predict, right: real');


load(['simu_predict_',num2str(time(time_select, 1)), '_', num2str(time(time_select+n, 1)),'.mat']);
subplot(1,2,2);

im = imread('map.png');
imshow(im);
hold on;

cc=hsv(nbStates);
for i=nbStates:-1:1 %nbStates=12 # of cluster=12
    tmp_idx = find(clustered_group == i);
    for j=1:length(tmp_idx)
        tmp_node_id = tmp_idx(j);
        %convt_x = 255/(17.2-0.8)*(org_x-0.8)+30;
        %convt_y = 665/(0.8-50.2)*(org_y-0.8)+680;        
        plot(255/(17.2-0.8)*(node_info(tmp_node_id,2)-0.8)+30, 665/(0.8-50.2)*(node_info(tmp_node_id,3)-0.8)+680, 'o', 'color', cc(i,:), 'MarkerFaceColor', cc(i,:));
    end
    text((255/(17.2-0.8)*(transMu(1,i)*(max_X-min_X)+min_X)+1-0.8)+30, 665/(0.8-50.2)*(transMu(2,i)*(max_Y-min_Y)+min_Y-0.8)+680, [num2str(i),'(',num2str(round(transMu(4,i)*(max_T-min_T)+min_T)),')'], 'EdgeColor',cc(i,:));
    %i:군의 번호  %location of center of each clustering
end

title(['rmse = ',num2str(root_mean_square_error)]);

saveas(figure(time_select*1000+n),['result',num2str(time(time_select, 1)),'_',num2str(time(time_select+n,1)-time(time_select, 1)),'.png']);

end
end