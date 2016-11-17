
close all;
clear all;

dynamics = csvread('diff_result.csv');
node_info = load('fire_sensor_info.txt');

time = dynamics(2:end, 1:2);
dynamics = dynamics(2:end,3:end);
max_temp = max(max(dynamics));

im = imread('map.png');


for i=1:size(dynamics,1)
    figure(i);
    imshow(im);
    hold on;
    
    for j=1:size(node_info,1)
        org_x = node_info(j,2);
        org_y = node_info(j,3);

        convt_x = 255/(17.2-0.8)*(org_x-0.8)+30;
        convt_y = 665/(0.8-50.2)*(org_y-0.8)+680;
        
        temperature = dynamics(i,j);
        if (temperature > 100)
            temperature = 100;
        end

        scatter(convt_x, convt_y, 40, temperature, 'filled');
    end
    set(gca, 'CLim', [0, 100]); 
    colorbar;
    
    title(['L is ', num2str(time(i,1)), ' & w is ', num2str(time(i,2))]);
    
    orient portrait;
    
    saveas(figure(i), ['L_', num2str(time(i,1)), '_w_', num2str(time(i,2)), '_100.png']);
    close(figure(i));


end
    
    
% scatter(260, 560, 100, 'filled');
% scatter(180, 350, 100, 'filled');
% scatter(320, 120, 100, 'filled');
