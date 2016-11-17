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

time_to_use = 2    %time_selct 부터 몇 개 전부터 사용할 것인지 = 사용할 시간의 총 개수                                        
time_select = 51   %사용할 timeLine의 마지막 시간 (엑셀에서 실제 칸-1)
time_to_find = 100  %time_select 부터 몇 개 까지 예측할 것인지.
    
 y=[];
 coeff=[];
 
 for i=1:47 %i is node number
     coeff = [coeff;find_fit_coefficients(time(time_to_use:time_select, 1), dynamics(time_to_use+1:time_select+1,i+1))'];
     %y = [y, coeff(i,1).*time(2:time_select+1+time_to_find, 1).^2+ coeff(i,2).*time(2:time_select+1+time_to_find, 1).^1.5+coeff(i,3).*(log(time(2:time_select+1+time_to_find, 1)))+coeff(i,4)]; %그 시간의 모든 노드들의 온도값을 저장     
     y = [y, coeff(i,1).*log(0.133*time(2:end, 1)+1)+ coeff(i,2)];
     %y = [y, coeff(i,1).*time(2:end, 1).^2+ coeff(i,2).*time(2:end, 1).^1.5+coeff(i,3).*(log(time(2:end, 1)))+coeff(i,4)]; %그 시간의 모든 노드들의 온도값을 저장     
 end
 
 
 for i=1:47 %:47 %i is node number
    figure(i);    

    plot(dynamics(2:end,1),dynamics(2:end,i+1),'.', 'color', 'g', 'MarkerFaceColor', 'g');
    %axis([0 4000 0 1000]); %축정해주기 [min_x max_x min_y max_y]
     
    hold on;
    plot(time(time_to_use:time_select,1), y(time_to_use:time_select,i), 'r--');
    
    hold on;
    plot(time((time_select):(time_select+time_to_find),1), y((time_select):(time_select+time_to_find),i), 'x', 'color', 'r', 'MarkerFaceColor', 'r');
    
    title(['graph for node ',num2str(i),' & L = ',num2str(time(time_select,1))]);
%    saveas(figure(i),['graph_node_',num2str(i),'_L_',num2str(time(time_select,1)),'.png']);
 end
 
