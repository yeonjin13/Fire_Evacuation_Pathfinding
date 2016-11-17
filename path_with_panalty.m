close all;
clear all;


%% Declare
connectnode = csvread('connected_node2.csv');
node_num = size(connectnode,1);
first_node = 1;  %최초 시작노드
start_node = first_node; %각 루프마다 시작노드
exit = [11, 14, 16]; %2
%exit = [10, 16, 24]; %1

%score=[51;8;72;100;35;97;35;89;45;41;22;13;31;73;78;69];
%score = ones(size(connectnode,1), 1).*99;
score = int32(rand(size(connectnode,1), 1).*99.9);

%reliability=[1;84;92;77;4;38;70;73;22;27;67;48;62;24;18;83];
reliability = int32(rand(size(connectnode,1), 1).*99.9);
%reliability = ones(size(connectnode,1), 1).*99;

Aeq = [];
beq = [];
Aineq = [];
bineq = [];

% declare f=================================================
f = zeros(1, node_num*node_num); %connect with score

% t = temperature, r = reliablilty
t = f;
r = f;

for i = 1:node_num
    connect_select = connectnode(i, : );
    list_length = length(find(connect_select > 0));
    connect_select = connect_select(1, 1:list_length);  
    
    node_score = score(connect_select);
    node_r = reliability(connect_select);
    
    for j = 1:list_length
        t((i-1)*node_num+connect_select(j)) = node_score(j);
        r((i-1)*node_num+connect_select(j)) = node_r(j);
    end
end

for i = 1:length(t)
   if t(i) == 0
       t(i) = 100;
       r(i) = 0;
   end
end

% d = distance
d = ones(1, node_num*node_num);

node_location = csvread('node_location2.csv');

for k=1:size(node_location,1);
    start_loc = node_location(k, :);
   for m=1:size(node_location,1);
       dest_loc = node_location(m, :);
        l = int32(sqrt(power(start_loc(1)-dest_loc(1),2)+power(start_loc(2)-dest_loc(2),2))*1000);
        d(1, (k-1)*node_num+m) = l^2;
        if l == 0
            d(1, (k-1)*node_num+m) = 1000;
        end
    end
end

%f
f = (-1)*r./(t.*d);
for i = 1:length(f)
   if f(i) == 0
       f(i) = 10000;
   end
end

%declare Aeq beq=============================================
Aeq1 = [];
beq1 = [];

for j = 1:node_num
    if (length(find(exit==j))>0) || (j==start_node)
        continue;
    end
    
   tempAeq1 = [];
   for i = 1:node_num
       tempAeq1(1,(i-1)*node_num+j)=1;
       tempAeq1(1,i+(j-1)*node_num)=-1;
   end
   
   tempAeq1(1,(j-1)*node_num+j)=0;
   if(length(tempAeq1) ~= node_num)
      tempMat = zeros(1,node_num*node_num-length(tempAeq1));
      tempAeq1 = [tempAeq1, tempMat];
   end
   
   Aeq1 = [Aeq1 ; tempAeq1];
   beq1 = [beq1;0];
end

Aeq2 = zeros(1, node_num*node_num);
Aeq3 = zeros(1, node_num*node_num);
Aeq4 = zeros(1, node_num*node_num);
Aeq5 = zeros(1, node_num*node_num);

for j=1:node_num
    Aeq2(1,(first_node-1)*node_num+j) = 1;
    Aeq3(1, (j-1)*node_num+first_node) = 1;
    Aeq4(1, (j-1)*node_num+exit)=1;
    Aeq5(1, (exit-1).*node_num+j)=1;
end

beq2 = ones(1,1);
beq3 = zeros(1,1);
beq4 = ones(1,1);
beq5 = zeros(1,1);

Aeq = [Aeq1;Aeq2;Aeq3;Aeq4;Aeq5];
beq = [beq1;beq2;beq3;beq4;beq5];

%Aineq, bineq ==============================================
Aineq1 = zeros(1, node_num*node_num);
Aineq2 = zeros(1, node_num*node_num);

for j = 1:node_num
   for i = 1:node_num
       Aineq1(j,(i-1)*node_num+j)=1;
       Aineq2(j,i+(j-1)*node_num)=1;
   end
end

bineq1 = ones(node_num,1);
bineq2 = ones(node_num,1);

Aineq = [Aineq1; Aineq2];
bineq = [bineq1; bineq2];

%bintprog====================================================
[X, fval, ind] = bintprog(f, Aineq, bineq, Aeq, beq);

%% plotting and route find 

x = node_location (:, 1) * 2;
y = node_location (:, 2) * 2;

plot (x, y, 'bo', 'MarkerFaceColor', 'b', 'MarkerSize', 10);
axis([min(x)-1, max(x)+1, min(y)-1, max(y)+1]);
hold on;

for i = 1:node_num
    connect_select = connectnode(i, : );
    list_length = length(find(connect_select > 0));
    connect_select = connect_select(1, 1:list_length);    
    
    text( x(i)+0.2, y(i)+0.2, num2str(i));
    text( x(i)+0.2, y(i)-0.4, ['\color{red}', num2str(score(i))]);
    text( x(i)-0.3, y(i)-0.4, ['\color{blue}', num2str(reliability(i))]);
    
    for j = 1:list_length
        tempx = [x(i), x(connect_select(j))];
        tempy = [y(i), y(connect_select(j))];
        
        plot( tempx, tempy, '-b');
        hold on;
    end
end

route = [first_node];

Xtemp = X((first_node-1)*node_num+1:(first_node-1)*node_num+node_num);
start_node = find(Xtemp == 1);
route = [route, start_node];
text( x(first_node)-1, y(first_node)+0.4, ['\color{red}','\bf Start']);
tempx = [x(first_node), x(start_node)];
tempy = [y(first_node), y(start_node)];
plot( tempx, tempy, '-r', 'LineWidth', 2);
hold on;

while 1
    if ind <= -2
        break;
    end
    
    prev_node = start_node;
    norm = (start_node-1)*node_num;
    Xtemp = X(norm+1:norm+node_num);
    start_node = find(Xtemp == 1);
    route = [route, start_node];
    
    tempx = [x(prev_node), x(start_node)];
    tempy = [y(prev_node), y(start_node)];
    plot( tempx, tempy, '-r', 'LineWidth', 2);
    hold on;
    
    if ~isempty(find(exit == start_node, 1))
        disp(1)
        break;
    end
end

text( x(exit)-1, y(exit)+0.2, ['\color{red}','\bf Exit']);

route