close all;
clear all;

%% Declare
connectnode = csvread('connected_node_total.csv');
node_location = csvread('node_location3.csv');

exit = [1 2 10 11 12 13 14 15 38];

first_node = 1;

dynamics = csvread('NEW_data.csv');
size(dynamics)
num_times = size(dynamics,1)-1;


%% find reliability

% # of clusters
nbStates = 15;
node_info = load('fire_sensor_info.txt');

min_X = min(node_info(:,2));
max_X = max(node_info(:,2));
min_Y = min(node_info(:,3));
max_Y = max(node_info(:,3));
min_Z = min(node_info(:,4));
max_Z = max(node_info(:,4));

rel_interval = 10; % from temp_orgin~3.6*(temp_origin+rel_interval)

for picked_time_idx = 1:rel_interval
    total_path_find_code_v3 %현재의 clustering 부르는 코드
end

%v2
%v4

%grouping


%% find reliability & predict temperature

%v3
%v2
%v4
%find score


%% bintporg part
[X, f] = fun_path_find_result3(connectnode, first_node, exit, temperature, reliability, node_location,  first_node);
hold on;
node_num = size(connectnode,1);
left_val = length(f)/node_num;
axis([-5 40 -5 105]);