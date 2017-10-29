function q2(n)
    %Load du lieu
    imgTestAllLoad = load('data/imgTestImagesAll.mat');
    lblTestAllLoad = load('data/lblTestLabelsAll.mat');
    imgTestAll = imgTestAllLoad.imgTestImagesAll;
    lblTestAll = lblTestAllLoad.lblTestLabelsAll;
    % Show anh test thu n
    figure;
    img = imgTestAll (:,n);
    img2D = reshape(img, 112,92);
    strLabelImage = num2str (lblTestAll(n));
    imshow (img2D);
    title(strLabelImage);
end