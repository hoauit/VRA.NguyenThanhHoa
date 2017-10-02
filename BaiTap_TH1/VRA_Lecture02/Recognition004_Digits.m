function Recognition004_Digits()
    imgTrainAll = loadMNISTImages ('train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels ('train-labels.idx1-ubyte');
    imgTestAll = loadMNISTImages ('t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels ('t10k-labels.idx1-ubyte');

    nTrainImages = size(imgTrainAll, 2);
    nNumber = randi ([1 nTrainImages]);
    
    figure;
    img = imgTrainAll(:, nNumber);
    img2D = reshape (img, 28, 28);
    strLabelImage = num2str(lblTrainAll(nNumber));
    strLabelImage = [strLabelImage, '(',num2str(nNumber),')'];
    imshow(img2D);
    title(strLabelImage);
    
    nTestImgs =size(imgTestAll, 2);
    nNumber = randi ([1 nTestImgs]);
    figure;
    img = imgTestAll(:, nNumber);
    img2D=reshape(img, 28, 28);
    strLabelImage= num2str(lblTestAll(nNumber));
    strLabelImage = [strLabelImage, '(',num2str(nNumber),')'];
    imshow(img2D);
    title(strLabelImage);
    
    
end