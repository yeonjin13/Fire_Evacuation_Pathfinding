% Data prediction
close all;
clear all;

%% Data grouping

dynamics = csvread('centered_temp_per_node.csv');%('medium_raw_data_temperature.csv');
time = dynamics(2:end, 1);  %time %3.61~1436.4
 
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

% plot current situ까지 한 파일 3:3:84 & 4:3:82
for time_to_use = 2:3:83 %(진이)2:84 %(연진)85:130 %L
    time_to_use
    for n=3:3:51 %w
        for time_select = time_to_use:time_to_use+19 %t
            load(['simu_',num2str(time(time_select, 1)),'.mat']);
            %figure(time_to_use*1000 + n*10);
            %plot_current_situ 
            
            y=[];
            coeff=[]; 
            for i=1:47 %i is node number 
                coeff = [coeff;find_fit_coefficients_centered(time((time_select-time_to_use+1):time_select, 1), dynamics((time_select-time_to_use+2):time_select+1,i+1))'];
                y = [y, coeff(i,1).*log(0.133*time(time_select+n, 1)+1)+ coeff(i,2)]; %그 시간의 모든 노드들의 온도값을 저장 
            end
            
            while (true)
                try
                    fire_sensor_analysis_gaussian_v4_create_mat_centered
                    break;
                catch
                    time_to_use*1000 + n*10 + 7
                    continue;
                end
            end
            
            %load(['simu_predict_t_',num2str(time(time_select, 1)),'_L_',num2str(time_to_use*3.6),'_w_',num2str(n*3.6),'.mat']);
            %figure(time_to_use*1000 + n*10 + 1);
            %plot_current_situ
        end
        close all;
    end
end

