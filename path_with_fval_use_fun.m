close all;
clear all;

%% Declare
connectnode = csvread('connected_node_total.csv');
node_location = csvread('node_location3.csv');


%first_node = 27;  %최초 시작노드
%exit = [10, 11, 14, 16]; %2
exit = [1 2 10 11 12 13 14 15 38]; %3

%3용


score=[3;29;8;90;85;40;17;43;42;73;41;95;91;95;35;29;89;21;13;52;90;40;22;8;93;60;38;66;79;33;69;20;96;71;17;44;63;93;53;63;68;92;15;41;31;69;89];
%score = int32(rand(size(connectnode,1), 1).*99.9);
%score = ones(size(connectnode,1), 1).*99;
reliability=[49;81;33;55;39;90;68;83;11;28;77;22;3;44;94;26;57;36;3;50;83;26;5;25;66;33;66;1;72;39;3;41;72;92;98;98;90;86;80;55;42;13;65;86;27;84;7];
%reliability = int32(rand(size(connectnode,1), 1).*99.9);
%reliability = ones(size(connectnode,1), 1).*99;

for first_node = 18:2:40
    first_node
    
    [X, f] = fun_path_find_result3(connectnode, first_node, exit, score, reliability, node_location,  first_node);
    hold on;
    node_num = size(connectnode,1);
    left_val = length(f)/node_num;
    
    axis([-5 40 -5 105]);
    
    %f_result = [];
    %while left_val ~= 0
    %    f_result = [f_result; f(1:node_num)];
    %    f(1:node_num) = [];
    %    left_val = left_val-1;
    %end
    
    %total_route = csvread('route2.csv');
    %total_score = [];
    
    %for index = 1:size(total_route,1)
    %   route = total_route(index, :);
    %   route(find(route == 0))=[];
    %   total_score = [total_score, find_score(f, route)];
    %end
    
    %total_score = total_score'
    
    %%
    
    %max_score_route = total_route(find(total_score == min(total_score)), :);
    %
    %max_score_route(find(max_score_route == 0))=[];

    %x = node_location (:, 1) * 2;
    %y = node_location (:, 2) * 2;
    
    %for j=1:length(max_score_route)-1
    %    prev_node = max_score_route(j);
    %    start_node = max_score_route(j+1);
    
    %    tempx = [x(prev_node), x(start_node)];
    %    tempy = [y(prev_node), y(start_node)];
    %    plot( tempx, tempy, 'xg', 'LineWidth', 2);
    %    hold on;

    %end

    %find(X==1)

end