% 시간별로 gmm.. 확률정보를 csv로 나오게 하는 코드였어
% 근데..

% # of clusters
nbStates = 15;

node_info = load('fire_sensor_info.txt');

min_X = min(node_info(:,2));
max_X = max(node_info(:,2));

min_Y = min(node_info(:,3));
max_Y = max(node_info(:,3));

min_Z = min(node_info(:,4));
max_Z = max(node_info(:,4));

dynamics= y;

num_times = size(dynamics,1)-1;

% picked_time_idx = num_times;
% picked_time_idx = 7;
% picked_time_idx = 20;

%for picked_time_idx=67:70
   % dynamics = csvread('NEW_data.csv');
    
   %size(dynamics)
    %char_vec = node_info(:,2:end)';
    
    %picked_time = dynamics(picked_time_idx+1,1)
    
%     if (picked_time_idx > num_times)
%         error('out of time index');
%     end
%     
    fire_temp = y;
    char_vec = [char_vec(1,:);char_vec(2,:);char_vec(3,:);fire_temp'];
    char_vec_as_is = char_vec;
    
    min_T = min(fire_temp);
    max_T = max(fire_temp);
    
    
    if (min_T ~= max_T)
        char_vec(4,:) = (char_vec(4,:)-min_T)/(max_T-min_T);
    end
    
    
    nbVar = size(char_vec,1);
    
    [Priors, Mu, Sigma] = EM_init_kmeans(char_vec, nbStates);
    
    
    
    [Priors, Mu, Sigma, Pix] = EM(char_vec, Priors, Mu, Sigma);
    
    
    [val clustered_group] = max(Pix');
    clustered_group
    [numRow numCol] = size(Pix);
    [[0:numCol]; [1:numRow]' Pix];
    
    centered_temp = Mu(4,:)*(max_T-min_T)+min_T;
    
    [val idx] = sortrows(centered_temp',-1);
    idx';
    val';
    
    test = [[0:numCol]; [1:numRow]' Pix(:,idx)];
    %csvwrite(['result of gmm_',num2str(picked_time),'.csv'],test);
    for i=1:length(clustered_group)
        clustered_group(i) = find(idx == clustered_group(i));
    end
    
    transMu = Mu(:,idx');
    
%     figure(picked_time_idx);
%     subplot(2,1,1);
%     hold on;
%     
%     
%     % for i=1:size(char_vec,2)
%     %     text(node_info(i,2), node_info(i,3), num2str(clustered_group(i)));
%     % end
%     
%     
%     cc=hsv(nbStates);
%     
%     for i=nbStates:-1:1
%         tmp_idx = find(clustered_group == i);
%         for j=1:length(tmp_idx)
%             tmp_node_id = tmp_idx(j);
%             plot(node_info(tmp_node_id,2), node_info(tmp_node_id,3), 'o', 'color', cc(i,:), 'MarkerFaceColor', cc(i,:));
%         end
%         %     plot(Mu(1,i)*(max_X-min_X)+min_X, Mu(2,i)*(max_Y-min_Y)+min_Y, 'x', 'color', cc(i,:), 'lineWidth', 2);
%         text(transMu(1,i)*(max_X-min_X)+min_X, transMu(2,i)*(max_Y-min_Y)+min_Y, [num2str(i),'(',num2str(round(transMu(4,i)*(max_T-min_T)+min_T)),')'], 'EdgeColor',cc(i,:));
%         
%     end
%     text(node_info(:,2)-1, node_info(:,3), num2str(fire_temp'));
%     
%     axis([0 20 0 60]);
%     title(['Using GMM Clustering: # of clusters = ', num2str(nbStates), ...
%         ' at ', num2str(picked_time), ' sec']);
%     
%     
%     subplot(2,1,2);
%     hold on;
%     plotGMM(Mu([1,2],:), Sigma([1,2],[1,2],:), [.8 0 0], 1);
%     
%     for i=1:size(char_vec,2)
%         text(char_vec(1,i), char_vec(2,i), num2str(i));
%     end
%     
%     title('Cluster Distribution Range');
%     orient portrait;
    %saveas(figure(picked_time_idx),['simu_predict_',num2str(time(time_select+1, 1)),'.png']);
    save(['simu_predict_',num2str(time(time_select, 1)), '_', num2str(time(time_select+n, 1)), '.mat']);
    %save(['simu_predict_',num2str(time(time_select+1, 1)),'.mat']);
    %print('-dpng', ['fire_sensor_clustering_time_',num2str(picked_time_idx),'.png']);
    %print('-depsc', ['fire_sensor_clustering_time_',num2str(picked_time_idx),'.eps']);
    
%end