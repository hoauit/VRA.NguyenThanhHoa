function q1(n)
    %Load du lieu
    imgTrainAll = loadMNISTImages ('train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels ('train-labels.idx1-ubyte');
    imgTestAll = loadMNISTImages ('t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels ('t10k-labels.idx1-ubyte');

    figure;
    img = imgTrainAll (:,n);
    img2D = reshape(img, 28,28);
    strLabelImage = num2str (lblTrainAll(n));
    imshow (img2D);
    title(strLabelImage);
end