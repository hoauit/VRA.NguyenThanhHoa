function q3()
    %Load du lieu
    lblTrainAllLoad = load('data/lblTrainLabelsAll.mat');
    lblTrainAll = lblTrainAllLoad.lblTrainLabelsAll;

    nLabelsTrain = size(lblTrainAll, 2);
    fprintf('Tong so label: %d\n',nLabelsTrain);
    countLabel = zeros(1, 40);
    for i = 1:nLabelsTrain
       countLabel(lblTrainAll(i)) = countLabel(lblTrainAll(i)) + 1;
    end
   
    for j = 1:40
    fprintf('So anh co label %d: %d\n', j, countLabel(j));
    end
end