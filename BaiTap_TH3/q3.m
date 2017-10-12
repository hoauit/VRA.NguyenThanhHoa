function q3(n)
    %Load du lieu
    imgTrainAll = loadMNISTImages ('train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels ('train-labels.idx1-ubyte');
    imgTestAll = loadMNISTImages ('t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels ('t10k-labels.idx1-ubyte');

    nTrainImages = size(imgTrainAll,2);
    count = zeros(10,1);
    for i=1:nTrainImages
        label = lblTrainAll(i)+1;
        count(label,1) = count(label,1)+1;
    end
    for i=1:10
        fprintf('\n So anh co nhan %d la %d \n',i-1,count(i));
    end
end