% Data prediction

close all;
clear all;


%% Data grouping

dynamics = csvread('NEW_data.csv');%('medium_raw_data_temperature.csv');


time = dynamics(2:end, 1);  %time
 
%==================================================================
%Each index of dynamics means-
%flash_line_4th = dynamics(2:end, 2:17); flash_line_5th = dynamics(2:end, 18:33);
%flash_oposite_line_4th = dynamics(2:end, 34:57);
%hall_line_4th = dynamics(2:end, 58:64); flash_point_4th = dynamics(2:end, 65:73);
%flash_point_5th = dynamics(2:end, 74:82);
%==================================================================

%% Find coefficient of function
%use find_fit_coefficients();
%============================================================
%format : find_fit_coefficients(time, node_data)
%         [Caution : coefficients can't treat 0 sec.]
%return coefficients "a, b, c, d" of function y= a.*x1.^2+b.*x1.^1.5+c.*(log(x1))+d
%============================================================
coef = [0;0;0;0];


cc=hsv(47);

% time_to_use =200    %time_selct 부터 몇 개 전부터 사용할 것인지 = 사용할 시간의 총 개수   %10:167
for time_select=89%:100%:100 %:100 %26:100 % time_select+1번째 줄의 시간까지를 이용     %:25:991%59:60 %55:86
    %for n=int32(tt/3)-2:1:int32(tt/3)+2 % time_select+n+1번째 줄의 시간을 예측
for n=40:50 %10:50 %10:90
    load(['simu_',num2str(time(time_select, 1)),'.mat']);
    figure((time_select)*100);
    plot_current_situ
    y=[];
    coeff=[]; 
    for i=1:47 %i is node number
        coeff = [coeff;find_fit_coefficients_centered(time(2:time_select, 1), dynamics(3:time_select+1, i+1))'];
        %coeff = [coeff;find_fit_coefficients(time(2:time_select, 1), dynamics(3:time_select+1,i+1))'];
        % coeff = [coeff;find_fit_coefficients(time((time_select-time_to_use+2):time_select+1, 1), dynamics((time_select-time_to_use+2):time_select+1,i+1))'];
        y = [y; coeff(i,1).*log(0.133*time(time_select+n, 1)+1)+ coeff(i,2)]; %그 시간의 모든 노드들의 온도값을 저장     
        %y = [y; coeff(i,1).*time(time_select+n, 1).^2+ coeff(i,2).*time(time_select+n, 1).^1.5+coeff(i,3).*(log(time(time_select+n, 1)))+coeff(i,4)]; %그 시간의 모든 노드들의 온도값을 저장
    end
    fire_sensor_analysis_gaussian_v4_create_mat
    load(['simu_predict_',num2str(time(time_select, 1)), '_', num2str(time(time_select+n, 1)),'.mat']);
    figure((time_select)*100+n);
    plot_current_situ
end
close all;
end
