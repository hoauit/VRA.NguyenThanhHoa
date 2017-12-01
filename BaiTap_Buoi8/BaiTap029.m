function BaiTap029
    strFolderDataTrain = fullfile('../BaiTap_Buoi7/DataTrain');
    categories = {'0','1','2','3','4','5','6','7','8','9'};
    idmsDataTrain = imageDatastore(fullfile(strFolderDataTrain, categories), 'LabelSource', 'foldernames');
    idmsDataTrain.ReadFcn = @(filename)readAndPreprocessImage(filename);
    net = alexnet();
    featureLayer = 'fc7';
    featuresDataTrain = activations(net, imdsDataTrain, featureLayer, 'MiniBatchSize', 32, 'OutputAs', 'columns');
    lblDataTrain = imdsDataTrain.Labels;
    classifier = fitcecoc(featuresDataTrain, lblDataTrain, 'Learners', 'Linear', 'Coding', 'onevsall', 'ObservationIn', 'columns');
    
    strFolderDataTest = fullfile('../BaiTap_Buoi7/DataTest');
    categories = {'0','1','2','3','4','5','6','7','8','9'};
    idmsDataTest = imageDatastore(fullfile(strFolderDataTest, categories), 'LabelSource', 'foldernames');
    idmsDataTest.ReadFcn = @(filename)readAndPreprocessImage(filename);
    featuresDataTest = activations(net, idmsDataTest, featureLayer, 'MiniBatchSize', 32);
    lblActualDataTest = idmsDataTest.Labels;
    
    lblResult = predict(classifier, featuresDataTest);
    nResult = (lblActualDataTest == lblResult);
    nCount = sum(nResult);
    fprintf('\nSo luong mau dung la: %d\n', nCount);
end