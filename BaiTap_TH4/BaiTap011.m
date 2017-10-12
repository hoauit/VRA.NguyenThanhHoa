function BaiTap011()
    imgTrainAll = loadMNISTImages('../Data/train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('../Data/train-labels.idx1-ubyte');
    nBins = 256;
    nNumTrainImages = size(imgTrainAll,2); 
    imgTrainAll_hist=zeros(nBins,nNumTrainImages); 
    for i = 1:nNumTrainImages
        imgTrainAll_hist(:,i) = imhist(imgTrainAll(:,i),nBins); 
    end
    Mdl = fitcknn(imgTrainAll_hist',lblTrainAll,'NumNeighbors',1);
    imgTestAll = loadMNISTImages ('../Data/t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels ('../Data/t10k-labels.idx1-ubyte');
    nBins = 256;
    nNumTestImages = size(imgTestAll,2); 
    imgTestAll_hist = zeros(nBins,nNumTestImages); 
    for i = 1:nNumTestImages
        imgTestAll_hist(:,i) = imhist(imgTestAll(:,i),nBins);
    end
    lblResult = predict(Mdl,imgTestAll_hist'); 
    nResult = (lblResult == lblTestAll);
    nCount = sum(nResult);
    fprintf('\nSo luong mau dung: %d\n',nCount);
end