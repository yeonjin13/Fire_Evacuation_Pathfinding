close all;
clear all;

dynamics = csvread('diff_result.csv');
max_temp = max(max(dynamics(2:end, 2:end)));
time = dynamics(2:end, 1:2);

size(dynamics)
num_times = size(dynamics,1)-1;

node_info = load('fire_sensor_info.txt');

min_X = min(node_info(:,2));
max_X = max(node_info(:,2));

min_Y = min(node_info(:,3));
max_Y = max(node_info(:,3));

min_Z = min(node_info(:,4));
max_Z = max(node_info(:,4));


cc=jet(max_temp);

temp_basis = 0; %L값
temp_var = 1:45; %w값 (1:45)
time_idx=0;


for time_basis=1%:26
    for j=1%temp_var
        time_idx = time_idx+1; %time 변수에서 L값 뽑아내기 위해
        
        temp_per_time = dynamics(time_idx+1, 3:end);
        
        figure(temp_basis*100+j);
    
        im = imread('map.png');
        imshow(im);
        hold on;        
    
        for tmp_node_id = 1:47
            node_temp = int32(temp_per_time(tmp_node_id));        
            plot(255/(17.2-0.8)*(node_info(tmp_node_id,2)-0.8)+30, 603/(0.8-50.2)*(node_info(tmp_node_id,3)-0.8)+680, 'o', 'color', cc(node_temp,:), 'MarkerFaceColor', cc(node_temp,:));
        end
        %text((255/(17.2-0.8)*(transMu(1,i)*(max_X-min_X)+min_X)+1-0.8)+30, 665/(0.8-50.2)*(transMu(2,i)*(max_Y-min_Y)+min_Y-0.8)+680, [num2str(i),'(',num2str(round(transMu(4,i)*(max_T-min_T)+min_T)),')'], 'EdgeColor',cc(i,:));
        %i:군의 번호  %location of center of each clustering
    
        colorbar;
        title(['L is ', num2str(time(time_idx,1)),' % w is ', num2str(time(time_idx,2))]);
    end
end


tempMu=[transMu(1,:)*(max_X-min_X)+min_X;transMu(2,:)*(max_Y-min_Y)+min_Y];
transSigma = Sigma(:,:,idx');
