close all;
clear all;

%% Declare
connectnode = csvread('connected_node_final.csv');
first_node = 27;
exit = [1 2 7 15 16 18 30 38 39];
node_location = csvread('node_location_final.csv');
real_temp = csvread('real_temp_per_node.csv');

time = 10; % 실제 시간은 time*3.6 % time = L+w
score = real_temp(time+1, 2:end);
reliability = zeros(size(connectnode,1), 1);

node_num = size(connectnode,1);
start_node = first_node; %각 루프마다 시작노드

f = ones(1, node_num*node_num);
Aeq = [];
beq = [];
Aineq = [];
bineq = [];

% declare f=================================================
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

for i = 1:length(r)
   if r(i) == 0
       r(i) = 0.1;
   end
end

d = ones(1, node_num*node_num);

for k=1:size(node_location,1);
    start_loc = node_location(k, :);
  for m=1:size(node_location,1);
       dest_loc = node_location(m, :);
        l = int32(sqrt(power(start_loc(1)-dest_loc(1),2)+power(start_loc(2)-dest_loc(2),2))*1000);
        d(1, (k-1)*node_num+m) = l^2;
        if l == 0
           d(1, (k-1)*node_num+m) = 10000000;
        end
    end
end

f = t.*d.*r;
%f = (t.*d)./r;

for i = 1:length(f)
   if f(i) == 0
       f(i) = 100000000;
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

figure(1);
x = node_location (:, 1) * 2;
y = node_location (:, 2) * 2;

plot (x, y, 'bo', 'MarkerFaceColor', 'b', 'MarkerSize', 3);
axis([min(x)-1, max(x)+1, min(y)-1, max(y)+1]);
hold on;

for i = 1:node_num
    connect_select = connectnode(i, : );
    list_length = length(find(connect_select > 0));
    connect_select = connect_select(1, 1:list_length);    
    
    for j = 1:list_length
        tempx = [x(i), x(connect_select(j))];
        tempy = [y(i), y(connect_select(j))];
        plot( tempx, tempy, '-g');
        hold on;
    end
    
    text( x(i)+0.5, y(i)+1, num2str(i));
    text( x(i)+0.5, y(i)-1.5, ['\color{red}', num2str(score(i))]);
    text( x(i)-0.8, y(i)-1.5, ['\color{blue}', num2str(reliability(i))]);
    

end

route = [first_node];

Xtemp = X((first_node-1)*node_num+1:(first_node-1)*node_num+node_num);
start_node = find(Xtemp == 1);
route = [route, start_node];
if x(first_node) <= (max(x)+min(x))/2
       text( x(first_node)-4, y(first_node)+0.4, ['\color{black}','\bf Start']);
else
       text( x(first_node)+1.3, y(first_node)+0.4, ['\color{black}','\bf Start']);
end
tempx = [x(first_node), x(start_node)];
tempy = [y(first_node), y(start_node)];
plot( tempx, tempy, '-r', 'LineWidth', 2);
hold on;

if ind == 1
    for idx = 1:length(find(X==1))+1
        prev_node = start_node;
        norm = (start_node-1)*node_num;
        Xtemp = X(norm+1:norm+node_num);
        start_node = find(Xtemp == 1);
        route = [route, start_node];
    
        tempx = [x(prev_node), x(start_node)];
        tempy = [y(prev_node), y(start_node)];
        plot( tempx, tempy, '-r', 'LineWidth', 2);
        hold on;
    end
end

for t = exit
   if x(t) <= (max(x)+min(x))/2
       text( x(t)-3.5, y(t)+0.2, ['\color{black}','\bf Exit']);
   else
       text( x(t)+1.5, y(t)+0.2, ['\color{black}','\bf Exit']);
   end
end
title(['fval = ', num2str(fval), ' / red = temperature / blue = reliabilty']);

hold on;
node_num = size(connectnode,1);
left_val = length(f)/node_num;

axis([-5 40 -5 105]);

find(X==1)


route
max(x)
min(x)
(max(x)+min(x))/2
fval
