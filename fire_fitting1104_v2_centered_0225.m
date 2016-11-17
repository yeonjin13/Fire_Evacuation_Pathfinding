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
%=========================================cf c gvbv fcdx=========================

%% Find coefficient of function
%use find_fit_coefficients();
%============================================================
%format : find_fit_coefficients(time, node_data)
%         [Caution : coefficients can't treat 0 sec.]
%return coefficients "a, b, c, d" of function y= a.*x1.^2+b.*x1.^1.5+c.*(log(x1))+d
%============================================================
coef = [0;0;0;0];

cc=hsv(47);

% time_to_use = 2 , time_select = 26 , n = 10
%   => 25~26로 26+10을 예측

%L 61:84 / t 10:L /w 10:69

%현재 L 63 / t 41 / n 44 (63은 여기부터 돌려야함)
% 65 29 10 부터 돌리기  = 2번 돌려야함
  
for time_to_use = 52:3:76 %64:84  % time_select+1번째 줄의 시간까지를 이용 
    for time_select = time_to_use:2:(time_to_use+18) %time_selct 부터 몇 개 전부터 사용할 것인지 = 사용할 시간의 총 개수  
        for n= 10:69 %int32(time_select/3)-2:1:int32(time_select/3)+2
            string=['time_select: ', num2str(time_select),  ' / time_to_use: ', num2str(time_to_use),' / n: ', num2str(n)]
            load(['simu_',num2str(time(time_select, 1)),'.mat'])
            figure((time_select)*100);
            plot_current_situ        
            y=[];
            coeff=[]; 
            for i=1:47 %i is node number  
                coeff = [coeff;find_fit_coefficients_centered(time((time_select-time_to_use+1):time_select, 1), dynamics((time_select-time_to_use+2):time_select+1,i+1))'];
                y = [y, coeff(i,1).*log(0.133*time(time_select+n, 1)+1)+ coeff(i,2)]; %그 시간의 모든 노드들의 온도값을 저장     
            end
            
            while(true)
                try
                    fire_sensor_analysis_gaussian_v4_create_mat_centered_0225
                    break;
                catch err
                    kook= 'nun nal gundeuryutSSu'
                    continue;
                end
            end

            load(['simu_predict_t_',num2str(time(time_select, 1)),'_L_',num2str(time_to_use*3.6),'_w_',num2str(n*3.6),'.mat']);
            % L (time_to_use) 사용할 시간의 수
            % t (time_select) 기준 시간
            % w (n) 예측 시간
            figure((time_select)*100+n);
            plot_current_situ
            close all;
        end
    end
end

