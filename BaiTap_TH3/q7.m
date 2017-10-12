function q7(n)
    imgTrainAll = loadMNISTImages('train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('train-labels.idx1-ubyte');
    imgTestAll = loadMNISTImages('t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('t10k-labels.idx1-ubyte');
    
    Mdl = fitcknn(imgTrainAll' , lblTrainAll);
    arrImagesNTest = [];
    for i = 1:size(imgTestAll, 2)
       if (lblTestAll(i) == n)
          arrImagesNTest = [arrImagesNTest, imgTestAll(:, i)];
       end
    end
    countFail = 0;
    for i = 1:size(arrImagesNTest,2)
        imgTest = arrImagesNTest(:, i);
        lblPredictTest = predict(Mdl, imgTest');
        if (lblPredictTest ~= n)
            countFail = countFail + 1;
        end
    end
    
    fprintf('So anh co label %d bi nhan dang sai la %d\n', n, countFail);
end