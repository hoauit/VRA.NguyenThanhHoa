function BaiTap20()
    imgI = imread('cameraman.tif');
    imgI = rgb2gray(imgI);
    arrPointI = detectHarrisFeatures(imgI);
    [arrfeatureI,arrValidPointI] = extractFeatures(imgI,arrPointI);
    figure;
    imshow(imgI);
    arrSubValidPointI = arrValidPointI.selectStrongest(20);
    hold on;
    plot(arrSubValidPointI);
end