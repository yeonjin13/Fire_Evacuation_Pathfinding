char_vec = node_info(:,2:end)';
    
picked_time = dynamics(picked_time_idx+1,1)
    
if (picked_time_idx > num_times)
    error('out of time index');
end
    
fire_temp = dynamics(picked_time_idx+1, 2:end);
char_vec = [char_vec; fire_temp];
char_vec_as_is = char_vec;
    
min_T = min(fire_temp);
max_T = max(fire_temp);
    
if (min_X ~= max_X)
    char_vec(1,:) = (char_vec(1,:)-min_X)/(max_X-min_X);
end
if (min_Y ~= max_Y)
    char_vec(2,:) = (char_vec(2,:)-min_Y)/(max_Y-min_Y);
end
if (min_Z ~= max_Z)
    char_vec(3,:) = (char_vec(3,:)-min_Z)/(max_Z-min_Z);
end
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
%(진이)csvwrite(['result of gmm_',num2str(picked_time),'.csv'],test);
for i=1:length(clustered_group)
    clustered_group(i) = find(idx == clustered_group(i));
end
    
transMu = Mu(:,idx');
    

save(['simu_',num2str(picked_time),'.mat']); 

%% Save Mat을 해야 할까?
