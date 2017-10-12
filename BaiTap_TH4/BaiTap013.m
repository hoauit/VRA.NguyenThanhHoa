function BaiTap013()
%% Load Data Train
strData = '../Data/train-images.idx3-ubyte'; 
strDataLabel = '../Data/train-labels.idx1-ubyte';
[imgDataTrain,lblDataTrain] = loadData(strData,strDataLabel);
%% Extract Features
featuresDataTrain = ExtractFeaturesLBP(imgDataTrain);
%% Build model KNN
Mdl = fitcknn(featuresDataTrain',lblDataTrain,'NumNeighbors',3);
%%  Load Data Test
strData = '../Data/t10k-images.idx3-ubyte'; 
strDataLabel = '../Data/t10k-labels.idx1-ubyte';
[imgDataTest,lblActualDataTest] = loadData(strData,strDataLabel);
%% Extract Features
featuresDataTest = ExtractFeaturesLBP(imgDataTest);
%%  Save Result 
lblResult = predict(Mdl,featuresDataTest');  
nResult = (lblResult == lblActualDataTest); 
nCount = sum(nResult);
fprintf('\nSo luong mau dung: %d\n',nCount);
end