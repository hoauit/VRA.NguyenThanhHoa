function BaiTap18()
    figure;
    imgI = imread('cameraman.tif');
    imgI = rgb2gray(imgI);
    imshow(imgI);
    points = detectHarrisFeatures(imgI);
    hold on;
    subpoints = points.selectStrongest(20);
    plot(subpoints);
end