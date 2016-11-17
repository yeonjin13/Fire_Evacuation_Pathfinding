       %clear Mu Pix Priors Sigma ans cc centered_temp char_vec char_vec_as_is clustered_group dynamics fire_temp i idx;
       %clear j nbStates nbVar numCol numRow num_times picked_time picked_time_idx test tmp_idx tmp_node_id transMu val
       % # of clusters
       nbStates = 15;

       node_info = load('fire_sensor_info.txt');

       min_X = min(node_info(:,2));
       max_X = max(node_info(:,2));
       min_Y = min(node_info(:,3));
       max_Y = max(node_info(:,3));
       min_Z = min(node_info(:,4));
       max_Z = max(node_info(:,4));
       
       y_dynamics= y;

       num_times = size(y_dynamics,1)-1;


       fire_temp = y;

       char_vec = [char_vec(1,:);char_vec(2,:);char_vec(3,:);fire_temp];
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
       clustered_group;
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
    
       save(['simu_predict_t_',num2str(time(time_select, 1)),'_L_',num2str(time_to_use*3.6),'_w_',num2str(n*3.6),'.mat']);
       
       
       