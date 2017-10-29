function demoHog()
    imgTrainAll = loadMNISTImages('../Data/train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('../Data/train-labels.idx1-ubyte');
    
    img1D = imgTrainAll(:,1982);
    img2D = reshape(img1D,28,28);
    subplot(2,5,1);
    imshow(img2D);
    [featuresVector,visualHog] = extractHOGFeatures(img2D,'Cellsize',[2 2]);
    subplot(2,5,2);
    plot(visualHog);
    [featuresVector,visualHog] = extractHOGFeatures(img2D,'Cellsize',[4 4]);
    subplot(2,5,3);
    plot(visualHog);
    [featuresVector,visualHog] = extractHOGFeatures(img2D,'Cellsize',[8 8]);
    subplot(2,5,4);
    plot(visualHog);
    
    subplot(2,5,5);
    hist(featuresVector);
    
    img1D = imgTrainAll(:,1972);
    img2D = reshape(img1D,28,28);
    subplot(2,5,6);
    imshow(img2D);
    [featuresVector,visualHog] = extractHOGFeatures(img2D,'Cellsize',[2 2]);
    subplot(2,5,7);
    plot(visualHog);
    [featuresVector,visualHog] = extractHOGFeatures(img2D,'Cellsize',[4 4]);
    subplot(2,5,8);
    plot(visualHog);
    [featuresVector,visualHog] = extractHOGFeatures(img2D,'Cellsize',[8 8]);
    subplot(2,5,9);
    plot(visualHog);
    
    subplot(2,5,10);
    hist(featuresVector);
    
end