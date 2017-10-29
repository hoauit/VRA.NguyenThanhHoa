function q1(n)
    %Load du lieu
    imgTrainAllLoad = load('data/imgTrainImagesAll.mat');
    lblTrainAllLoad = load('data/lblTrainLabelsAll.mat');
    imgTrainAll = imgTrainAllLoad.imgTrainImagesAll;
    lblTrainAll = lblTrainAllLoad.lblTrainLabelsAll;
    
    %Show hinh anh n
    figure;
    img = imgTrainAll (:,n);
    img2D = reshape(img, 112,92);
    strLabelImage = num2str (lblTrainAll(n));
    imshow (img2D);
    title(strLabelImage);
end