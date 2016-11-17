close all;
clear all;

diff = csvread('diff_result.csv');

for line = 2:1171 %2:1171
    
close all;

value_node = diff(1, 3:end);
value_diff = diff(line, 3:end);

for index = 1:47
    for indexx = (index+1):47
        if (value_diff(1,index)<value_diff(1,indexx))
            temp_node = value_node(1,index);
            value_node(1,index) = value_node(1,indexx);
            value_node(1,indexx) = temp_node;
            temp_diff = value_diff(1,index);
            value_diff(1,index) = value_diff(1,indexx);
            value_diff(1,indexx) = temp_diff;
        end
    end
end

figure(line);
bar(1:47, value_diff);
for ii=1:47
    text(ii-0.3,value_diff(1,ii)+7,num2str(value_node(1,ii)),'FontSize',6);
end

title(['difference when L = ',num2str(diff(line,1)),' & w = ',num2str(diff(line,2))]);
saveas(figure(line),['diff_result_L_',num2str(diff(line,1)),'_w_',num2str(diff(line,2)),'.png']);

end