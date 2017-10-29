function q4()
    %Load du lieu
    lblTestAllLoad = load('data/lblTestLabelsAll.mat');
    lblTestAll = lblTestAllLoad.lblTestLabelsAll;

    nLabelsTest = size(lblTestAll, 2);
    fprintf('Tong so label: %d\n',nLabelsTest);
    countLabel = zeros(1, 40);
    for i = 1:nLabelsTest
       countLabel(lblTestAll(i)) = countLabel(lblTestAll(i)) + 1;
    end
   
    for j = 1:40
    fprintf('So anh co label %d: %d\n', j, countLabel(j));
    end
end