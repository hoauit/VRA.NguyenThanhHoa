function BaiTap17()
    figure;
    imgI = imread('cameraman.tif');
    imgI = rgb2gray(imgI);
    imshow(imgI);
    points = detectSURFFeatures(imgI);
    hold on;
    subpoints = points.selectStrongest(20);
    plot(subpoints);
end