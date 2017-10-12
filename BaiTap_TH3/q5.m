function q5(n)
    imgTrainAll = loadMNISTImages('train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('train-labels.idx1-ubyte');
    
    Mdl = fitcknn(imgTrainAll' , lblTrainAll);
    
    imgTestAll = loadMNISTImages('t10k-images.idx3-ubyte');
    imgTest = imgTestAll(:, n);
    lblPredictTest = predict(Mdl, imgTest');
    fprintf('Ket qua nhan dang anh thu %d trong tap test la %d\n', n, lblPredictTest);
end