subplot(1,2,1);
im = imread('map.png');
imshow(im);
hold on;

cc=hsv(nbStates);
for i=nbStates:-1:1%nbStates=12 # of cluster=12
    tmp_idx = find(clustered_group == i);
    for j=1:length(tmp_idx)
        tmp_node_id = tmp_idx(j);
        %convt_x = 255/(17.2-0.8)*(org_x-0.8)+30;
        %convt_y = 665/(0.8-50.2)*(org_y-0.8)+680;
        
        plot(255/(17.2-0.8)*(node_info(tmp_node_id,2)-0.8)+30, 665/(0.8-50.2)*(node_info(tmp_node_id,3)-0.8)+680, 'o', 'color', cc(i,:), 'MarkerFaceColor', cc(i,:));
    end
    text((255/(17.2-0.8)*(transMu(1,i)*(max_X-min_X)+min_X)+1-0.8)+30, 665/(0.8-50.2)*(transMu(2,i)*(max_Y-min_Y)+min_Y-0.8)+680, [num2str(i),'(',num2str(round(transMu(4,i)*(max_T-min_T)+min_T)),')'], 'EdgeColor',cc(i,:));
    %i:군의 번호  %location of center of each clustering
end

tempMu=[transMu(1,:)*(max_X-min_X)+min_X;transMu(2,:)*(max_Y-min_Y)+min_Y];
transSigma = Sigma(:,:,idx');
subplot(1,2,2);
%     imshow(im);
hold on;
for i=nbStates:-1:1%%
    plotGMM(transMu([1,2],i),  transSigma([1,2],[1,2],i), cc(i,:,1),1);
end
hold on;
for i=1:size(char_vec,2)
    text(char_vec(1,i), char_vec(2,i), num2str(i));
end