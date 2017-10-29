function [featuresData] = extractFeaturesHog(imgData)
    img1D = imgTrainAll(:,1);
    img2D = reshape(img1D,28,28);
    subplot(2,5,1);
    imshow(img2D);
    [featuresVector,visualHog] = extractHOGFeatures(img2D,'Cellsize',[2 2]);

end
